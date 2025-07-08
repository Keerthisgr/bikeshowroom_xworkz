package com.xworkz.bikeshowroom.service;

import com.xworkz.bikeshowroom.dto.UserRegistrationDto;
import org.springframework.ui.Model;

import java.util.List;

public interface UserRegistrationService {
    Long emailExists(String email);
    List<String> getBikeByBranch(String branchId);
    int userLogin(String email, String password, Model model);
    boolean setPassword(String email, String password);
    void resetLogin(String email);
    boolean isFullNameExists(String fullName);

    boolean isEmailExists(String email);

    boolean isPhoneExists(String phone);

    boolean isDlNumberExists(String dlNumber);}
