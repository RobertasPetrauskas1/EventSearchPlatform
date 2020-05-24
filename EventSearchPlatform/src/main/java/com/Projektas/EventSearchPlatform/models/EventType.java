package com.Projektas.EventSearchPlatform.models;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@Entity
@Table(name = "event_type")
public class EventType {
    @Size(max = 40)
    private String name;
    @Id
    @NotNull(message = "Event type name is required")
    @Size(max = 40)
    private String singular;
}
