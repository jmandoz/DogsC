//
//  BreedNetworkClient.m
//  DogsOBJC
//
//  Created by Jason Mandozzi on 7/3/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

#import "BreedNetworkClient.h"
#import "JBMBreed.h"
#import "JBMSubBreed.h"


@implementation BreedNetworkClient

static NSString const *baseUrlString = @"https://dog.ceo/api";

- (BreedNetworkClient *)sharedInstance
{
    static BreedNetworkClient *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [BreedNetworkClient new];
    });
    return sharedController;
}

- (void)fetchAllBreeds:(void (^)(NSArray *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseUrlString];
    NSURL *finalURL = [[[baseURL URLByAppendingPathComponent:@"breeds"] URLByAppendingPathComponent:@"list"] URLByAppendingPathComponent:@"all"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an fetching the breed data%s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (!data) {
            NSLog(@"Error fetching dog data");
            completion(nil);
            return;
        }
        
        NSDictionary *topLevelDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *secondLevelDict = topLevelDict[@"message"];
        NSMutableArray *breedsPlaceholder = [NSMutableArray new];
        for (id key in secondLevelDict) {
            NSMutableArray *subBreedsPlaceholder = [NSMutableArray new];
            for (NSString *name in secondLevelDict[key])
            {
                JBMSubBreed *subBreed = [[JBMSubBreed alloc] initWithName:name subBreedImage:[[NSMutableArray alloc]init]];
                [subBreedsPlaceholder addObject:subBreed];
            }
            
            JBMBreed *breed = [[JBMBreed alloc] initWithName:key subBreed:subBreedsPlaceholder breedImage:[[NSMutableArray alloc]init]];
            [breedsPlaceholder addObject:breed];
        }
        completion(breedsPlaceholder);
    }] resume];
}

-(void)fetchBreedImageURLs:(JBMBreed *)breed completion:(void (^)(NSArray *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseUrlString];
    NSURL *breedURL = [[[baseURL URLByAppendingPathComponent: @"breed"] URLByAppendingPathComponent:breed.name] URLByAppendingPathComponent:@"images"];
    [[[NSURLSession sharedSession] dataTaskWithURL:breedURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error fetching the breed images %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (!data) {
            NSLog(@"Error fetching dog");
            completion(nil);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSMutableArray *images = jsonDictionary[@"message"];
        completion(images);
    }] resume];
}

-(void)fetchSubBreedImageURLs:(JBMSubBreed *)subBreed breed:(JBMBreed *)breed completion:(void (^)(NSArray *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseUrlString];
    NSURL *breedURL = [[[[baseURL URLByAppendingPathComponent:@"breed"] URLByAppendingPathComponent:breed.name] URLByAppendingPathComponent:subBreed.name] URLByAppendingPathComponent:@"images"];
    [[[NSURLSession sharedSession] dataTaskWithURL:breedURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error fetching the breed images %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (!data) {
            NSLog(@"Error fetching dog");
            completion(nil);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSMutableArray *images = jsonDictionary[@"message"];
        completion(images);
    }] resume];
}

-(void)fetchImageData:(NSURL *)url completion:(void (^)(NSData *, NSError *))completion
{
    [[[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Error fetching breeds from search term: %@", error);
            return completion(nil, error);
        }
        if(!data){
            NSLog(@"Error fetching breeds DATA from search term: %@", error);
            return completion(nil, error);
        }
        completion(data, nil);
    }]resume];
}


@end

