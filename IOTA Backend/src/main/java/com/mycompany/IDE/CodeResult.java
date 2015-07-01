/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.IDE;

/**
 *
 * @author Eagle
 */
public class CodeResult {

    private String stdout, stderr;
    private long timeExecution;

    public CodeResult() {
        stdout = "";
        stderr = "";
        timeExecution = 0;
    }

    public CodeResult(String stdout, String stderr, int timeExecution) {
        this.stdout = stdout;
        this.stderr = stderr;
        this.timeExecution = timeExecution;
    }

    public void setOut(String stdout) {
        this.stdout = stdout;
    }

    public void setErr(String stderr) {
        this.stderr = stderr;
    }

    public void setTimeExec(long timeExecution) {
        this.timeExecution = timeExecution;
    }

    public String getOut() {
        return this.stdout;
    }

    public String getErr() {
        return this.stderr;
    }

    public long getTimeExec() {
        return this.timeExecution;
    }

}
