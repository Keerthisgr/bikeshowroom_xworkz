package com.xworkz.bikeshowroom.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;
@Data
@Entity
@NamedQuery(name = "getuserdata",query = "select u from UserLoginEntity u where u.email =:email")
@NamedQuery(name = "logincount",query = "UPDATE UserLoginEntity u SET u.loginCount = u.loginCount +1  WHERE u.email =:email")
@NamedQuery(name = "timercount",query = "update UserLoginEntity u SET u.timeout =:time  WHERE u.email =:email")
@NamedQuery(name = "resetlogin",query = "update UserLoginEntity u SET u.loginCount = 0  WHERE u.email =:email")
@NamedQuery(name = "setpassword",query = "update UserLoginEntity u set u.password =:password  where u.email =:email")


public class UserLoginEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String email;
    private String password;
    private int loginCount;
    private LocalDateTime timeout;
}
