package com.mycompany.Domain;

import com.mycompany.Domain.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-06-20T22:20:11")
@StaticMetamodel(Device.class)
public class Device_ { 

    public static volatile SingularAttribute<Device, String> serverCode;
    public static volatile SingularAttribute<Device, String> deviceCode;
    public static volatile SingularAttribute<Device, String> creationDate;
    public static volatile SingularAttribute<Device, Integer> deviceId;
    public static volatile SingularAttribute<Device, String> deviceName;
    public static volatile SingularAttribute<Device, Integer> userId;
    public static volatile SingularAttribute<Device, User> user;

}