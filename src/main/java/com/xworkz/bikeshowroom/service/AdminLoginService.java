package com.xworkz.bikeshowroom.service;

import com.xworkz.bikeshowroom.entity.AdminEntity;

public interface AdminLoginService {
    AdminEntity verifyEmail(String email);
    Boolean addOtp(String email,String otp);
}
