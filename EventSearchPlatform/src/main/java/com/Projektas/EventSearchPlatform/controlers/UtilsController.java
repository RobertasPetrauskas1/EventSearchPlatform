package com.Projektas.EventSearchPlatform.controlers;

import com.Projektas.EventSearchPlatform.models.City;
import com.Projektas.EventSearchPlatform.models.EventType;
import com.Projektas.EventSearchPlatform.models.PlaceType;
import com.Projektas.EventSearchPlatform.repositories.CityRepo;
import com.Projektas.EventSearchPlatform.repositories.EventTypeRepo;
import com.Projektas.EventSearchPlatform.repositories.PhotosRepo;
import com.Projektas.EventSearchPlatform.repositories.PlaceTypeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/utils")
@CrossOrigin
public class UtilsController {
    @Autowired
    private CityRepo cityRepo;
    @Autowired
    private EventTypeRepo eventTypeRepo;
    @Autowired
    private PlaceTypeRepo placeTypeRepo;
    @Autowired
    private PhotosRepo photosRepo;


    @GetMapping("/cities")
    public Iterable<City> getAllCities(){
        return cityRepo.findAll();
    }
    @GetMapping("/eventTypes")
    public Iterable<EventType> getAllEventTypes(){
        return eventTypeRepo.findAll();
    }
    @GetMapping("/placeTypes")
    public Iterable<PlaceType> getAllPlaceTypes(){
        return placeTypeRepo.findAll();
    }
    @GetMapping("/nextPhotoId")
    public int getNextPhotoId(){return photosRepo.getNextId();}
}
