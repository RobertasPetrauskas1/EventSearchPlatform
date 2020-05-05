package com.Projektas.EventSearchPlatform.repositories;

import com.Projektas.EventSearchPlatform.models.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepo extends CrudRepository<User, Integer> {

}
