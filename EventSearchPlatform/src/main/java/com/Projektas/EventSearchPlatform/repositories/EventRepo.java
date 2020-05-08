package com.Projektas.EventSearchPlatform.repositories;

import com.Projektas.EventSearchPlatform.models.Event;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface EventRepo extends CrudRepository<Event, Integer> {

    @Query(value = "SELECT * FROM event LIMIT ?1 OFFSET ?2", nativeQuery = true)
    public List<Event> limitAndOffsetEvents(Integer limit, Integer offset);
}
