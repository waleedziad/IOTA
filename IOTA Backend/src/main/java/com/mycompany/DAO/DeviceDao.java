package com.mycompany.DAO;

import com.mycompany.Domain.Device;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;


@Repository("DeviceDao")
public class DeviceDao {
    
    
    @PersistenceContext
    EntityManager entityManager ;
    
    
    
    public Device insert(Device device){
        entityManager.persist(device);
        return device;
    }
    
    public List<Device> getAll()
    {
        List<Device> devices = entityManager.createQuery("from Device ").getResultList();
        return devices ;
    }
    
    public List<Device> getAllUserDevices(Long id)
    {
        List<Device> devices = entityManager.createQuery("from Device where userId = :code ").setParameter("code", id).getResultList();
        return devices ;
    }
    
}
