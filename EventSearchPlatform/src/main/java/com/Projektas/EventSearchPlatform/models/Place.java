package com.Projektas.EventSearchPlatform.models;

import com.Projektas.EventSearchPlatform.customValidators.PhoneNumberConstraint;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.Map;

@Data
@Entity
@Table(name = "place")
public class Place {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @NotNull(message = "Place name is required!")
    @Size(max = 255, message = "Name size can't be over 255 characters long!")
    private String name;
    @NotNull(message = "Place type is required!")
    @Size(max = 40, message = "Place type size can't be over 40 characters long!")
    private String fk_place_type;
    @NotNull(message = "Place address is required!")
    @Size(max = 100, message = "Address size can't be over 100 characters long!")
    private String address;
    @NotNull(message = "Place city name is required!")
    @Size(max = 40, message = "Place city name size can't be over 40 characters long!")
    private String fk_city;
    @PhoneNumberConstraint
    private String phone_number;
    @Size(max = 255, message = "Place website size can't be over 255 characters long!")
    private String website;
    @Size(max = 255, message = "Place facebook link size can't be over 255 characters long!")
    private String facebook;
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
