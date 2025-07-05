package com.xworkz.bikeshowroom.repository;

import com.xworkz.bikeshowroom.entity.UserLoginEntity;

import java.util.List;

public interface UserRegistrationRepo {
    Long emailExists(String email);
    List<String> getBikeByBranch(String branchName);
    UserLoginEntity userLogin(String email);
    boolean loginCount(String email);
    void timer(String email);
    void resetLogin(String email);
    boolean setPassword(String email, String password);
}
