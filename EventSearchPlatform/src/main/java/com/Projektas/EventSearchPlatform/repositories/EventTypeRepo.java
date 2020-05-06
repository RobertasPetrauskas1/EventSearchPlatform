package com.Projektas.EventSearchPlatform.repositories;

import com.Projektas.EventSearchPlatform.models.EventType;
import org.springframework.data.repository.CrudRepository;

public interface EventTypeRepo extends CrudRepository<EventType, String> {
}
