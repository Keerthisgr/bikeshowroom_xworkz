package com.xworkz.bikeshowroom.restController;

import com.xworkz.bikeshowroom.service.UserRegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/")
public class UserValidationRestController {

    @Autowired
    private UserRegistrationService userRegistrationService;

    @GetMapping("/name")
    public ResponseEntity<String> checkFullName(@RequestParam String fullName) {
        if (userRegistrationService.isFullNameExists(fullName)) {
            return ResponseEntity.ok("Name already exists");
        }
        return ResponseEntity.ok("");
    }

    @GetMapping("/validateemail")
    public ResponseEntity<String> checkEmail(@RequestParam String email) {
        if (userRegistrationService.isEmailExists(email)) {
            return ResponseEntity.ok("Email already registered");
        }
        return ResponseEntity.ok("");
    }

    @GetMapping("/phonenumber")
    public ResponseEntity<String> checkPhone(@RequestParam String phone) {
        if (userRegistrationService.isPhoneExists(phone)) {
            return ResponseEntity.ok("Phone number already exists");
        }
        return ResponseEntity.ok("");
    }

    @GetMapping("/dlnumber")
    public ResponseEntity<String> checkDl(@RequestParam("dlnum") String dlNumber) {
        if (userRegistrationService.isDlNumberExists(dlNumber)) {
            return ResponseEntity.ok("DL number already registered");
        }
        return ResponseEntity.ok("");
    }
}

