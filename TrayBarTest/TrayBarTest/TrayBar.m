//
//  TrayBar.m
//  TrayBarTest
//
//  Created by Mike Keller on 5/15/15.
//  Copyright (c) 2015 Meek Apps, LLC. All rights reserved.
//

#import "TrayBar.h"

static CGFloat const kDefaultAnimationDuration = 0.1F;
static CGFloat const kBendAmount = 0.2F;

@interface TrayBar()
@property (strong, nonatomic) UIView *leftHalfView, *rightHalfView;
@end

@implementation TrayBar

- (instancetype) initWithFrame:(CGRect)frame {
  UIColor *defaultColor = [UIColor lightGrayColor];
  return [self initWithFrame:frame color:defaultColor arrowDirection:TrayBarArrowDirectionDown];
}

//Designated initializer
- (instancetype) initWithFrame:(CGRect)frame color:(UIColor*)color arrowDirection:(TrayBarArrowDirection)arrowDirection {
  self = [super initWithFrame:frame];
  if (self) {
    
    //Add subviews
    CGFloat height = frame.size.height;
    CGFloat halfWidth = frame.size.width / 2.0F;
    self.leftHalfView = [[UIView alloc] initWithFrame:CGRectMake(0.0F, 0.0F, halfWidth + height / 2.0F, height)];
    self.leftHalfView.layer.shouldRasterize = YES;
    self.leftHalfView.layer.cornerRadius = height / 2.0F;
    self.rightHalfView = [[UIView alloc] initWithFrame:CGRectMake(halfWidth - height / 2.0F, 0.0F, halfWidth + height, height)];
    self.rightHalfView.layer.shouldRasterize = YES;
    self.rightHalfView.layer.cornerRadius = height / 2.0F;
    [self addSubview:self.leftHalfView];
    [self addSubview:self.rightHalfView];
    
    //Color
    self.barColor = color;
    
    //Defaults
    self.bent = NO;
    self.animationDuration = kDefaultAnimationDuration;
    self.arrowDirection = arrowDirection;
  }
  return self;
}

- (void) setBarColor:(UIColor *)barColor {
  _barColor = barColor;
  
  self.leftHalfView.backgroundColor = barColor;
  self.rightHalfView.backgroundColor = barColor;
}

- (void) setBent:(BOOL)bent {
  [self setBent:bent animated:NO];
}

- (void) setBent:(BOOL)bent animated:(BOOL)animated {
  _bent = bent;

  CGFloat leftSignModifier = (self.arrowDirection == TrayBarArrowDirectionDown) ? 1.0F : -1.0F;
  CGFloat rightSignModifier = (self.arrowDirection == TrayBarArrowDirectionDown) ? -1.0F : 1.0F;
  CATransform3D leftTransform = bent ? CATransform3DMakeRotation(leftSignModifier * kBendAmount, 0.0F, 0.0F, 1.0F) : CATransform3DIdentity;
  CATransform3D rightTransform = bent ? CATransform3DMakeRotation(rightSignModifier * kBendAmount, 0.0F, 0.0F, 1.0F) : CATransform3DIdentity;
  
  if (animated) {
    __weak TrayBar *weakSelf = self;
    [UIView animateWithDuration:0.3F
                     animations:^{
                       weakSelf.leftHalfView.layer.transform = leftTransform;
                       weakSelf.rightHalfView.layer.transform = rightTransform;
                     }];
  } else {
    self.leftHalfView.layer.transform = leftTransform;
    self.rightHalfView.layer.transform = rightTransform;
  }
}

@end
