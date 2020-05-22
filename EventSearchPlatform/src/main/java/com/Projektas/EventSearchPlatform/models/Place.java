package com.Projektas.EventSearchPlatform.models;

import com.Projektas.EventSearchPlatform.customValidators.PhoneNumberConstraint;
import lombok.Data;
import org.springframework.lang.Nullable;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.LinkedHashMap;
import java.util.Map;

@Data
@Entity
@Table(name = "place")
public class Place {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @NotNull(message = "Place creator id is required!")
    private Integer fk_user_id;
    @NotEmpty(message = "Place name is required!")
    @NotNull(message = "Place name is required!")
    @Size(max = 255, message = "Name size can't be over 255 characters long!")
    private String name;
    @NotEmpty(message = "Place type is required!")
    @NotNull(message = "Place type is required!")
    @Size(max = 40, message = "Place type size can't be over 40 characters long!")
    private String fk_place_type;
    @NotEmpty(message = "Place address is required!")
    @NotNull(message = "Place address is required!")
    @Size(max = 100, message = "Address size can't be over 100 characters long!")
    private String address;
    @NotEmpty(message = "Place city name is required!")
    @NotNull(message = "Place city name is required!")
    @Size(max = 40, message = "Place city name size can't be over 40 characters long!")
    private String fk_city;
    @PhoneNumberConstraint
    @Nullable
    private String phone_number;
    @Size(max = 255, message = "Place website size can't be over 255 characters long!")
    private String website;
    @Size(max = 255, message = "Place facebook link size can't be over 255 characters long!")
    private String facebook;
    @NotEmpty(message = "Place description is required")
    @NotNull(message = "Place description is required!")
    @Size(max = 65535, message = "Place description size can't be over 65535 characters long!")
    private String description;
    @Size(max = 40, message = "Place working hour size can't be over 40 characters long!")
    private String working_hours;
    private Integer fk_photo;

    public Map<String, Object> toPreview(){
        Map<String, Object> body = new LinkedHashMap<>();
        body.put("id", this.id);
        body.put("name", this.name);
        body.put("type", this.fk_place_type);
        body.put("city", this.fk_city);
        body.put("location", this.address);
        body.put("photo", this.fk_photo);
        return body;
    }
}
