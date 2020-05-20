package com.Projektas.EventSearchPlatform.AuthenticationService;

import com.Projektas.EventSearchPlatform.models.User;
import com.Projektas.EventSearchPlatform.repositories.UserRepo;
import lombok.AllArgsConstructor;
import org.apache.commons.collections4.BidiMap;
import org.apache.commons.collections4.bidimap.DualHashBidiMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;
import java.util.UUID;

@Service
@AllArgsConstructor
public class UUIDAuthenticationService implements UserAuthenticationService {

    @Autowired
    UserRepo userRepo;

    static BidiMap<String, User> active = new DualHashBidiMap<>();

    @Override
    public Optional<String> login(String username, String password) {
       final String uuid = UUID.randomUUID().toString();
       Optional<User> u = userRepo.findByUser_name(username);
       if(!u.isPresent()) {
           return Optional.ofNullable(null);
       }

       if(username.equals(u.get().getUser_name()) && password.equals(u.get().getPassword())){
           if(!active.containsValue(u.get())) {
               active.put(uuid, u.get());
               return Optional.ofNullable(uuid);
           }else{
               return Optional.ofNullable(active.getKey(u.get()));
           }
       }
       return Optional.ofNullable("INVALID");
    }

    @Override
    public Optional<User> findByToken(String token) {
        return Optional.ofNullable(active.get(token));
    }

    @Override
    public boolean logout(String token) {
        if(active.containsKey(token)) {
            active.remove(token);
            return true;
        }
        return false;
    }
}
