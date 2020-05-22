package com.Projektas.EventSearchPlatform.repositories;

import com.Projektas.EventSearchPlatform.models.PlaceType;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface PlaceTypeRepo extends CrudRepository<PlaceType, String> {
    @Query(value = "SELECT * FROM place_type WHERE singular = :type", nativeQuery = true)
    Optional<PlaceType> findByIdSingular(String type);
}
