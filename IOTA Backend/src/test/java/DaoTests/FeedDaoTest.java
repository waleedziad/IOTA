///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//
//
//package DaoTests;
//
//import com.mycompany.DAO.FeedDao;
//import com.mycompany.Domain.Feed;
//import java.util.List;
//import org.springframework.transaction.annotation.Transactional ;
//import static jdk.nashorn.internal.objects.NativeRegExp.test;
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
//public class FeedDaoTest {
//    
//    @Autowired
//    FeedDao feedDao ;
//    
//    @Test
//    public void testGetAll() throws Exception
//    {
//        List<Feed> feeds = feedDao.getAll() ;
//        System.out.println(feeds.toString());
//        
//        assert(true) : feeds.toString();
//        
//    }
//    
//    
//    @Test
//    public void testInsert() throws Exception
//    {
//        
//        assert(true);
//    }
//    
//}
