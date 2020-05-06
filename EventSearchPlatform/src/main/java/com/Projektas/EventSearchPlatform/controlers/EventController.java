package com.Projektas.EventSearchPlatform.controlers;

import com.Projektas.EventSearchPlatform.models.Event;
import com.Projektas.EventSearchPlatform.repositories.EventRepo;
import com.Projektas.EventSearchPlatform.utils.Messages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDate;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/event")
public class EventController {
    @Autowired
    private EventRepo eventRepo;

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
    }
    @PostMapping
    public ResponseEntity<Object> addEvent(@RequestBody @Valid Event event){
        eventRepo.save(event);
        return new ResponseEntity<>("Saved", HttpStatus.OK);
    }
    @PutMapping("/{id}")
    public ResponseEntity<Object> updateUser(@RequestBody @Valid Event event, @PathVariable Integer id){
        Event u = event;
        if(eventRepo.findById(id).isPresent()) {
            u.setId(id);
            eventRepo.save(u);
            return new ResponseEntity<>("Saved", HttpStatus.OK);
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
