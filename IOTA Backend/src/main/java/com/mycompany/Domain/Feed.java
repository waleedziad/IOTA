package com.mycompany.Domain;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "feed")
public class Feed implements Serializable {

    @Id
    @Column(name = "feed_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int feedId;
    @Column(name = "feed_name")
    private String feedName;
    @Column(name = "device_id")
    private int deviceId;
    
    @ManyToOne(optional = false)
    @JoinColumn(name = "device_id", insertable = false, updatable = false)
    private Device device;

    public Feed() {
    }

    public Feed(String feedName, int deviceId) {
        this.feedName = feedName;
        this.deviceId = deviceId;
    }

    /**
     * @return the feed id
     */
    public int getFeedId() {
        return feedId;
    }

    /**
     * @param feedId the feed id to set
     */
    public void setFeedName(int feedId) {
        this.feedId = feedId;
    }

    /**
     * @return the feed name
     */
    public String getFeedName() {
        return feedName;
    }

    /**
     * @param feedName the feed name to set
     */
    public void setFeedName(String feedName) {
        this.feedName = feedName;
    }

    /**
     * @return the device id
     */
    public int getDeviceId() {
        return deviceId;
    }

    /**
     * @param deviceId the device id to set
     */
    public void setDeviceId(int deviceId) {
        this.deviceId = deviceId;
    }
    
    @Override
    public String toString() {
        return "Domain.Feed[ id=" + feedId +  ",feedName="+feedName+",deviceId="+deviceId+" ]";
    }
    
}