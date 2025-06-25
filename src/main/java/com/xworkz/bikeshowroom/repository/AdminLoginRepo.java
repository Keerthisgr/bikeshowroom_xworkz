package com.xworkz.bikeshowroom.repository;

import com.xworkz.bikeshowroom.entity.AdminEntity;

public interface AdminLoginRepo {
    AdminEntity verifyEmail(String email);
    boolean addOtp(String email,String otp);
}
