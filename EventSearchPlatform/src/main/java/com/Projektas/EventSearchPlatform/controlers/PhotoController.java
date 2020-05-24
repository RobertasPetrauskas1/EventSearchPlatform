package com.Projektas.EventSearchPlatform.controlers;

import com.Projektas.EventSearchPlatform.models.Photo;
import com.Projektas.EventSearchPlatform.repositories.PhotosRepo;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ResourceUtils;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/media")
@CrossOrigin
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
    @PostMapping
    public ResponseEntity<Object> newImage(@RequestBody String folder){
        int nextId = photosRepo.getNextId();
        Photo photo = new Photo();
        photo.setName(folder + "/" + nextId + ".jpg");
        photosRepo.save(photo);
        return new ResponseEntity<Object>("Success", HttpStatus.OK);
    }
}
