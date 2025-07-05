package com.xworkz.bikeshowroom.service;

import com.xworkz.bikeshowroom.entity.AdminEntity;
import com.xworkz.bikeshowroom.entity.BikeEntity;

import java.util.List;

public interface AdminLoginService {
    AdminEntity verifyEmail(String email);
    Boolean addOtp(String email,String otp);

}
