package com.mycompany.Domain;

import com.mycompany.Domain.Device;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-06-29T17:30:51")
@StaticMetamodel(Feed.class)
public class Feed_ { 

    public static volatile SingularAttribute<Feed, Long> feedId;
    public static volatile SingularAttribute<Feed, String> feedName;
    public static volatile SingularAttribute<Feed, Device> device;
    public static volatile SingularAttribute<Feed, Long> deviceId;

}