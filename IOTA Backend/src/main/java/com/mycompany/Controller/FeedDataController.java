package com.mycompany.Controller;

import com.mycompany.DAO.FeedDataDao;
import com.mycompany.Domain.FeedData;
import com.mycompany.Domain.User;
import com.mycompany.Wrappers.IPTable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
@RequestMapping("/FeedData")
@TransactionConfiguration(defaultRollback = false)
@ContextConfiguration({"classpath:configuration/applicationContext.xml"})
@Transactional
public class FeedDataController {

    @Autowired
    FeedDataDao feedDataDao;

    @RequestMapping(value = "newFeedData.htm", method = RequestMethod.GET)
    public void AcceptInput(
            @RequestParam("feedValue") String feedValue,
            @RequestParam("feedId") Long feedId,
            @RequestParam("ip") String ip,
            @RequestParam("deviceID") String deviceID,
            HttpServletResponse response) throws Exception {
        IPTable.table.put(deviceID, ip)  ;
        Calendar cal = Calendar.getInstance();
        Date feedDate=cal.getTime();
        FeedData feedData = new FeedData(feedValue, feedDate, feedId);
        feedDataDao.insert(feedData);
        response.getWriter().write("Feed Added");
    }
}
