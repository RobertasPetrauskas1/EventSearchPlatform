package com.Projektas.EventSearchPlatform.controlers;

import com.Projektas.EventSearchPlatform.models.Event;
import com.Projektas.EventSearchPlatform.models.Place;
import com.Projektas.EventSearchPlatform.repositories.PlaceRepo;
import com.Projektas.EventSearchPlatform.utils.Messages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import java.time.LocalDateTime;
import java.util.*;

@RestController
@RequestMapping("/place")
@CrossOrigin
public class PlaceController {

    @Autowired
    private PlaceRepo placeRepo;

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
}
