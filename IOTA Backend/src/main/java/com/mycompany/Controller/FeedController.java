package com.mycompany.Controller;

import com.mycompany.DAO.FeedDao;
import com.mycompany.Domain.User;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/Feed")
@TransactionConfiguration(defaultRollback = false)
@ContextConfiguration({"classpath:configuration/applicationContext.xml"})
@Transactional
public class FeedController {
    @Autowired
    FeedDao userDao ;
    
    
    @RequestMapping(value = "newFeed.htm",method = RequestMethod.GET)
    public void AcceptInput (
            @RequestParam("firstName") String firstName, 
            @RequestParam("lastName") String lastName,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("registrationDate") String registrationDate,
            HttpServletResponse response) throws Exception
    {
        
        //User user=new User(firstName,lastName,email,password,registrationDate);
        //userDao.insertUser(user);
        response.getWriter().write("User Added");
    }
}
