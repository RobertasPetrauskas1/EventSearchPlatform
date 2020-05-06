package com.Projektas.EventSearchPlatform.utils;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.Map;

public class Messages {

    static public ResponseEntity<Object> errorMsg(String msg){
        Map<String, Object> body = new LinkedHashMap<>();
        body.put("timestamp", LocalDateTime.now());
        body.put("status", HttpStatus.BAD_REQUEST);
        body.put("error", msg);
        return new ResponseEntity<>(body, HttpStatus.BAD_REQUEST);
    }
}
