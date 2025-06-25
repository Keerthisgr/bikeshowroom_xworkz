package com.xworkz.bikeshowroom.otpGenerator;

import java.security.SecureRandom;

public class OtpGenerator {
    private static final String DIGITS = "0123456789";

    public static String generateOtp(int length) {
        System.out.println("OTP");
        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(DIGITS.length());
            password.append(DIGITS.charAt(index));
        }
        return password.toString();
    }
}
