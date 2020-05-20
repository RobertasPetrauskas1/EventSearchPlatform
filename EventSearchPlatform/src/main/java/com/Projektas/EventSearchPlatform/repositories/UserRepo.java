package com.Projektas.EventSearchPlatform.repositories;

import com.Projektas.EventSearchPlatform.models.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface UserRepo extends CrudRepository<User, Integer> {
    @Query(value = "SELECT * FROM user_account WHERE user_account.user_name = :name", nativeQuery = true)
    Optional<User> findByUser_name(String name);
}
