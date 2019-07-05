//
//  JBMSubBreed.h
//  DogsOBJC
//
//  Created by Jason Mandozzi on 7/3/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JBMSubBreed : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSArray *subBreedImage;

-(instancetype)initWithName:(NSString *)name subBreedImage:(NSArray *)subBreedImage;

@end

NS_ASSUME_NONNULL_END
