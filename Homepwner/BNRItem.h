//
//  BNRItem.h
//  RandomItems
//
//  Created by Matt on 3/1/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject <NSCoding> {
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
    NSString *_itemKey;
}

@property (nonatomic, strong) UIImage *thumbnail;

- (void)setItemName:(NSString *)str;
- (NSString *)itemName;

- (void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;

- (void)setValueInDollars:(int)v;
- (int)valueInDollars;

- (NSString *)itemKey;

- (NSDate *)dateCreated;

- (instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber;
- (instancetype)initWithItemName:(NSString *)name;

+ (instancetype)randomItem;

- (void)setThumbnailFromImage:(UIImage *)image;


@end
