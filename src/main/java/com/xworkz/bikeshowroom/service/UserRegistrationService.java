package com.xworkz.bikeshowroom.service;

import org.springframework.ui.Model;

import java.util.List;

public interface UserRegistrationService {
    Long emailExists(String email);
    List<String> getBikeByBranch(String branchId);
    int userLogin(String email, String password, Model model);
    boolean setPassword(String email, String password);
    void resetLogin(String email);
}
