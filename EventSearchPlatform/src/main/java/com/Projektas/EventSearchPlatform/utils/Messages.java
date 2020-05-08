package com.Projektas.EventSearchPlatform.utils;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class Messages {

    static public ResponseEntity<Object> errorMsg(String msg){
        return new ResponseEntity<>(errorMsgMap(msg), HttpStatus.BAD_REQUEST);
    }
    static public Map<String, Object> errorMsgMap(String msg){
        Map<String, Object> body = new LinkedHashMap<>();
        body.put("timestamp", LocalDateTime.now());
        body.put("status", HttpStatus.BAD_REQUEST);
        body.put("error", msg);
        return body;
    }

    static public ResponseEntity<Object> printEventValidationErrors(boolean user, boolean eventType, boolean city, boolean place){
        Map<String, Object> body = new LinkedHashMap<>();
        List<String> errors = new ArrayList<>();
        if(!user){
            errors.add("User with given id not found.");
        }
        if(!eventType){
            errors.add("Invalid event type.");
        }
        if(!city){
            errors.add("Invalid city name.");
        }
        if(!place){
            errors.add("Place with given id not found.");
        }
        body.put("timestamp", LocalDateTime.now());
        body.put("status", HttpStatus.BAD_REQUEST);
        body.put("errors", errors);
        return new ResponseEntity<>(body, HttpStatus.BAD_REQUEST);
    }
}
