//
//  BNRItem.m
//  RandomItems
//
//  Created by Matt on 3/1/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

- (void)setItemName:(NSString *)str {
    _itemName = str;
}

- (NSString *)itemName {
    return _itemName;
}

- (NSString *)itemKey {
    return _itemKey;
}

- (void)setSerialNumber:(NSString *)str {
    _serialNumber = str;
}

- (NSString *)serialNumber {
    return _serialNumber;
}

- (void)setValueInDollars:(int)v {
    _valueInDollars = v;
}

-(int)valueInDollars {
    return _valueInDollars;
}

-(NSDate *)dateCreated {
    return _dateCreated;
}



-(NSString *)description {
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth %d, recorded on %@",
                                   self.itemName,
                                   self.serialNumber,
                                   self.valueInDollars,
                                   self.dateCreated];
    return descriptionString;
}

- (instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber {
    self = [super init];
    if (self) {
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        _dateCreated = [[NSDate alloc] init];
        
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *key = [uuid UUIDString];
        _itemKey = key;
    }
    return self;
}

- (instancetype)initWithItemName:(NSString *)name {
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

- (instancetype)init {
    return [self initWithItemName:@"Item"];
}

+ (instancetype)randomItem {
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomItemList = @[@"Bear", @"Spork", @"Mac"];
    
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger itemIndex = arc4random() % [randomItemList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", [randomAdjectiveList objectAtIndex:adjectiveIndex],[randomItemList objectAtIndex:itemIndex]];
    
    int randomValue = arc4random() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c", '0' + arc4random() % 10, 'A' + arc4random() % 26, '0' + arc4random() % 10, 'A' + arc4random() % 26, '0' + arc4random() % 10];
    
    BNRItem *myRandomItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    
    return myRandomItem;
    
}

- (void)dealloc {
    NSLog(@"%@", self);
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.itemName forKey:@"itemName"];
    [aCoder encodeObject:self.serialNumber forKey:@"serialNumber"];
    [aCoder encodeObject:self.dateCreated forKey:@"dateCreated"];
    [aCoder encodeObject:self.itemKey forKey:@"itemKey"];
    [aCoder encodeInt:self.valueInDollars forKey:@"valueInDollars"];
    [aCoder encodeObject:self.thumbnail forKey:@"thumbnail"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _itemName = [aDecoder decodeObjectForKey:@"itemName"];
        _serialNumber = [aDecoder decodeObjectForKey:@"serialNumber"];
        _dateCreated = [aDecoder decodeObjectForKey:@"dateCreated"];
        _itemKey = [aDecoder decodeObjectForKey:@"itemKey"];
        _valueInDollars = [aDecoder decodeIntForKey:@"valueInDollars"];
        _thumbnail = [aDecoder decodeObjectForKey:@"thumbnail"];
    }
    return self;
}

- (void)setThumbnailFromImage:(UIImage *)image {
    CGSize origImageSize = image.size;
    
    CGRect newRect = CGRectMake(0,0,40,40);
    
    float ratio = MAX(newRect.size.width / origImageSize.width, newRect.size.height / origImageSize.height);
    
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, 0.0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:newRect cornerRadius:5.0];
    
    [path addClip];
    
    CGRect projectRect;
    projectRect.size.width = ratio * origImageSize.width;
    projectRect.size.height = ratio * origImageSize.height;
    projectRect.origin.x = (newRect.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y = (newRect.size.height - projectRect.size.height) / 2.0;
    
    [image drawInRect:projectRect];
    
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    self.thumbnail = smallImage;
    
    UIGraphicsEndImageContext();
}
@end
