package com.mycompany.Controller;

import com.mycompany.DAO.DeviceDao;
import com.mycompany.DAO.FeedDao;
import com.mycompany.DAO.UserDao;
import com.mycompany.Domain.Device;
import com.mycompany.Domain.Feed;
import com.mycompany.Domain.User;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pages/Dashboard")
@TransactionConfiguration(defaultRollback = false)
@ContextConfiguration({"classpath:configuration/applicationContext.xml"})
@Transactional
@SessionAttributes({"user_id", "devices"})
public class DashboardController {

    @Autowired
    UserDao userDao;

    @Autowired
    DeviceDao deviceDao;

    @Autowired
    FeedDao feedDao;

    @RequestMapping(value = "confirmLogin.htm", method = RequestMethod.POST)
    public ModelAndView AcceptInput(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpServletResponse response) throws Exception {

        ModelAndView modelAndView = new ModelAndView();

        Long userId = null;
        Boolean loginSuccess = false;
        List<User> users = userDao.getAllUsers();
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getEmail().equalsIgnoreCase(username)) {
                if (users.get(i).getPassword().equals(password)) {
                    userId = users.get(i).getUserId();
                    modelAndView.addObject("user_id", userId);
                    loginSuccess = true;
                }
                break;
            }
        }
        //response.getWriter().write("Received " + username + " " + password + " " + loginSuccess.toString());
        if (loginSuccess) {
            ArrayList<Device> devices = (ArrayList<Device>) deviceDao.getAllUserDevices(userId);
            modelAndView.addObject("devices", devices);
            modelAndView.setViewName("index.jsp");
        } else {
            modelAndView.setViewName("login.jsp");
        }
        return modelAndView;
    }

    @RequestMapping(value = "signup.htm", method = RequestMethod.POST)
    public String AcceptInput(
            @RequestParam("firstname") String firstName,
            @RequestParam("lastname") String lastName,
            @RequestParam("password") String password,
            @RequestParam("username") String email,
            HttpServletResponse response) throws Exception {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        String formattedDate = dateFormat.format(cal.getTime());

        User user = new User(firstName, lastName, email, password, formattedDate);
        if (userDao.insertUser(user)) {
            return "login.jsp";
        } else {
            return "signup.html";
        }

        //response.getWriter().write("Received " + username+" "+password+" "+loginSuccess.toString());
    }

    @RequestMapping(value = "adddevice.htm", method = RequestMethod.POST)
    public ModelAndView addDevice(
            @RequestParam("devicename") String deviceName,
            @RequestParam("userId") Long userId,
            HttpServletResponse response) throws Exception {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        String formattedDate = dateFormat.format(cal.getTime());
        Device device = new Device();
        device.setUserId(userId);
        device.setDeviceName(deviceName);
        device.setCreationDate(formattedDate);
        deviceDao.insert(device);

        ModelAndView modelAndView = new ModelAndView();
        List<Device> devices = deviceDao.getAllUserDevices(userId);
        modelAndView.addObject("devices", devices);

        modelAndView.setViewName("index.jsp");

        return modelAndView;

        //response.getWriter().write("Received " + username+" "+password+" "+loginSuccess.toString());
    }

    @RequestMapping(value = "addfeed.htm", method = RequestMethod.GET)
    public ModelAndView redirectToAddFeed(
            @RequestParam("id") Long userId,
            HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Device> devices = deviceDao.getAllUserDevices(userId);
        modelAndView.addObject("devices", devices);

        modelAndView.setViewName("addfeed.jsp");

        return modelAndView;
    }

    @RequestMapping(value = "addnewfeed.htm", method = RequestMethod.POST)
    public String addFeed(
            @RequestParam("feedname") String feedName,
            @RequestParam("device_id") Integer deviceId,
            HttpServletResponse response) throws Exception {
        Feed feed = new Feed();
        feed.setFeedName(feedName);
        feed.setDeviceId(deviceId);
        feedDao.insert(feed);

        return "index.jsp";
    }
}
