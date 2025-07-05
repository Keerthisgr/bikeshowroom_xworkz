package com.xworkz.bikeshowroom.repository;

import com.xworkz.bikeshowroom.entity.UserLoginEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;

@Repository
public class UserRegistrationRepoImpl implements UserRegistrationRepo{

    private static final Logger log = LoggerFactory.getLogger(AdminLoginRepoImpl.class);
    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public Long emailExists(String email) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("checkemailexists");
            query.setParameter("email",email);
            Long result=(Long) query.getSingleResult();
            return result;
        }catch (Exception e){
            log.error(e.getMessage());
            entityManager.getTransaction().rollback();
            return null;
        }finally {
            if (entityManager!=null){
                entityManager.close();
            }
        }
    }

    @Override
    public List<String> getBikeByBranch(String branchName) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query1 = entityManager.createNamedQuery("getbranchnamefromid");
            query1.setParameter("branchName",branchName);
            int id= (int) query1.getSingleResult();
            System.out.println(id);
            Query query = entityManager.createNamedQuery("getbikenamebybranch");
            query.setParameter("branchid",id);
            List<String> bike= query.getResultList();
            return bike;
        }catch (Exception e){
            log.error(e.getMessage());
            return null;
        }
    }

    @Override
    public UserLoginEntity userLogin(String email) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("getuserdata");
            query.setParameter("email",email);
            UserLoginEntity userLoginEntity = (UserLoginEntity) query.getSingleResult();
            return userLoginEntity;
        }catch (Exception e){
            log.error(e.getMessage());
            return null;
        }
    }

    @Override
    public boolean loginCount(String email) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("logincount");
            query.setParameter("email", email);
            int update=query.executeUpdate();
            entityManager.getTransaction().commit();
            if (update==1){
                return true;
            }else {
                return false;
            }
        }catch (Exception e){
            log.error(e.getMessage());
            return false;
        }
    }

    @Override
    public void timer(String email) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("timercount");
            query.setParameter("email", email);
            query.setParameter("time", LocalDateTime.now());
            int update = query.executeUpdate();
            entityManager.getTransaction().commit();
        }catch (Exception e){
            log.error(e.getMessage());
        }
    }

    @Override
    public void resetLogin(String email) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("resetlogin");
            query.setParameter("email", email);
            int update = query.executeUpdate();
            entityManager.getTransaction().commit();

        }catch (Exception e){
            log.error(e.getMessage());
            entityManager.getTransaction().rollback();
        }finally {
            if (entityManager!=null){
                entityManager.close();
            }
        }
    }

    @Override
    public boolean setPassword(String email, String password) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("setpassword");
            query.setParameter("password",password);
            query.setParameter("email", email);
            int update=query.executeUpdate();
            entityManager.getTransaction().commit();
            return  true;
        }catch (Exception e){
            log.error(e.getMessage());
            entityManager.getTransaction().rollback();
            return false;
        }finally {
            if (entityManager!=null){
                entityManager.close();
            }
        }
    }
}
