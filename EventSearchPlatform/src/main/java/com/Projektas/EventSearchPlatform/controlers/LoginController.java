package com.Projektas.EventSearchPlatform.controlers;

import com.Projektas.EventSearchPlatform.models.Login;
import com.Projektas.EventSearchPlatform.models.User;
import com.Projektas.EventSearchPlatform.repositories.UserRepo;
import com.Projektas.EventSearchPlatform.AuthenticationService.UserAuthenticationService;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping(path = "/access")
@AllArgsConstructor(access = AccessLevel.PACKAGE)
@CrossOrigin
public class LoginController {
    @NotNull
    UserAuthenticationService authentication;
    @NotNull
    UserRepo userRepo;

    @PostMapping("/register")
    public ResponseEntity<Object> register(@RequestBody @Valid User user){
        Map<String, Object> body = new HashMap<>();
        if(!userRepo.findByUser_name(user.getUser_name()).isPresent()) {
            user.setRole("USER");
            userRepo.save(user);
            return login(new Login(user.getUser_name(), user.getPassword()));
        }
        body.put("error", "User with this username already exists");
        return new ResponseEntity<Object>(body, HttpStatus.CONFLICT); // 409 Conflict
    }
    @PostMapping("/login")
    public ResponseEntity<Object> login(@RequestBody @Valid Login login){
        Map<String, Object> body = new HashMap<>();
        Optional<String> token = authentication.login(login.getUsername(), login.getPassword());
        if(token.isPresent() && !token.get().equals("INVALID")){
            body.put("token", token.get());
            return new ResponseEntity<Object>(body, HttpStatus.OK);
        }else{
            body.put("error", "Username and/or password incorrect");
            return new ResponseEntity<Object>(body, HttpStatus.BAD_REQUEST); // 400 Bad request
        }
    }
    @PostMapping("/logout")
    public String logout(@RequestBody String token) {
        System.out.println(token);
        if(authentication.logout(token)) {
            return "Success";
        }
        return "User with this token not found";
    }
}
