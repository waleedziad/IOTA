package com.mycompany.DAO;

import com.mycompany.Domain.User;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;


@Repository("UserDao")
public class UserDao {
    
    
    @PersistenceContext
    EntityManager entityManager ;
    
    
    
    public User insertUser(User user){
        entityManager.persist(user);
        return user;
    }
    
    public List<User> getAllUsers()
    {
        List<User> users = entityManager.createQuery("from User ").getResultList();
        return users ;
    }
    
}
