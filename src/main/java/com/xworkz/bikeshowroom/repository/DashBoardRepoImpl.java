package com.xworkz.bikeshowroom.repository;

import com.xworkz.bikeshowroom.entity.BikeEntity;
import com.xworkz.bikeshowroom.entity.BranchEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;

@Repository
@Slf4j
public class DashBoardRepoImpl implements DashBoardRepo{

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public boolean addNewBranch(BranchEntity branchEntity) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            branchEntity.setCreatedBy(branchEntity.getManagerName());
            branchEntity.setCreatedTime(LocalDateTime.now());
            entityManager.getTransaction().begin();
            entityManager.persist(branchEntity);
            entityManager.getTransaction().commit();
            return true;
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

    @Override
    public boolean addNewBike(BikeEntity bikeEntity) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(bikeEntity);
            entityManager.getTransaction().commit();
            return true;
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

    @Override
    public boolean checkBranchAlreadyExists(String branchName) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("checkbranchexistance");
            query.setParameter("branchname",branchName);
            Object object = query.getSingleResult();
            if(object!=null){
                return true;
            }else{
                return false;
            }
        }catch (Exception e) {
            log.error(e.getMessage());
            return false;
        }
    }

    @Override
    public boolean checkModelAlreadyExists(String modelName) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("checkmodelexistance");
            query.setParameter("modelname",modelName);
            Object object=query.getSingleResult();
            if(object!=null){
                return true;
            }
            else {
                return false;
            }
        }catch (Exception e){
            log.error(e.getMessage());
            return false;
        }
    }

    @Override
    public boolean addBikeAndBranchToShowroom(int branchId, int bikeId) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("addshowroom");
            query.setParameter("branchId",branchId);
            query.setParameter("bikeId",bikeId);
            int result1=query.executeUpdate();
            entityManager.getTransaction().commit();
            if (result1==1){
                return true;
            }else {
                return false;
            }
        }catch (Exception e){
            log.info(e.getMessage());
            System.out.println(e.getMessage());
            return false;
        }
    }

    @Override
    public List<BikeEntity> listOfBikesNotSelected() {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("listofbikesnotselected");
            List<BikeEntity> list=query.getResultList();
            return list;
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
    public List<BikeEntity> notFullBranchList() {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("branchwithlimitedbikeslist");
            List<BikeEntity> list=query.getResultList();
            return list;
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
    public int totalBikeCount() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("totalbikes");
            Long count = (Long) query.getSingleResult();
            return Math.toIntExact(count);
        } catch (Exception e) {
            log.error(e.getMessage());
            entityManager.getTransaction().rollback();
            return -1;
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }

    @Override
    public int totalBranchCount() {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("totalbranches");
            Long count= (Long) query.getSingleResult();
            return Math.toIntExact(count);
        }catch (Exception e){
            log.error(e.getMessage());
            entityManager.getTransaction().rollback();
            return -1;
        }finally {
            if (entityManager!=null) {
                entityManager.close();

            }
        }
    }

    @Override
    public List<BikeEntity> getAllBikes() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("getAllBikes");
            List<BikeEntity> list = query.getResultList();
            entityManager.getTransaction().commit();
            return list;
        } catch (Exception e) {
            log.error("Error fetching all bikes: {}", e.getMessage());
            entityManager.getTransaction().rollback();
            return null;
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }

    }

    @Override
    public List<BranchEntity> getAllBranches() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("getAllBranches");
            List<BranchEntity> list = query.getResultList();
            entityManager.getTransaction().commit();
            return list;
        } catch (Exception e) {
            log.error("Error fetching all branches: {}", e.getMessage());
            entityManager.getTransaction().rollback();
            return null;
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }
}
