package com.Projektas.EventSearchPlatform.controlers;

import com.Projektas.EventSearchPlatform.models.Place;
import com.Projektas.EventSearchPlatform.repositories.PlaceRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/admin")
@CrossOrigin
public class AdminController {

    @Autowired
    private PlaceRepo placeRepo;

    @PostMapping("/getPlaceId")
    public Integer getPlaceId(@RequestBody String placeName){
        Optional<Place> place = placeRepo.findByName(placeName);
        if(place.isPresent())
            return place.get().getId();

        return -1;
    }
}
