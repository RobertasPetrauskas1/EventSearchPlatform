package com.Projektas.EventSearchPlatform.repositories;

import com.Projektas.EventSearchPlatform.models.EventType;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface EventTypeRepo extends CrudRepository<EventType, String> {
    @Query(value = "SELECT * FROM event_type WHERE singular = :type", nativeQuery = true)
    Optional<EventType> findByIdSingular(String type);
}
