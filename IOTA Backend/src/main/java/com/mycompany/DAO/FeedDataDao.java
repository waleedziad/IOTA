package com.mycompany.DAO;

import com.mycompany.Domain.FeedData;
import java.util.ArrayList;
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
    
    public List<FeedData> getAllDashboardTableFeedData()
    {
        List<FeedData> feedData = entityManager.createQuery("from FeedData ORDER BY feedDate DESC").setMaxResults(10).getResultList();
        return feedData ;
    }
    
    public List<FeedData> getAllTableFeedData(Long deviceId)
    {
        List<FeedData> feedData = entityManager.createQuery("from FeedData ORDER BY feedDate DESC").getResultList();
        for(int i=feedData.size()-1;i>=0;i--)
            if(feedData.get(i).getFeed().getDevice().getDeviceId()!=deviceId)
                feedData.remove(i);
        List<FeedData> feedData2=new ArrayList<FeedData>();
        for(int i=0;i<feedData.size() && i<10;i++)
            feedData2.add(feedData.get(i));
        return feedData2 ;
    }
}
