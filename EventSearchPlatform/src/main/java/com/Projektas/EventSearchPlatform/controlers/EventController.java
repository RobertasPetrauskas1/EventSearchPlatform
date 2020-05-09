package com.Projektas.EventSearchPlatform.controlers;

import com.Projektas.EventSearchPlatform.models.Event;
import com.Projektas.EventSearchPlatform.repositories.*;
import com.Projektas.EventSearchPlatform.utils.Messages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import javax.validation.Valid;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@RestController
@RequestMapping("/event")
@CrossOrigin
public class EventController {
    @Autowired
    private EventRepo eventRepo;
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private EventTypeRepo eventTypeRepo;
    @Autowired
    private CityRepo cityRepo;
    @Autowired
    private PlaceRepo placeRepo;

    @GetMapping
    public Iterable<Event> getAllEvents(){ return eventRepo.findAll(); }

    @GetMapping("/{id}")
    public ResponseEntity<Object> getEvent(@PathVariable Integer id){
        try {
            Event e = eventRepo.findById(id).get();
            return new ResponseEntity<>(e, HttpStatus.OK);
        }
        catch (NoSuchElementException ex){
            return Messages.errorMsg("Event with id:" + id + " not found");
        }
    }
    @GetMapping(params = {"limit", "offset"})
    public List<Object> getEvents(@RequestParam("limit") Integer limit,
                                               @RequestParam("offset") Integer offset){
        try{
            if(limit > 0 && offset >= 0) {
                List<Object> res = new ArrayList<>();
                List<Event> events = eventRepo.limitAndOffsetEvents(limit, offset);
                for (Event event : events) {
                    res.add(event.toPreview());
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


    @PostMapping(params = {"fk_user_id", "name", "fk_event_type", "date", "time", "duration", "fk_city",
                            "fk_place", "phone_number", "website", "facebook", "description", "tickets"})
    public ResponseEntity<Object> addEvent(@RequestParam Integer fk_user_id, @RequestParam String name,
                                         @RequestParam String fk_event_type,
                                         @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date,
                                         @RequestParam String time, @RequestParam Integer duration,
                                         @RequestParam String fk_city, @RequestParam Integer fk_place,
                                         @RequestParam(required = false) String phone_number,
                                         @RequestParam(required = false) String website,
                                         @RequestParam(required = false) String facebook,
                                         @RequestParam String description,
                                         @RequestParam(required = false) String tickets){
        boolean isUser = userRepo.findById(fk_user_id).isPresent();
        boolean isEventType = eventTypeRepo.findById(fk_event_type).isPresent();
        boolean isCity = cityRepo.findById(fk_city).isPresent();
        boolean isPlace = placeRepo.findById(fk_place).isPresent();
        if(isUser && isEventType && isCity && isPlace) {
            Event e = new Event();
            e.setFk_user_id(fk_user_id);
            e.setName(name);
            e.setFk_event_type(fk_event_type);
            e.setDate(date);
            e.setTime(time);
            e.setDuration(duration);
            e.setFk_city(fk_city);
            e.setFk_place(fk_place);
            e.setPhone_number(phone_number);
            e.setWebsite(website);
            e.setFacebook(facebook);
            e.setDescription(description);
            e.setTickets(tickets);
            eventRepo.save(e);
            return new ResponseEntity<>(e, HttpStatus.OK);
        }else{
            return Messages.printEventValidationErrors(isUser, isEventType, isCity, isPlace);
        }

    }
    @PostMapping
    public ResponseEntity<Object> addEvent(@RequestBody @Valid Event event){
        boolean isUser = userRepo.findById(event.getFk_user_id()).isPresent();
        boolean isEventType = eventTypeRepo.findById(event.getFk_event_type()).isPresent();
        boolean isCity = cityRepo.findById(event.getFk_city()).isPresent();
        boolean isPlace = placeRepo.findById(event.getFk_place()).isPresent();
        if(isUser && isEventType && isCity && isPlace) {
            eventRepo.save(event);
            return new ResponseEntity<>("Saved", HttpStatus.OK);
        }else{
            return Messages.printEventValidationErrors(isUser, isEventType, isCity, isPlace);
        }
    }
    @PutMapping("/{id}")
    public ResponseEntity<Object> updateEvent(@RequestBody @Valid Event event, @PathVariable Integer id){
        Event u = event;
        boolean isUser = userRepo.findById(event.getFk_user_id()).isPresent();
        boolean isEventType = eventTypeRepo.findById(event.getFk_event_type()).isPresent();
        boolean isCity = cityRepo.findById(event.getFk_city()).isPresent();
        boolean isPlace = placeRepo.findById(event.getFk_place()).isPresent();

        if(eventRepo.findById(id).isPresent()) {
            if(isUser && isEventType && isCity && isPlace){
                u.setId(id);
                eventRepo.save(u);
                return new ResponseEntity<>("Saved", HttpStatus.OK);
            }
            else{
                return Messages.printEventValidationErrors(isUser, isEventType, isCity, isPlace);
            }
        }
        else {
            return Messages.errorMsg("Event with id:" + id + " not found");
        }

    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> deleteEvent(@PathVariable Integer id){
        try {
            eventRepo.deleteById(id);
            return new ResponseEntity<>("Saved", HttpStatus.OK);
        }
        catch(EmptyResultDataAccessException e){
            return Messages.errorMsg("No event with id: " + id + " found");
        }
    }

}
