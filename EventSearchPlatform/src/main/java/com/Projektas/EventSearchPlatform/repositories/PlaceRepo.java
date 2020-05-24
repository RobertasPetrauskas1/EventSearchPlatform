package com.Projektas.EventSearchPlatform.repositories;

import com.Projektas.EventSearchPlatform.models.Place;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface PlaceRepo extends CrudRepository<Place, Integer> {
    @Query(value = "SELECT * FROM place LIMIT ?1 OFFSET ?2", nativeQuery = true)
    List<Place> limitAndOffsetPlaces(Integer limit, Integer offset);

    @Query(value = "SELECT * FROM place WHERE place.name LIKE CONCAT('%',:str,'%') OR place.description LIKE CONCAT('%',:str,'%') ", nativeQuery = true)
    List<Place> searchPlaces(@Param("str") String str);

    @Query(value = "SELECT * FROM place WHERE place.fk_city = :city", nativeQuery = true)
    List<Place> searchPlacesByCity(@Param("city") String city);

    @Query(value = "SELECT * FROM place WHERE place.fk_place_type = :category", nativeQuery = true)
    List<Place> searchPlacesByCategory(@Param("category") String category);

    @Query(value = "SELECT * FROM place WHERE place.name = :name", nativeQuery = true)
    Optional<Place> findByName(String name);

    @Query(value = "SELECT Auto_increment FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name = 'place'", nativeQuery = true)
    int getNextId();

    @Query(value = "SELECT * FROM place WHERE place.name LIKE CONCAT('%',:str,'%')", nativeQuery = true)
    List<Place> searchPlacesGetName(@Param("str") String str);
}
