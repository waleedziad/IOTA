/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.Controller;

import com.mycompany.Domain.User;
import com.mycompany.IDE.CodeResult;
import com.mycompany.IDE.IOTACodeExecuter;
import com.mycompany.IDE.Language;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author sony
 */
@Controller
@RequestMapping("/IDE")
@TransactionConfiguration(defaultRollback = false)
@ContextConfiguration({"classpath:configuration/applicationContext.xml"})
@Transactional
public class IDEController {

    @RequestMapping(value = "Run.htm", method = RequestMethod.GET)
    public void AcceptInput(
            @RequestParam("code") String code,
            @RequestParam("userID") String userID,
            @RequestParam("deviceID") String deviceID,
            @RequestParam("langCode") String langCode,
            HttpServletResponse response) throws Exception {
        code = "public class Main {\n"
                + "public static void main(String[] args) {\n"
                + "System.out.println(\"TEST TEST\");\n"
                + "}\n"
                + "}\n";
        Language lang;
//        if (langCode.equals("1")) {
//            lang = Language.CPP;
//        } else {
            lang = Language.JAVA;
//        }
        IOTACodeExecuter IDE = new IOTACodeExecuter(code, userID, deviceID, lang);
        CodeResult result = IDE.run();
        System.out.println("Run");
        System.out.println(userID);
        System.out.println(code);
        System.out.println(result.toString());
        response.getWriter().write(result.toString());
    }
}
