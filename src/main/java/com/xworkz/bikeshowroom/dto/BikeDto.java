package com.xworkz.bikeshowroom.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;
@Data
public class BikeDto {
    private Integer id;
    private String model;
    private String bikename;
    private String engine;
    private String milage;
    private Long price;
    private String color;
    private MultipartFile frontview;
    private String frontimage;
    private MultipartFile backview;
    private String backimage;
    private MultipartFile leftview;
    private String leftimage;
    private MultipartFile rightview;
    private String rightimage;
}
