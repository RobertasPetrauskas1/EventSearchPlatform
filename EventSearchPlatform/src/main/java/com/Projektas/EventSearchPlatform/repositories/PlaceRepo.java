package com.Projektas.EventSearchPlatform.repositories;

import com.Projektas.EventSearchPlatform.models.Place;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PlaceRepo extends CrudRepository<Place, Integer> {
    @Query(value = "SELECT * FROM place LIMIT ?1 OFFSET ?2", nativeQuery = true)
    public List<Place> limitAndOffsetPlaces(Integer limit, Integer offset);

    @Query(value = "SELECT * FROM place WHERE place.name LIKE CONCAT('%',:str,'%') OR place.description LIKE CONCAT('%',:str,'%') ", nativeQuery = true)
    public List<Place> searchPlaces(@Param("str") String str);

    @Query(value = "SELECT * FROM place WHERE place.fk_city = :city", nativeQuery = true)
    public List<Place> searchPlacesByCity(@Param("city") String city);

    @Query(value = "SELECT * FROM place WHERE place.fk_place_type = :category", nativeQuery = true)
    public List<Place> searchPlacesByCategory(@Param("category") String category);
}
