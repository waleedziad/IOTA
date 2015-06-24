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
    
    
    
    public Boolean insertUser(User user){
        List<User> users=getAllUsers();
        for(int i=0;i<users.size();i++){
            if(users.get(i).getEmail().equalsIgnoreCase(user.getEmail())){
                return false;
            }
        }
        
        entityManager.persist(user);
        return true;
    }
    
    public List<User> getAllUsers()
    {
        List<User> users = entityManager.createQuery("from User ").getResultList();
        return users ;
    }
    
}
