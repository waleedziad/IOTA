package com.mycompany.DAO;

import com.mycompany.Domain.Feed;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;


@Repository("FeedDao")
public class FeedDao {
    
    
    @PersistenceContext
    EntityManager entityManager ;
    
    
    
    public Feed insert(Feed feed){
        entityManager.persist(feed);
        return feed;
    }
    
    public List<Feed> getAll()
    {
        List<Feed> feeds = entityManager.createQuery("from Feed ").getResultList();
        return feeds ;
    }
    
}
