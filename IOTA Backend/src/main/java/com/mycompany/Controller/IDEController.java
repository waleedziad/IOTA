/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.Controller;

import com.mycompany.IDE.CodeResult;
import com.mycompany.IDE.IOTACodeExecuter;
import com.mycompany.IDE.Language;
import com.mycompany.Wrappers.IPTable;
import com.mycompany.Wrappers.Requester;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author sony
 */
@Controller
@RequestMapping("/pages/Dashboard")
@TransactionConfiguration(defaultRollback = false)
@ContextConfiguration({"classpath:configuration/applicationContext.xml"})
@Transactional
@SessionAttributes({"user_id", "devices", "points", "devicesInfo", "table_data", "device_table_data", "email", "codeResult"})
public class IDEController {

    
    @RequestMapping(value = "deviceIDE.htm", method = RequestMethod.POST)
    public ModelAndView deviceIDE(
            @RequestParam("code") String code,
            @RequestParam("userID") String userID,
            @RequestParam("deviceID") String deviceID,
            @RequestParam("langCode") String langCode,
            @RequestParam("case") String Case,
            HttpServletResponse response) throws Exception {

        ModelAndView modelAndView = new ModelAndView();
        String Result = "Code Execution Result";
        new File("C:\\IOTA\\DeviceCode\\").mkdirs();
        writeToFile("C:\\IOTA\\DeviceCode\\Device_"+deviceID+".txt",code);
        if (Case.equalsIgnoreCase("Run")) {
            Language lang;
            if (langCode.equals("2")) {
                lang = Language.CPP;
            } else {
                lang = Language.JAVA;
            }
            IOTACodeExecuter IDE = new IOTACodeExecuter(code, userID, deviceID, lang);
            CodeResult result = IDE.run();
            System.out.println("Run");
            System.out.println(userID);
            System.out.println(code);
            //System.out.println(result.getRes());
            Result = result.getRes();

            //response.getWriter().write(result.getRes());
        } else if (Case.equalsIgnoreCase("Deplay")) {
            if (IPTable.table.containsValue(deviceID))
            {
                Requester requester = new Requester();
                requester.sendGet(IPTable.table.get(deviceID));
                
            }

        }
        modelAndView.addObject("codeResult", Result);
        modelAndView.setViewName("editor.htm?deviceId=" + deviceID);
        return modelAndView;
    }

    @RequestMapping(value = "serverIDE.htm", method = RequestMethod.POST)
    public ModelAndView serverIDE(
            @RequestParam("code") String code,
            @RequestParam("userID") String userID,
            @RequestParam("deviceID") String deviceID,
            @RequestParam("langCode") String langCode,
            @RequestParam("case") String Case,
            HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        String Result = "Code Execution Result";
        new File("C:\\IOTA\\ServerCode\\").mkdirs();
        writeToFile("C:\\IOTA\\ServerCode\\Server_"+deviceID+".txt",code);
        if (Case.equalsIgnoreCase("Run")) {
            Language lang;
            if (langCode.equals("2")) {
                lang = Language.CPP;
            } else {
                lang = Language.JAVA;
            }

            IOTACodeExecuter IDE = new IOTACodeExecuter(code, userID, deviceID, lang);
            CodeResult result = IDE.run();
            System.out.println("Run");
            System.out.println(userID);
            System.out.println(code);

            System.out.println(result.getRes());
            response.getWriter().write(result.getRes());

            Result = result.getRes();
        } else if (Case.equalsIgnoreCase("Deplay")) {

        }
        modelAndView.addObject("codeResult", Result);
        modelAndView.setViewName("servereditor.htm?deviceId=" + deviceID);
        return modelAndView;
    }
    
    private void writeToFile(String filePath,String input){
        try {
            FileWriter fw=new FileWriter(new File(filePath));
            fw.write(input);
            fw.close();
        } catch (IOException ex) {
                
        }
    }
}
