package com.xworkz.bikeshowroom.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class UserRegistrationDto {
    private Integer id;
    private String fullName;
    private String email;
    private String phone;
    private Integer age;
    private String address;
    private String dlNumber;
    private String showroom;
    private String bikeModel;
    private String testRideOption;
    private String rideDate;
    private String rideTime;
    private MultipartFile profilePhoto;
    private String profilePicture;
    private String status;
}
