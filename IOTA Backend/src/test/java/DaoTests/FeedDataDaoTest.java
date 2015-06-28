///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//
//
//package DaoTests;
//
//import com.mycompany.DAO.FeedDataDao;
//import com.mycompany.Domain.FeedData;
//import java.util.List;
//import org.springframework.transaction.annotation.Transactional ;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.context.transaction.TransactionConfiguration;
//
///**
// *
// * @author Mohey
// */
//@TransactionConfiguration(defaultRollback = false )
//@ContextConfiguration({"classpath:configuration/applicationContext.xml"})
//@Transactional
//@RunWith(SpringJUnit4ClassRunner.class)
//public class FeedDataDaoTest {
//    
//    @Autowired
//    FeedDataDao feedDataDao ;
//    
//    @Test
//    public void testGetAll() throws Exception
//    {
//        List<FeedData> feedData = feedDataDao.getAll() ;
//         System.out.println(feedData.toString());
//        
//        assert(true) : feedData.toString();
//        
//    }
//    
//    
//    @Test
//    public void testInsert() throws Exception
//    {
//        assert(true);
//    }
//    
//}
