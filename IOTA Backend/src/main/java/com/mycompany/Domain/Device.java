package com.mycompany.Domain;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "device")
public class Device implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "device_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long deviceId;
    @Column(name = "device_name")
    private String deviceName;
    @Column(name = "server_code")
    private String serverCode;
    @Column(name = "device_code")
    private String deviceCode;
    @Column(name = "creation_time")
    private String creationTime;
   
   @Column(name = "user_id")
    private Long userId;
    
    @ManyToOne(optional = false)
    @JoinColumn(name = "user_id", insertable=false , updatable=false)
    private User user;

    public Device() {
    }

    public Device(String deviceName, String serverCode, String deviceCode, String creationDate, Long userId) {
        this.deviceName = deviceName;
        this.serverCode = serverCode;
        this.deviceCode = deviceCode;
        this.creationTime = creationDate;
        this.userId = userId;
    }


    /**
     * @return the device id
     */
    public Long getDeviceId() {
        return deviceId;
    }

    /**
     * @param deviceId the device name to set
     */
    public void setDeviceId(Long deviceId) {
        this.deviceId = deviceId;
    }

    /**
     * @return the device name
     */
    public String getDeviceName() {
        return deviceName;
    }

    /**
     * @param deviceName the device name to set
     */
    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    /**
     * @return the server code
     */
    public String getServerCode() {
        return serverCode;
    }

    /**
     * @param serverCode the server code to set
     */
    public void setServerCode(String serverCode) {
        this.serverCode = serverCode;
    }

    /**
     * @return the device code
     */
    public String getDeviceCode() {
        return deviceCode;
    }

    /**
     * @param deviceCode the device code to set
     */
    public void setDeviceCode(String deviceCode) {
        this.deviceCode = deviceCode;
    }

    /**
     * @return the creation date
     */
    public String creationDate() {
        return creationTime;
    }

    /**
     * @param creationDate the creation date to set
     */
    public void setCreationDate(String creationDate) {
        this.creationTime = creationDate;
    }

    /**
     * @return the user id
     */
    public Long getUserId() {
        return userId;
    }
    
    public User getUser(){
        return user;
    }
    /**
     * @param userId the user id to set
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userId != null ? userId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Device)) {
            return false;
        }
        Device other = (Device) object;
        if ((this.deviceId == null && other.deviceId != null) || (this.deviceId != null && !this.deviceId.equals(other.deviceId))) {
            return false;
        }
        return true;
    }

    
    @Override
    public String toString() {
        return "Domain.Device[ id=" + deviceId +  ",deviceName="+deviceName+",serverCode="+serverCode+",deviceCode="+deviceCode+",creationDate="+creationTime+",userId="+userId+" ]";
    }
}
