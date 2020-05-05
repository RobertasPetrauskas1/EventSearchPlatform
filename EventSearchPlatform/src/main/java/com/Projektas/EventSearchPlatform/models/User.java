package com.Projektas.EventSearchPlatform.models;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "user_account")
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @NotNull(message = "User name is required!")
    @Size(min = 6, max = 100, message = "User name size must be between 6 and 100 characters long!")
    private String user_name;
    @NotNull(message = "Email is required!")
    @Email(message = "Email is not valid!")
    @Size(max = 255, message = "Email cannot be larger than 255 characters")
    private String email;
    @NotNull(message = "Password is required!")
    @Size(min = 6, max = 200, message = "Password must be between 6 and 200 characters long!")
    private String password;

}
