package com.Projektas.EventSearchPlatform.controlers;

import com.Projektas.EventSearchPlatform.models.Event;
import com.Projektas.EventSearchPlatform.models.Place;
import com.Projektas.EventSearchPlatform.repositories.*;
import com.Projektas.EventSearchPlatform.utils.Messages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.*;

@RestController
@RequestMapping("/place")
@CrossOrigin
public class PlaceController {

    @Autowired
    private PlaceRepo placeRepo;
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private PlaceTypeRepo placeTypeRepo;
    @Autowired
    private CityRepo cityRepo;

    @GetMapping
    public Iterable<Place> getAllPlaces(){ return placeRepo.findAll(); }

    @GetMapping("/{id}")
    public ResponseEntity<Object> getPlace(@PathVariable Integer id){
        try {
            Place e = placeRepo.findById(id).get();
            return new ResponseEntity<>(e, HttpStatus.OK);
        }
        catch (NoSuchElementException ex){
            return Messages.errorMsg("Place with id:" + id + " not found");
        }
    }
    @GetMapping(params = {"limit", "offset"})
    public List<Object> getPlaces(@RequestParam("limit") Integer limit,
                                  @RequestParam("offset") Integer offset){
        try{
            if(limit > 0 && offset >= 0) {
                List<Object> res = new ArrayList<>();
                List<Place> places = placeRepo.limitAndOffsetPlaces(limit, offset);
                for (Place place : places) {
                    res.add(place.toPreview());
                }
                return res;
            }else{
                Map<String, Object> err = new LinkedHashMap<>();
                err.put("timestamp", LocalDateTime.now());
                err.put("status", HttpStatus.BAD_REQUEST);
                err.put("error", "Limit cant be less than 1. Offset cant be less than 0.");
                List<Object> list = new ArrayList<>();
                list.add(err);
                return list;
            }
        } catch (MethodArgumentTypeMismatchException e){
            List<Object> temp = new ArrayList<>();
            temp.add(Messages.errorMsgMap("Wrong imput for limit and offset"));
            return temp;
        }
    }
    @GetMapping("/search/{str}")
    public List<Object> searchPlaces(@PathVariable("str") String str){
        List<Place> fullList = placeRepo.searchPlaces(str);
        List<Object> previewList = new ArrayList<>();
        for(Place e : fullList){
            previewList.add(e.toPreview());
        }
        return previewList;
    }
    @GetMapping("/search/city/{city}")
    public List<Object> searchPlacesByCity(@PathVariable("city") String city){
        List<Place> fullList = placeRepo.searchPlacesByCity(city);
        List<Object> previewList = new ArrayList<>();
        for(Place e : fullList){
            previewList.add(e.toPreview());
        }
        return previewList;
    }
    @GetMapping("/search/category/{category}")
    public List<Object> searchPlacesByCategory(@PathVariable("category") String category){
        List<Place> fullList = placeRepo.searchPlacesByCategory(category);
        List<Object> previewList = new ArrayList<>();
        for(Place e : fullList){
            previewList.add(e.toPreview());
        }
        return previewList;
    }

    @PostMapping
    public ResponseEntity<Object> addPlace(@RequestBody @Valid Place place){
        boolean isUser = userRepo.findById(place.getFk_user_id()).isPresent();
        boolean isPlaceType = placeTypeRepo.findById(place.getFk_place_type()).isPresent();
        boolean isCity = cityRepo.findById(place.getFk_city()).isPresent();
        if(isUser && isPlaceType && isCity) {
            placeRepo.save(place);
            return new ResponseEntity<>("Saved", HttpStatus.OK);
        }else{
            return Messages.printPlaceValidationErrors(isUser, isPlaceType, isCity);
        }
    }
    @PutMapping("/{id}")
    public ResponseEntity<Object> updateEvent(@RequestBody @Valid Place place, @PathVariable Integer id){
        Place u = place;
        boolean isUser = userRepo.findById(place.getFk_user_id()).isPresent();
        boolean isPlaceType = placeTypeRepo.findById(place.getFk_place_type()).isPresent();
        boolean isCity = cityRepo.findById(place.getFk_city()).isPresent();

            if (placeRepo.findById(id).isPresent()) {
                if (isUser && isPlaceType && isCity) {
                    u.setId(id);
                    placeRepo.save(u);
                    return new ResponseEntity<>("Saved", HttpStatus.OK);
                } else {
                    return Messages.printPlaceValidationErrors(isUser, isPlaceType, isCity);
                }
            } else {
                return Messages.errorMsg("Place with id:" + id + " not found");
            }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> deleteEvent(@PathVariable Integer id){
        try {
            placeRepo.deleteById(id);
            return new ResponseEntity<>("Saved", HttpStatus.OK);
        }
        catch(EmptyResultDataAccessException e){
            return Messages.errorMsg("No place with id: " + id + " found");
        }
    }
}
