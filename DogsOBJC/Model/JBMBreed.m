//
//  JBMBreed.m
//  DogsOBJC
//
//  Created by Jason Mandozzi on 7/3/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

#import "JBMBreed.h"

@implementation JBMBreed

-(instancetype)initWithName:(NSString *)name subBreed:(NSArray *)subBreed breedImage:(NSArray *)breedImage
{
    self = [super init];
    if (self) {
        _name = name;
        _subBreed = subBreed;
        _breedImage = breedImage;
    }
    return self;
}

@end


