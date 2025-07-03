package com.xworkz.bikeshowroom.repository;

import com.xworkz.bikeshowroom.dto.BikeDto;
import com.xworkz.bikeshowroom.dto.BranchDto;
import com.xworkz.bikeshowroom.entity.*;
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

    @Override
    public BranchEntity findById(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            em.getTransaction().begin();
            Query query = em.createNamedQuery("findById");
            query.setParameter("id", id);
            BranchEntity branch = (BranchEntity) query.getSingleResult();
            em.getTransaction().commit();
            return branch;
        } catch (Exception e) {
            em.getTransaction().rollback();
            return null;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public void updateBranchDetails(BranchDto dto) {
        EntityManager em = entityManagerFactory.createEntityManager();
        log.info("Updating branch with ID: " + dto.getId());

        try {
            em.getTransaction().begin();

            Query query = em.createNamedQuery("updateBranchDetails");
            query.setParameter("branchName", dto.getBranchName());
            query.setParameter("location", dto.getLocation());
            query.setParameter("number", dto.getNumber());
            query.setParameter("managerName", dto.getManagerName());
            query.setParameter("email", dto.getEmail());
            query.setParameter("status", dto.getStatus());
            query.setParameter("id", dto.getId());

            query.executeUpdate();
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new RuntimeException("Error updating branch: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    @Override
    public BikeEntity findBikeById(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            em.getTransaction().begin();
            Query query = em.createNamedQuery("findBikeById");
            query.setParameter("id", id);
            BikeEntity bike = (BikeEntity) query.getSingleResult();
            em.getTransaction().commit();
            return bike;
        } catch (Exception e) {
            em.getTransaction().rollback();
            return null;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public void updateBikeDetails(BikeDto dto) {
        EntityManager em = entityManagerFactory.createEntityManager();

        try {
            em.getTransaction().begin();
            Query query = em.createNamedQuery("updateBikeDetails");
            query.setParameter("model", dto.getModel());
            query.setParameter("bikename", dto.getBikename());
            query.setParameter("engine", dto.getEngine());
            query.setParameter("milage", dto.getMilage());
            query.setParameter("price", dto.getPrice());
            query.setParameter("color", dto.getColor());
            query.setParameter("id", dto.getId());

            query.executeUpdate();
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new RuntimeException("Error updating bike: " + e.getMessage());
        } finally {
            if (em != null) em.close();
        }
    }

    @Override
    public boolean deleteBranch(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();

        try {
            em.getTransaction().begin();
            Query query = em.createNamedQuery("deleteBranchById");
            query.setParameter("id", id);

            int deleted = query.executeUpdate();
            em.getTransaction().commit();
            return deleted > 0;

        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;

        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public boolean deleteBike(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();

        try {
            em.getTransaction().begin();
            Query query = em.createNamedQuery("deleteBikeById");
            query.setParameter("id", id);

            int deleted = query.executeUpdate();
            em.getTransaction().commit();
            return deleted > 0;

        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
            return false;

        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    @Override
    public boolean saveLogin(UserLoginEntity userLoginEntity) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(userLoginEntity);
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
    public boolean register(UserRegistrationEntity userRegistrationEntity) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            userRegistrationEntity.setCreatedBy(userRegistrationEntity.getFullName());
            userRegistrationEntity.setCreatedTime(LocalDateTime.now());
            entityManager.getTransaction().begin();
            entityManager.persist(userRegistrationEntity);
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
    public boolean followUp(FollowUpEntity followUpEntity) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(followUpEntity);
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
    public List<String> branchList() {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("branchName");
            List<String> list = query.getResultList();
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
    public int totalUserCount() {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("totalusers");
            Long count= (Long) query.getSingleResult();
            return Math.toIntExact(count);
        }catch (Exception e){
            log.error(e.getMessage());
            entityManager.getTransaction().rollback();
            return -1;
        }finally {
            if (entityManager!=null){
                entityManager.close();
            }
        }
    }
}
