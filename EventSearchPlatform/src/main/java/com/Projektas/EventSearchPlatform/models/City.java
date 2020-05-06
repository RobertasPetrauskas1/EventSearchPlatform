package com.Projektas.EventSearchPlatform.models;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "city")
public class City {
    @Id
    private String name;
}
