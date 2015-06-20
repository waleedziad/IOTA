/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package DaoTests;

import com.mycompany.DAO.UserDao;
import com.mycompany.Domain.User;
import java.util.List;
import org.springframework.transaction.annotation.Transactional ;
import static jdk.nashorn.internal.objects.NativeRegExp.test;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

/**
 *
 * @author Mohey
 */
@TransactionConfiguration(defaultRollback = false )
@ContextConfiguration({"classpath:configuration/applicationContext.xml"})
@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
public class UserDaoTest {
    
    @Autowired
    UserDao userDao ;
    
    @Test
    public void testGetAllUsers() throws Exception
    {
        List<User> users = userDao.getAllUsers() ;
        //System.out.println(users.toString());
        if(users.get(0).getFirstName().equalsIgnoreCase("Ahmed"))
            System.out.println(users.toString());
        
        assert(true) : users.toString();
        
    }
    
    
    @Test
    public void testInsertUser() throws Exception
    {
        User user=new User();
        user.setFirstName("Eslam");
        user.setLastName("Alaa");
        user.setEmail("asda@ff.com");
        user.setRegistrationDate("2015-6-7");
        user.setPassword("12345");
        
        userDao.insertUser(user);
        List<User> users = userDao.getAllUsers() ;
        for(int i=0;i<users.size();i++)
            if(users.get(i).getFirstName().equalsIgnoreCase("Eslam")){
                assert(true);
             return;   
            }
        assert(false);
    }
    
}
