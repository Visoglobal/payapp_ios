//
//  Device.m
//  PayApp
//
//  Created by Alexey on 31.03.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "Device.h"

@implementation Device

-(NSString*)rootName
{
    return @"Device";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"deviceType",
                                                        @"deviceToken"
                                                        ] forKeys:  @[
                                                                      @"DeviceType",
                                                                      @"Token"
                                                                      ]];
    
}

- (NSDictionary *)mapClasses
{
    return @{ };
}


@end


//<xs:simpleType name="tDeviceType">
//<xs:restriction base="xs:string">
//<xs:enumeration value="android"/>
//<xs:enumeration value="ios"/>
//</xs:restriction>
//</xs:simpleType>
//
//<xs:complexType name="tDevice">
//<xs:sequence>
//<xs:element name="DeviceType" type="ns:tDeviceType"/>
//<xs:element name="Token" type="xs:string"/>
//</xs:sequence>
//</xs:complexType>