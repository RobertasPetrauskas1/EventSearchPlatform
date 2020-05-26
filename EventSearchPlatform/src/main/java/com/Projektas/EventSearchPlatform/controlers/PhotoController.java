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
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
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
//            ClassPathResource imgFile = new ClassPathResource("user_upload/" + photo.getName());
            File imgFile = new File("C:\\Users\\aiste\\OneDrive\\Desktop\\projektas\\EventSearchPlatform\\EventSearchPlatform\\src\\main\\resources\\user_upload\\" + photo.getName());
            byte[] bytes = Files.readAllBytes(Paths.get(imgFile.getPath()));
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(bytes);
        }catch (NoSuchElementException e) {
//            ClassPathResource imgFile = new ClassPathResource("user_upload/notFound.jpg");
            File imgFile = new File("C:\\Users\\aiste\\OneDrive\\Desktop\\projektas\\EventSearchPlatform\\EventSearchPlatform\\src\\main\\resources\\user_upload\\notFound.jpg");
            byte[] bytes = Files.readAllBytes(Paths.get(imgFile.getPath()));
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
    @PostMapping(value = "/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Object> uploadEventImage(@RequestParam("img") MultipartFile img) throws IOException {
        int nextId = photosRepo.getNextId();
        File convertFile = new File("C:\\Users\\aiste\\OneDrive\\Desktop\\projektas\\EventSearchPlatform\\EventSearchPlatform\\src\\main\\resources\\user_upload\\event_photos\\" + nextId + ".jpg");
        boolean created = convertFile.createNewFile();
        FileOutputStream fout = new FileOutputStream(convertFile);
        fout.write(img.getBytes());
        if(created) {
            newImage("event_photos");
            return new ResponseEntity<Object>(nextId, HttpStatus.OK);
        }

        return new ResponseEntity<Object>("Failed", HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
