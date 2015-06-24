/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package iotacodeexecuter;

import java.io.IOException;

/**
 *
 * @author Eagle
 */
public class Main {

    public static void main(String[] args) throws IOException, InterruptedException {
        String code = "public class Main {\n"
                + "\n"
                + "    public static void main(String[] args) {\n"
                + "        String myData = GET_DATA(1, 1, 24);\n"
                + "        System.out.println(myData);\n"
                + "    }\n"
                + "}\n";
        String user_id = "1", device_id = "1";
        IOTACodeExecuter C = new IOTACodeExecuter(code, user_id, device_id, Language.JAVA);
        CodeResult r = C.run();
        System.out.println(r.getOut() + "\n" + r.getErr() + "\n" + r.getTimeExec());
    }
}
