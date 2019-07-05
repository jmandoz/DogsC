//
//  JBMSubBreed.m
//  DogsOBJC
//
//  Created by Jason Mandozzi on 7/3/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

#import "JBMSubBreed.h"

@implementation JBMSubBreed

-(instancetype)initWithName:(NSString *)name subBreedImage:(NSArray *)subBreedImage
{
    self = [super init];
    if (self) {
        _name = name;
        _subBreedImage = subBreedImage;
    }
    return self;
}

@end
