package com.Projektas.EventSearchPlatform.repositories;

import com.Projektas.EventSearchPlatform.models.Photo;
import org.springframework.data.repository.CrudRepository;

public interface PhotosRepo extends CrudRepository<Photo, Integer> {
}
