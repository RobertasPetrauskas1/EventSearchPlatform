package com.Projektas.EventSearchPlatform.models;

import com.Projektas.EventSearchPlatform.customValidators.PhoneNumberConstraint;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@Entity
@Table(name = "event")
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private Integer fk_user_id;
    private String name;
    private String fk_event_type;
    private LocalDate date;
    private String time;
    private Integer duration;
    private String fk_city;
    private Integer fk_place;
    @PhoneNumberConstraint
    private String phone_number;
    private String website;
    private String facebook;
    private String description;
    private String tickets;

}
