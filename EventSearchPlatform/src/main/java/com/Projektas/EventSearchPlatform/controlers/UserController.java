package com.Projektas.EventSearchPlatform.controlers;

import com.Projektas.EventSearchPlatform.models.User;
import com.Projektas.EventSearchPlatform.repositories.UserRepo;
import com.Projektas.EventSearchPlatform.utils.Messages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.NoSuchElementException;

@RestController
@RequestMapping(path = "/user")
@Validated
public class UserController {

    @Autowired
    private UserRepo userRepo;

    @Validated
    @PostMapping(params = {"user_name", "email", "password"})
    public ResponseEntity<Object> addNewUser(@RequestParam
                                                 @NotNull(message = "User name is required!")
                                                 @Size(min = 6, max = 100, message = "User name size must be between 6 and 100 characters long!") String user_name,
                                             @RequestParam
                                                @NotNull(message = "Email is required!")
                                                @Email(message = "Email is not valid!")
                                                @Size(max = 255, message = "Email cannot be larger than 255 characters") String email,
                                             @RequestParam
                                                 @NotNull(message = "Password is required!")
                                                 @Size(min = 6, max = 200, message = "Password must be between 6 and 200 characters long!") String password){
            User u = new User();
            u.setUser_name(user_name);
            u.setEmail(email);
            u.setPassword(password);
            userRepo.save(u);
            return new ResponseEntity<>("Saved", HttpStatus.OK);
    }
    @PostMapping()
    public ResponseEntity<Object> addNewUser(@RequestBody @Valid User user){
            userRepo.save(user);
            return new ResponseEntity<>("Saved", HttpStatus.OK);

    }
    @PutMapping("/{id}")
    public ResponseEntity<Object> updateUser(@RequestBody @Valid User user, @PathVariable Integer id){
        User u = user;

            if(userRepo.findById(id).isPresent()) {
                u.setId(id);
                userRepo.save(u);
                return new ResponseEntity<>("Saved", HttpStatus.OK);
            }
            else {
                return Messages.errorMsg("User with id:" + id + " not found");
            }

    }
    @GetMapping()
    public Iterable<User> getAllUsers(){
        return userRepo.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Object> getUser(@PathVariable Integer id){
        try {
            User u = userRepo.findById(id).get();
            return new ResponseEntity<>(u, HttpStatus.OK);
        }
        catch (NoSuchElementException e){
            return Messages.errorMsg("User with id:" + id + " not found");
        }
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<Object> deleteUser(@PathVariable Integer id){
        try {
            userRepo.deleteById(id);
            return new ResponseEntity<>("User with id: " + id + " deleted", HttpStatus.OK);
        }
        catch(EmptyResultDataAccessException e){
            return Messages.errorMsg("No user with id: " + id + " found");
        }
    }

}
