package com.mycompany.Domain;

import com.mycompany.Domain.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-07-04T20:30:26")
@StaticMetamodel(Device.class)
public class Device_ { 

    public static volatile SingularAttribute<Device, String> deviceName;
    public static volatile SingularAttribute<Device, String> deviceCode;
    public static volatile SingularAttribute<Device, Long> userId;
    public static volatile SingularAttribute<Device, String> serverCode;
    public static volatile SingularAttribute<Device, String> creationTime;
    public static volatile SingularAttribute<Device, User> user;
    public static volatile SingularAttribute<Device, Long> deviceId;

}