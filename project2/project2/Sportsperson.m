//
//  Sportsperson.m
//  project2
//
//  Created by Shvarsman on 29.04.25.
//


#import "Sportsperson.h"

@implementation Sportsperson

- (instancetype)initWithName:(NSString *)name imageName:(NSString *)imageName achievements:(NSString *)achievements {
    self = [super init];
    if (self) {
        _name = name;
        _image = [UIImage imageNamed:imageName];
        _achievements = achievements;
    }
    return self;
}

@end