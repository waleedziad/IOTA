/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.IDE;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Eagle
 */
public class IOTACodeExecuter {

    String code, user_id, device_id;
    Language L;
    final String GLOBAL_PATH = "C:\\IOTA";

    public IOTACodeExecuter() {
        code = "";
        user_id = "";
        device_id = "";
        L = Language.CPP;
    }

    public IOTACodeExecuter(String code, String user_id, String device_id, Language L) {
        this.code = code;
        this.user_id = user_id;
        this.device_id = device_id;
        this.L = L;
    }

    String GET_DATA(int device_id, int feed_id, int data_id) {
        return "DATA";
    }

    String refactorCode(String code) {
        String res = "", ourFun = "GET_DATA";
        int st = 0;
        while (true) {
            int nxt = code.indexOf(ourFun, st);
            if (nxt == -1 || st >= code.length()) {
                res += code.substring(st);
                break;
            }
            if (nxt != 0 && (code.charAt(nxt - 1) == '_' || Character.isAlphabetic(code.charAt(nxt - 1))
                    || Character.isDigit(code.charAt(nxt - 1)))) {
                res += code.substring(st, nxt + 1);
                st = nxt + 1;
                continue; // Not Our Function
            }
            boolean notOurFunction = false;
            for (int i = nxt + ourFun.length(); i < code.length(); i++) {
                if (!Character.isWhitespace(code.charAt(i)) && code.charAt(i) != '(') {
                    notOurFunction = true;
                    break; // Not Our Function
                }
                if (code.charAt(i) == '(') {
                    break;
                }
            }
            if (notOurFunction) {
                res += code.substring(st, nxt + 1);
                st = nxt + 1;
                continue; // Not Our Function
            }

            res += code.substring(st, nxt);

            int deviceID = 0, feedID = 0, dataID = 0, cur = 0, semicolons = 0;
            for (int i = nxt; i < code.length(); i++) {
                if (code.charAt(i) == '(') {
                    cur = 1;
                    continue;
                }
                if (code.charAt(i) == ',') {
                    semicolons++;
                    if (semicolons > 2) {
                        // compilation error
                        return null;
                    }
                }
                if (cur == 1) {
                    if (code.charAt(i) == ',') {
                        cur = 2;
                        continue;
                    }
                    deviceID *= 10;
                    deviceID += (code.charAt(i) - '0');
                }
                if (cur == 2) {
                    if (code.charAt(i) == ',') {
                        cur = 3;
                        continue;
                    }
                    feedID *= 10;
                    feedID += (code.charAt(i) - '0');
                }
                if (cur == 3) {
                    if (code.charAt(i) == ')') {
                        if (semicolons != 2) {
                            // compilation error (less parameters)
                            return null;
                        }
                        res += "\"" + GET_DATA(deviceID, feedID, dataID) + "\"";
                        st = i + 1;
                        break;
                    }
                    dataID *= 10;
                    dataID += (code.charAt(i) - '0');
                }
            }
        }
        return res;
    }

    String renameMainClassJava(String code, String user_id, String device_id) {
        String res = "";
        final String MainClass = "Main", keywordClass = "class";
        if (!code.contains(MainClass)) {
            // code doesn't contain Main class -_-
            return null;
        }
        int st = 0;
        while (true) {
            int nxt = code.indexOf(keywordClass, st);
            if (nxt == -1) {
                break;
            }
            if (nxt != 0 && !Character.isWhitespace(code.charAt(nxt - 1))) {
                res += code.substring(st, nxt + 1);
                st = nxt + 1;
                continue; // not Out class
            }
            if (!Character.isWhitespace(code.charAt(nxt + keywordClass.length()))) {
                res += code.substring(st, nxt + 1);
                st = nxt + 1;
                continue;
            }
            boolean isOurClass = true;
            for (int i = nxt + keywordClass.length(); i < code.length(); i++) {
                if (!Character.isWhitespace(code.charAt(i))) {
                    if (code.substring(i, i + MainClass.length()).equals(MainClass)) {
                        if (!Character.isWhitespace(code.charAt(i + MainClass.length())) && code.charAt(i + MainClass.length()) != '{') {
                            isOurClass = false;
                        }
                    } else {
                        isOurClass = false;
                    }
                    res += code.substring(st, i + MainClass.length());
                    if (isOurClass) {
                        res += user_id + "_" + device_id;
                        res += code.substring(i + MainClass.length());
                        return res;
                    }
                    st = i + MainClass.length();
                    break;
                }
            }
        }
        return code;
    }

