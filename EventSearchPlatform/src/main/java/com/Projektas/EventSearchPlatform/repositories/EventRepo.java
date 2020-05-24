package com.Projektas.EventSearchPlatform.repositories;

import com.Projektas.EventSearchPlatform.models.Event;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface EventRepo extends CrudRepository<Event, Integer> {

    @Query(value = "SELECT * FROM event WHERE date >= CURDATE() ORDER BY event.date LIMIT ?1 OFFSET ?2", nativeQuery = true)
    public List<Event> limitAndOffsetEvents(Integer limit, Integer offset);

    @Query(value = "SELECT * FROM event WHERE event.name LIKE CONCAT('%',:str,'%') OR event.description LIKE CONCAT('%',:str,'%') ", nativeQuery = true)
    public List<Event> searchEvents(@Param("str") String str);

    @Query(value = "SELECT * FROM event WHERE event.fk_city = :city ORDER BY event.date", nativeQuery = true)
    public List<Event> searchEventsByCity(@Param("city") String city);

    @Query(value = "SELECT * FROM event WHERE event.fk_event_type = :category ORDER BY event.date", nativeQuery = true)
    public List<Event> searchEventsByCategory(@Param("category") String category);

    @Query(value = "SELECT * FROM event WHERE event.name = :name", nativeQuery = true)
    Optional<Event> findByName(String name);

    @Query(value = "SELECT Auto_increment FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name = 'event'", nativeQuery = true)
    int getNextId();
}
