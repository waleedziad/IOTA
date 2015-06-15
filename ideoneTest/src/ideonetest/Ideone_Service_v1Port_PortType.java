package ideonetest;
public interface Ideone_Service_v1Port_PortType extends java.rmi.Remote {

    /**
     * Creates a new submission.
     */
    public java.lang.Object[] createSubmission(java.lang.String user, java.lang.String pass, java.lang.String sourceCode, int language, java.lang.String input, boolean run, boolean _private) throws java.rmi.RemoteException;

    /**
     * Returns status and result of a submission in an associative
     * array.
     */
    public java.lang.Object[] getSubmissionStatus(java.lang.String user, java.lang.String pass, java.lang.String link) throws java.rmi.RemoteException;

    /**
     * Returns information about the submission in an associative
     * array.
     */
    public java.lang.Object[] getSubmissionDetails(java.lang.String user, java.lang.String pass, java.lang.String link, boolean withSource, boolean withInput, boolean withOutput, boolean withStderr, boolean withCmpinfo) throws java.rmi.RemoteException;

    /**
     * Returns list of supported languages.
     */
    public java.lang.Object[] getLanguages(java.lang.String user, java.lang.String pass) throws java.rmi.RemoteException;

    /**
     * This is a test function. If you can call it successfully, 
     * then you will also be able to call the other functions.
     */
    public java.lang.Object[] testFunction(java.lang.String user, java.lang.String pass) throws java.rmi.RemoteException;
}
