/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package commandexecuter;

import java.io.IOException;
import java.util.*;

/**
 *
 * @author Eagle
 */
public class CommandExecuter {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException, InterruptedException {
        // TODO code application logic here
        List<String> command1 = new ArrayList<String>();
        command1.add("javac");
        command1.add("C:\\Users\\Eagle\\Desktop\\tjava.java");

// execute my command
        SystemCommandExecutor commandExecutor = new SystemCommandExecutor(command1);
        int result = commandExecutor.executeCommand();

// get the output from the command
        StringBuilder stdout = commandExecutor.getStandardOutputFromCommand();
        StringBuilder stderr = commandExecutor.getStandardErrorFromCommand();

// print the output from the command
        System.out.println("The numeric result of the command was: " + result);
        System.out.println("\nSTDOUT:");
        System.out.println(stdout);
        System.out.println("\nSTDERR:");
        System.out.println(stderr);

        List<String> command2 = new ArrayList<String>();
        command2.add("java");
        command2.add("-classpath");
        command2.add("C:\\Users\\Eagle\\Desktop");
        command2.add("JavaTest");

// execute my command
        commandExecutor = new SystemCommandExecutor(command2);
        result = commandExecutor.executeCommand();

// get the output from the command
        stdout = commandExecutor.getStandardOutputFromCommand();
        stderr = commandExecutor.getStandardErrorFromCommand();

// print the output from the command
        System.out.println("The numeric result of the command was: " + result);
        System.out.println("\nSTDOUT:");
        System.out.println(stdout);
        System.out.println("\nSTDERR:");
        System.out.println(stderr);
    }

}
