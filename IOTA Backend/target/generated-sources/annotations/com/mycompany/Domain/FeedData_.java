package com.mycompany.Domain;

import com.mycompany.Domain.Feed;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-07-01T20:11:16")
@StaticMetamodel(FeedData.class)
public class FeedData_ { 

    public static volatile SingularAttribute<FeedData, Date> feedDate;
    public static volatile SingularAttribute<FeedData, Long> feedId;
    public static volatile SingularAttribute<FeedData, Long> feedDataId;
    public static volatile SingularAttribute<FeedData, String> feedValue;
    public static volatile SingularAttribute<FeedData, Feed> feed;

}