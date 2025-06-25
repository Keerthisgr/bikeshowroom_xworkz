package com.xworkz.bikeshowroom.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
public class AdminDto {
    private Integer id;
    private String name;
    private String email;
    private String otp;
}
