//
//  JBMBreed.h
//  DogsOBJC
//
//  Created by Jason Mandozzi on 7/3/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JBMBreed : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSArray *subBreed;
@property (nonatomic, copy, readonly) NSArray *breedImage;

-(instancetype)initWithName:(NSString *)name subBreed:(NSArray *)subBreed breedImage:(NSArray *)breedImage;



@end


NS_ASSUME_NONNULL_END
