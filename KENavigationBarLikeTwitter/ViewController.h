//
//  ViewController.h
//  KENavigationBarLikeTwitter
//
//  Created by Kaan Esin on 24.01.2018.
//  Copyright © 2018 Kaan Esin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@end

IB_DESIGNABLE
@interface KERoundedButton : UIButton

@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable CGFloat shadowRadius;
@property (nonatomic) IBInspectable CGFloat shadowOpacity;
@property (nonatomic) IBInspectable CGSize  shadowOffset;
@property (nonatomic) IBInspectable UIColor *shadowColor;

@end
