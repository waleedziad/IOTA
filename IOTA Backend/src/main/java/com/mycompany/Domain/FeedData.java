package com.mycompany.Domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "feed_data")
public class FeedData implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "feeddata_id",unique=true, nullable = false)
    private Long feedDataId;

    @Column(name = "feed_value")
    private String feedValue;
    @Column(name = "feed_date")
    private Date feedDate;
    @Column(name = "feed_id")
    private Long feedId;

    @ManyToOne(optional = false)
    @JoinColumn(name = "feed_id", insertable = false, updatable = false)
    private Feed feed;

    public FeedData() {
    }

    public FeedData(String feedValue, Date feedDate, Long feedId) {
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
    public Date getFeedDate() {
        return feedDate;
    }

    /**
     * @param feedDate the feed date to set
     */
    public void setFeedDate(Date feedDate) {
        this.feedDate = feedDate;
    }

    /**
     * @return the feed id
     */
    public Long getFeedId() {
        return feedId;
    }

    /**
     * @param feedId the feed id to set
     */
    public void setFeedId(Long feedId) {
        this.feedId = feedId;
    }

    public Feed getFeed(){
        return feed;
    }
    
    @Override
    public String toString() {
        return "Domain.FeedData[ feedDataId=" + feedDataId + ",feedValue=" + feedValue + ",feedDate=" + feedDate + ",feedId=" + feedId + " ]";
    }
}
