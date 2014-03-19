//
//  BNRItemCell.m
//  Homepwner
//
//  Created by Matt on 3/19/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import "BNRItemCell.h"

@interface BNRItemCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWidth;
@end



@implementation BNRItemCell

- (IBAction)showImage:(id)sender {
    if (self.actionBlock) {
        self.actionBlock();
    }
    
}

- (void)updateInterfaceForDynamicTypeSize {
    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.itemName.font = font;
    self.serialNumberLabel.font = font;
    self.valueLabel.font = font;
    
    static NSDictionary *imageSizeDictionary;
    
    if (!imageSizeDictionary) {
        imageSizeDictionary = @{ UIContentSizeCategoryExtraSmall : @40,
                                 UIContentSizeCategorySmall : @40,
                                 UIContentSizeCategoryMedium : @40,
                                 UIContentSizeCategoryLarge : @40,
                                 UIContentSizeCategoryExtraLarge : @45,
                                 UIContentSizeCategoryExtraExtraLarge : @55,
                                 UIContentSizeCategoryExtraExtraExtraLarge : @65 };
    }
        
    NSString *userSize = [[UIApplication sharedApplication] preferredContentSizeCategory];
    NSNumber *imageSize = imageSizeDictionary[userSize];
    self.imageHeight.constant = imageSize.floatValue;
        
}

- (void)awakeFromNib {
    [self updateInterfaceForDynamicTypeSize];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(updateInterfaceForDynamicTypeSize) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.imageView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    
    [self addConstraint:constraint];
    
}

- (void)dealloc {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
}


@end
