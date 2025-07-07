package com.xworkz.bikeshowroom.dto;

import lombok.Data;

import java.sql.Date;
import java.sql.Time;

@Data
public class FollowUpDto {
    private Integer id;
    private String fullName;
    private Date date;
    private Time time;
    private String status;
    private String message;
}
