package com.Projektas.EventSearchPlatform.models;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "place_type")
public class PlaceType {
    private String name;
    @Id
    private String singular;
}
