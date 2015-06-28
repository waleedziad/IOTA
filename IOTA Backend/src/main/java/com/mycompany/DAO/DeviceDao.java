package com.mycompany.DAO;

import com.mycompany.Domain.Device;
import com.mycompany.Domain.Feed;
import com.mycompany.Domain.FeedData;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository("DeviceDao")
public class DeviceDao {

    @PersistenceContext
    EntityManager entityManager;

    public Device insert(Device device) {
        entityManager.persist(device);
        return device;
    }

    public List<Device> getAll() {
        List<Device> devices = entityManager.createQuery("from Device ").getResultList();
        return devices;
    }

    public List<Device> getAllUserDevices(Long id) {
        List<Device> devices = entityManager.createQuery("from Device where userId = :code ").setParameter("code", id).getResultList();
        return devices;
    }

    public ArrayList<ArrayList<Integer>> getAllGraphData(Long id) {
        List<Device> devices = getAllUserDevices(id);
        ArrayList<ArrayList<Integer>> points = new ArrayList<ArrayList<Integer>>();
        ArrayList<Integer> emptyPoints=new ArrayList<Integer>();
        for(int i=0;i<10;i++)
            emptyPoints.add(0);
        
        for (int i = 0; i < devices.size(); i++) {
            Long deviceId = devices.get(i).getDeviceId();
            List<Feed> feeds = entityManager.createQuery("from Feed where deviceId = :code ").setParameter("code",deviceId).setMaxResults(1).getResultList();
            if(feeds.isEmpty()){
                points.add(emptyPoints);
                continue;
            }
            
            ArrayList<Integer> feedDataPoints=new ArrayList<Integer>();
            
            Long feedId = feeds.get(0).getFeedId();
             List<FeedData> feedData = entityManager.createQuery("from FeedData where feedId = :code ORDER BY feedDate DESC").setParameter("code",feedId).setMaxResults(10).getResultList();
             for(int j=0;j<feedData.size();j++)
                 feedDataPoints.add(Integer.parseInt(feedData.get(j).getFeedValue()));
             
             points.add(feedDataPoints);
        }
        return points;
    }

}
