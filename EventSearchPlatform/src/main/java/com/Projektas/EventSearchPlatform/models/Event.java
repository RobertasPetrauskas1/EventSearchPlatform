package com.Projektas.EventSearchPlatform.models;

import com.Projektas.EventSearchPlatform.customValidators.PhoneNumberConstraint;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

@Data
@Entity
@Table(name = "event")
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private Integer fk_user_id;
    @NotNull(message = "Event name is required!")
    @Size(max = 255, message = "Name size can't be over 255 characters long!")
    private String name;
    @NotNull(message = "Event type is required!")
    @Size(max = 40, message = "Event type size can't be over 40 characters long!")
    private String fk_event_type;
    @NotNull(message = "Event date is required!")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate date;
    @NotNull(message = "Event time is required!")
    @Size(max = 255, message = "Event time size can't be over 5 characters long!")
    private String time;
    @NotNull(message = "Event duration is required!")
    private Integer duration;
    @NotNull(message = "Event city name is required!")
    @Size(max = 40, message = "Event city name size can't be over 40 characters long!")
    private String fk_city;
    @NotNull(message = "Event place is required!")
    private Integer fk_place;
    @PhoneNumberConstraint
    private String phone_number;
    @Size(max = 255, message = "Event website size can't be over 255 characters long!")
    private String website;
    @Size(max = 255, message = "Event facebook link size can't be over 255 characters long!")
    private String facebook;
    @NotNull(message = "Event description is required!")
    @Size(max = 65535, message = "Event description size can't be over 65535 characters long!")
    private String description;
    @Size(max = 255, message = "Event ticket link size can't be over 255 characters long!")
    private String tickets;
   // @NotNull(message = "Event photo is required!")
    private Integer fk_photo;

    public Map<String, Object> toPreview(){
        Map<String, Object> body = new LinkedHashMap<>();
        body.put("id", this.id);
        body.put("name", this.name);
        body.put("type", this.fk_event_type);
        body.put("location", this.fk_place);
        body.put("date", this.date);
        body.put("time", this.time);
        body.put("photo", this.fk_photo);
        return body;
    }
}
