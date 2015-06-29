package com.mycompany.DAO;

import com.mycompany.Domain.FeedData;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;


@Repository("FeedDataDao")
public class FeedDataDao {
    
    
    @PersistenceContext
    EntityManager entityManager ;
    
    
    
    public FeedData insert(FeedData feedData){
        entityManager.persist(feedData);
        return feedData;
    }
    
    public List<FeedData> getAll()
    {
        List<FeedData> feedData = entityManager.createQuery("from FeedData ").getResultList();
        return feedData ;
    }
    
    public List<FeedData> getAllFeedData(Long feedId)
    {
        List<FeedData> feedData = entityManager.createQuery("from FeedData where feedId = :code  ORDER BY feedDate DESC").setParameter("code", feedId).setMaxResults(10).getResultList();
        return feedData ;
    }
    
    public List<FeedData> getAllTableFeedData()
    {
        List<FeedData> feedData = entityManager.createQuery("from FeedData ORDER BY feedDate DESC").setMaxResults(10).getResultList();
        return feedData ;
    }    
}
