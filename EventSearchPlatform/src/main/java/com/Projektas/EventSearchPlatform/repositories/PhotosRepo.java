package com.Projektas.EventSearchPlatform.repositories;

import com.Projektas.EventSearchPlatform.models.Photo;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface PhotosRepo extends CrudRepository<Photo, Integer> {
    @Query(value = "SELECT Auto_increment FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name = 'photos'", nativeQuery = true)
    int getNextId();
}
