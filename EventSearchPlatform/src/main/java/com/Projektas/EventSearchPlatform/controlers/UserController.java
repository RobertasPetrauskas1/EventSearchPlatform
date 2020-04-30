package com.Projektas.EventSearchPlatform.controlers;

import com.Projektas.EventSearchPlatform.models.User;
import com.Projektas.EventSearchPlatform.models.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(path = "/demo")
public class UserController {

    @Autowired
    private UserRepo userRepo;

    @PostMapping(path = "/add")
    public @ResponseBody String addNewUser(@RequestParam String user_name, @RequestParam String email, @RequestParam String password){

        User u = new User();
        u.setName(user_name);
        u.setEmail(email);
        u.setPassword(password);
        userRepo.save(u);
        return "Saved";
    }

    @GetMapping(path = "/all")
    public @ResponseBody Iterable<User> getAllUsers(){
        return userRepo.findAll();
    }
}
