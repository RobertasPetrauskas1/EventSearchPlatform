package com.Projektas.EventSearchPlatform.controlers;

import com.Projektas.EventSearchPlatform.models.Photo;
import com.Projektas.EventSearchPlatform.repositories.PhotosRepo;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.*;

import java.awt.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/media")
public class PhotoController {

    @Autowired
    private PhotosRepo photosRepo;

    @GetMapping(value = "/{id}", produces = MediaType.IMAGE_JPEG_VALUE)
    public ResponseEntity<byte[]> getImage(@PathVariable Integer id) throws IOException{
        try {
            Photo photo = photosRepo.findById(id).get();
            ClassPathResource imgFile = new ClassPathResource("user_upload/" + photo.getName());
            byte[] bytes = StreamUtils.copyToByteArray(imgFile.getInputStream());
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(bytes);
        }catch (NoSuchElementException e) {
            ClassPathResource imgFile = new ClassPathResource("user_upload/notFound.jpg");
            byte[] bytes = StreamUtils.copyToByteArray(imgFile.getInputStream());
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(bytes);
        }
    }
}
