package com.Projektas.EventSearchPlatform.repositories;

import com.Projektas.EventSearchPlatform.models.Event;
import org.springframework.data.repository.CrudRepository;

public interface EventRepo extends CrudRepository<Event, Integer> {
}
