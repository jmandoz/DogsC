//
//  BreedNetworkClient.h
//  DogsOBJC
//
//  Created by Jason Mandozzi on 7/3/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

#import <Foundation/Foundation.h>


@class JBMBreed;
@class JBMSubBreed;

@interface BreedNetworkClient : NSObject

- (BreedNetworkClient *)sharedInstance;

-(void)fetchAllBreeds:(void (^)(NSArray *))completion;
-(void)fetchBreedImageURLs:(JBMBreed *)breed completion:(void (^)(NSArray *))completion;
-(void)fetchSubBreedImageURLs:(JBMSubBreed *)subBreed breed:(JBMBreed *)breed completion:(void (^)(NSArray *))completion;
-(void)fetchImageData:(NSURL *)url completion:(void (^)(NSData *imageData, NSError *error))completion;

@end


