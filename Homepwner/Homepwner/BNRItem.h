//
//  BNRItem.h
//  Homepwner
//
//  Created by Matt on 3/19/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BNRItem : NSManagedObject

@property (nonatomic, retain) NSString *itemName;
@property (nonatomic, retain) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, retain) NSDate *dateCreated;
@property (nonatomic, retain) NSString *itemKey;
@property (nonatomic, retain) UIImage *thumbnail;
@property (nonatomic) double orderingValue;
@property (nonatomic, retain) NSManagedObject *assetType;

- (void)setThumbnailFromImage:(UIImage *)image;

@end
