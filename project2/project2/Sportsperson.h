//
//  Sportsperson.h
//  project2
//
//  Created by georg on 29.04.25.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Sportsperson : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *achievements;

- (instancetype)initWithName:(NSString *)name imageName:(NSString *)imageName achievements:(NSString *)achievements;

@end