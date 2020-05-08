package com.Projektas.EventSearchPlatform.repositories;

import com.Projektas.EventSearchPlatform.models.Event;
import com.Projektas.EventSearchPlatform.models.Place;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PlaceRepo extends CrudRepository<Place, Integer> {
    @Query(value = "SELECT * FROM place LIMIT ?1 OFFSET ?2", nativeQuery = true)
    public List<Place> limitAndOffsetPlaces(Integer limit, Integer offset);
}
