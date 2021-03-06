package com.Projektas.EventSearchPlatform.models;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Arrays;
import java.util.Collection;

@Entity
@Table(name = "user_account")
@Data
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
    private String role;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Arrays.asList(new SimpleGrantedAuthority(role));
    }

    @Override
    public String getUsername() {
        return user_name;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
