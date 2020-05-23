package com.Projektas.EventSearchPlatform.models;

import com.Projektas.EventSearchPlatform.customValidators.PhoneNumberConstraint;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@Entity
@Table(name = "user_bio")
public class UserBio {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @NotNull(message = "Name is required!")
    @Size(min = 3, max = 50, message = "Name must be between 3 and 50 characters long")
    private String name;
    @NotNull(message = "Surname is required!")
    @Size(min = 3, max = 50, message = "Surname must be between 3 and 50 characters long")
    private String surname;
    @PhoneNumberConstraint
    private String phone_number;
    private Boolean subscription;
}
