//
//  TrayBar.h
//  TrayBarTest
//
//  Created by Mike Keller on 5/15/15.
//  Copyright (c) 2015 Meek Apps, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TrayBarArrowDirection) {
  TrayBarArrowDirectionDown,
  TrayBarArrowDirectionUp
};

@interface TrayBar : UIView

@property (strong, nonatomic) UIColor *barColor;
@property (nonatomic, getter = isBent) BOOL bent;
@property (nonatomic) CGFloat animationDuration;
@property (nonatomic) TrayBarArrowDirection arrowDirection;

- (instancetype) initWithFrame:(CGRect)frame color:(UIColor*)color arrowDirection:(TrayBarArrowDirection)arrowDirection;
- (void) setBent:(BOOL)bent animated:(BOOL)animated;

@end
