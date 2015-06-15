package ideonetest;

import java.io.*;
import java.rmi.RemoteException;
import java.util.*;
import javax.xml.rpc.ServiceException;

public class IdeoneTest {

    static void runCode(int codeLanguage, String code, String input) throws ServiceException, RemoteException, InterruptedException {
        Ideone_Service_v1ServiceLocator locator = new Ideone_Service_v1ServiceLocator();
        Ideone_Service_v1Port_PortType service = locator.getIdeone_Service_v1Port();

        Object[] languages = service.getLanguages("eagle93", "IOTA_AAHMW");
        HashMap<String, HashMap> lang = (HashMap) languages[0];

        Object sub[] = service.createSubmission("eagle93", "IOTA_AAHMW", code, codeLanguage, input, Boolean.TRUE, Boolean.TRUE);
        HashMap<String, String> subm = (HashMap) sub[0];
        String link = "";

        if (subm.get("error").equals("OK")) {
            link = subm.get("link");
        }
        int result = 0, memory = 0, status = -1;
        float time = 0;
        String output = "", cmpinfo = "", stderr = "";
        while (status != 0) {
            Thread.sleep(20);
            Object subdet[] = service.getSubmissionDetails("eagle93", "IOTA_AAHMW", link, Boolean.FALSE, Boolean.TRUE, Boolean.TRUE, Boolean.TRUE, Boolean.TRUE);
            HashMap<String, Object> subdetls = (HashMap) subdet[0];
            result = ((Integer) subdetls.get("result")).intValue();
            status = ((Integer) subdetls.get("status")).intValue();
            time = ((Float) subdetls.get("time")).floatValue();
            output = (String) subdetls.get("output");
            cmpinfo = (String) subdetls.get("cmpinfo");
            memory = ((Integer) subdetls.get("memory")).intValue();
            stderr = (String) subdetls.get("stderr");
        }
        if (result == 15) {
            System.out.println("memory=" + memory + " time=" + time + " output=" + output);
        } else {
            System.out.println(cmpinfo + "\nerror:" + stderr);
        }
    }

    public static void main(String[] argv) {
        try {
            int codeLanguage = 11; // for C Language
            String code = "", temp = "", input = "";
            BufferedReader br, in;
            DataInputStream userin = new DataInputStream(System.in);
            if (argv.length != 2) {
//                System.out.println("Enter source file, then input file!");
                String fsrc, fin;
                fsrc = "C:\\Users\\Eagle\\Desktop\\GP\\ideone-web-service-master/a.c";
                fin = "C:\\Users\\Eagle\\Desktop\\GP\\ideone-web-service-master/in.txt";
                br = new BufferedReader(new FileReader(fsrc));
                in = new BufferedReader(new FileReader(fin));
            } else {
                br = new BufferedReader(new FileReader(argv[0]));
                in = new BufferedReader(new FileReader(argv[1]));
            }
            while ((temp = br.readLine()) != null) {
                code = code + "\n" + temp;
            }
            br.close();
            while ((temp = in.readLine()) != null) {
                input = input + "\n" + temp;
            }
            in.close();

            runCode(codeLanguage, code, input);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
