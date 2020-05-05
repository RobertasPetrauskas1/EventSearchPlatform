package com.Projektas.EventSearchPlatform.controlers;

import com.Projektas.EventSearchPlatform.models.Event;
import com.Projektas.EventSearchPlatform.repositories.EventRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@RestController
@RequestMapping("/event")
public class EventController {
    @Autowired
    private EventRepo eventRepo;

    @GetMapping
    public Iterable<Event> getAllEvents(){ return eventRepo.findAll(); }

    @GetMapping("/{id}")
    public Event getEvent(@PathVariable Integer id){ return eventRepo.findById(id).get(); }

    @PostMapping
    public String addEvent(@RequestParam Integer fk_user_id, @RequestParam String name,
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

        return "Saved";
    }

    @DeleteMapping("/{id}")
    public String deleteEvent(@PathVariable Integer id){
        eventRepo.deleteById(id);
        return "Deleted";
    }
}