    public CodeResult run() throws IOException, InterruptedException {
        CodeResult res = new CodeResult();
        code = refactorCode(code); // replace GET_DATA with its value

        if (L == Language.CPP) {
            String fileName = "Code" + user_id + "_" + device_id;
            String cppFilePath = GLOBAL_PATH + "\\" + fileName + ".cpp";
            String exeFilePath = GLOBAL_PATH + "\\" + fileName + ".exe";

            PrintWriter writer = new PrintWriter(cppFilePath, "UTF-8");
            writer.write(code);
            writer.close();

            List<String> command1 = new ArrayList<String>();
            command1.add("g++");
            command1.add(cppFilePath);
            command1.add("-o");
            command1.add(exeFilePath);

            SystemCommandExecutor commandExecutor = new SystemCommandExecutor(command1);
            int result = commandExecutor.executeCommand();

// get the output from the command
            StringBuilder stdout = commandExecutor.getStandardOutputFromCommand();
            StringBuilder stderr = commandExecutor.getStandardErrorFromCommand();

// print the output from the command
            if (result != 0) {
                res.setOut(stdout.toString());
                res.setErr(stderr.toString());
                return res;
            }

            List<String> command2 = new ArrayList<String>();
            command2.add(exeFilePath);

            commandExecutor = new SystemCommandExecutor(command2);

            long startTime = System.currentTimeMillis();
            result = commandExecutor.executeCommand();
            long endTime = System.currentTimeMillis();

            stdout = commandExecutor.getStandardOutputFromCommand();
            stderr = commandExecutor.getStandardErrorFromCommand();

            res.setOut(stdout.toString());
            if (result == 0) {
                res.setErr("success");
            } else {
                res.setErr(stderr.toString());
            }
            res.setTimeExec(endTime - startTime);
        } else if (L == Language.JAVA) {
            code = renameMainClassJava(code, user_id, device_id);
            if (code == null) {
                res.setErr("Compilation Error: Java Code must has public class Main");
                return res;
            }
            String fileName = "Main" + user_id + "_" + device_id;
            String filePath = GLOBAL_PATH + "\\" + fileName + ".java";

            PrintWriter writer = new PrintWriter(filePath, "UTF-8");
            writer.write(code);
            writer.close();

            List<String> command1 = new ArrayList<String>();
            command1.add("javac");
            command1.add(filePath);

// execute my command
            SystemCommandExecutor commandExecutor = new SystemCommandExecutor(command1);
            int result = commandExecutor.executeCommand();

// get the output from the command
            StringBuilder stdout = commandExecutor.getStandardOutputFromCommand();
            StringBuilder stderr = commandExecutor.getStandardErrorFromCommand();

// print the output from the command
            if (result != 0) {
                res.setOut(stdout.toString());
                res.setErr(stderr.toString());
                return res;
            }

            List<String> command2 = new ArrayList<String>();
            command2.add("java");
            command2.add("-classpath");
            command2.add(GLOBAL_PATH);
            command2.add(fileName);

            commandExecutor = new SystemCommandExecutor(command2);

            long startTime = System.currentTimeMillis();
            result = commandExecutor.executeCommand();
            long endTime = System.currentTimeMillis();

            stdout = commandExecutor.getStandardOutputFromCommand();
            stderr = commandExecutor.getStandardErrorFromCommand();

            res.setOut(stdout.toString());

            if (result == 0) {
                res.setErr("success");
            } else {
                res.setErr(stderr.toString());
            }
            res.setTimeExec(endTime - startTime);
        }
        return res;
    }
}
