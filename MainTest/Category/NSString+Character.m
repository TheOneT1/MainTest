//
//  NSString+Character.m
//  MainTest
//
//  Created by ffss on 2016/11/17.
//  Copyright © 2016年 ffss. All rights reserved.
//

#import "NSString+Character.h"

@implementation NSString (Character)


- (NSInteger)lenthOfBytes
{
    NSInteger strLength = 0;
    
    char *c = (char *) [self cStringUsingEncoding:NSUTF8StringEncoding];
    
    for (int i = 0; i < [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding]; i ++) {
        
        if (*c) {
            
             if(*c == '\xe4' || *c == '\xe5' || *c == '\xe6' || *c == '\xe7' || *c == '\xe8' || *c == '\xe9')
            {
                strLength --;
            }
            
            c++;
            
            strLength ++;
        }else{
            
            c ++;
        }
    }
    
    return strLength;
}

@end
