package com.Projektas.EventSearchPlatform.models;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
public class Login {
    @NotEmpty(message = "Enter username")
    @NotNull(message = "Enter username")
    private String username;
    @NotEmpty(message = "Enter password")
    @NotNull(message = "Enter password")
    private String password;
}
