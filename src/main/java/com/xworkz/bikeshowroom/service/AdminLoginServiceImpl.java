package com.xworkz.bikeshowroom.service;

import com.xworkz.bikeshowroom.entity.AdminEntity;
import com.xworkz.bikeshowroom.repository.AdminLoginRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminLoginServiceImpl implements AdminLoginService{
    @Autowired
    AdminLoginRepo adminLoginRepo;
    @Override
    public AdminEntity verifyEmail(String email){
        return adminLoginRepo.verifyEmail(email);
    }
    @Override
    public Boolean addOtp(String email,String otp){
        return adminLoginRepo.addOtp(email,otp);
    }
}
