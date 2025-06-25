package com.xworkz.bikeshowroom.repository;

import com.xworkz.bikeshowroom.entity.AdminEntity;
import com.xworkz.bikeshowroom.restController.AdminLoginRestController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
@Repository
public class AdminLoginRepoImpl implements AdminLoginRepo{
    private static final Logger log = LoggerFactory.getLogger(AdminLoginRestController.class);
    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public AdminEntity verifyEmail(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("verifylogin");
            query.setParameter("email", email);
            AdminEntity object = (AdminEntity) query.getSingleResult();
            if (object != null) {
                return object;
            }
            return null;
        } catch (Exception e) {
            log.info(e.getMessage());
            return null;
        }
    }

    @Override
    public boolean addOtp(String email, String otp) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("updateotp");
            query.setParameter("otp", otp);
            query.setParameter("email", email);
            int result1 = query.executeUpdate();
            entityManager.getTransaction().commit();
            if (result1 == 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            log.info(e.getMessage());
            System.out.println(e.getMessage());
            return false;
        }
    }
}
