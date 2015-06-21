package com.mycompany.Domain;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "feed_data")
public class FeedData implements Serializable {

    @Id
    @Column(name = "feeddata_id")
    private int feedDataId;

    @Column(name = "feed_value")
    private String feedValue;
    @Column(name = "feed_date")
    private String feedDate;
    @Column(name = "feed_id")
    private int feedId;

    @ManyToOne(optional = false)
    @JoinColumn(name = "feed_id", insertable = false, updatable = false)
    private Feed feed;

    public FeedData() {
    }

    public FeedData(String feedValue, String feedDate, int feedId) {
        this.feedValue = feedValue;
        this.feedDate = feedDate;
        this.feedId = feedId;
    }

    /**
     * @return the feed value
     */
    public String getFeedValue() {
        return feedValue;
    }

    /**
     * @param feedValue the feed value to set
     */
    public void setFeedValue(String feedValue) {
        this.feedValue = feedValue;
    }

    /**
     * @return the feed date
     */
    public String getFeedDate() {
        return feedDate;
    }

    /**
     * @param feedDate the feed date to set
     */
    public void setFeedDate(String feedDate) {
        this.feedDate = feedDate;
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
    public void setFeedId(int feedId) {
        this.feedId = feedId;
    }

    @Override
    public String toString() {
        return "Domain.FeedData[ feedDataId=" + feedDataId + ",feedValue=" + feedValue + ",feedDate=" + feedDate + ",feedId=" + feedId + " ]";
    }
}
