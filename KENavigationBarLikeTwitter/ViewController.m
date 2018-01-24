//
//  ViewController.m
//  KENavigationBarLikeTwitter
//
//  Created by Kaan Esin on 24.01.2018.
//  Copyright © 2018 Kaan Esin. All rights reserved.
//

#import "ViewController.h"

#define MinYOffset              0.0
#define ConstraintLeadingMin    20.0
#define ConstraintWidthMax      100.0
#define DifferenceValue         30.0
#define ConstraintTopMax        67.0
#define NavigationMinAlpha      0.2
#define NavigationMaxAlpha      0.8
#define NavigationBarImage      [UIImage imageNamed:@"aaa.png"]
#define NavigationTitleMinAlpha 0.0
#define NavigationTitleMaxAlpha 1.0
#define DifferenceValueForTitle 15.0
#define IncerementValue         (DifferenceValueForTitle)*((scrollView.contentOffset.y-MinYOffset)/(ConstraintLeadingMin + ConstraintWidthMax - MinYOffset))

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet KERoundedButton *btnImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintLeading;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintHeight;
@property (weak, nonatomic) IBOutlet UIButton *btnTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTop;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController.navigationBar setBackgroundImage:NavigationBarImage forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.alpha = NavigationMaxAlpha;
    
    self.btnTitle.alpha = 0.0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y <= MinYOffset) {
        self.constraintLeading.constant = ConstraintLeadingMin;
        self.constraintWidth.constant = ConstraintWidthMax;
        self.constraintHeight.constant = ConstraintWidthMax;
        self.constraintTop.constant = ConstraintTopMax;
        self.btnTitle.alpha = NavigationTitleMinAlpha;
        
        self.navigationController.navigationBar.alpha = NavigationMaxAlpha;
    }
    else if (scrollView.contentOffset.y >= ConstraintLeadingMin + ConstraintWidthMax) {
        self.constraintLeading.constant = ConstraintLeadingMin + DifferenceValue;
        self.constraintWidth.constant = ConstraintWidthMax - DifferenceValue*2;
        self.constraintHeight.constant = ConstraintWidthMax - DifferenceValue*2;
        self.constraintTop.constant = ConstraintTopMax - DifferenceValueForTitle;
        self.btnTitle.alpha = NavigationTitleMaxAlpha;
        
        self.navigationController.navigationBar.alpha = NavigationMinAlpha;
    }
    else {
        self.constraintLeading.constant = ConstraintLeadingMin + IncerementValue;
        self.constraintWidth.constant = ConstraintWidthMax - IncerementValue*2;
        self.constraintHeight.constant = ConstraintWidthMax - IncerementValue*2;
        
        if (scrollView.contentOffset.y >= (ConstraintLeadingMin + ConstraintWidthMax)/2) {
            self.constraintTop.constant = ConstraintTopMax - IncerementValue;
            self.btnTitle.alpha = NavigationTitleMinAlpha + (NavigationTitleMaxAlpha-NavigationTitleMinAlpha)*((scrollView.contentOffset.y-MinYOffset)/(ConstraintLeadingMin + ConstraintWidthMax - MinYOffset));
        
            self.navigationController.navigationBar.alpha = NavigationMaxAlpha - (NavigationMaxAlpha-NavigationMinAlpha)*((scrollView.contentOffset.y-MinYOffset)/(ConstraintLeadingMin + ConstraintWidthMax - MinYOffset));
        }
        else {
            self.constraintTop.constant = ConstraintTopMax;
            self.btnTitle.alpha = NavigationTitleMinAlpha;
            
            self.navigationController.navigationBar.alpha = NavigationMaxAlpha;
        }
    }
    
    self.btnImage.cornerRadius = self.btnImage.bounds.size.width/2;
}

@end

@implementation KERoundedButton

-(CGFloat)cornerRadius{
    return self.layer.cornerRadius;
}

-(void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

-(UIColor *)borderColor{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

-(void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}

-(CGFloat)borderWidth{
    return self.layer.borderWidth;
}
-(void)setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth = borderWidth;
}

-(CGFloat)shadowRadius{
    return self.layer.shadowRadius;
}
-(void)setShadowRadius:(CGFloat)shadowRadius{
    self.layer.shadowRadius = shadowRadius;
}

-(CGFloat)shadowOpacity{
    return self.layer.shadowOpacity;
}
-(void)setShadowOpacity:(CGFloat)shadowOpacity{
    self.layer.shadowOpacity = shadowOpacity;
}

-(CGSize)shadowOffset {
    return self.layer.shadowOffset;
}
-(void)setShadowOffset:(CGSize)shadowOffset{
    self.layer.shadowOffset = shadowOffset;
}

-(UIColor *)shadowColor{
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}

-(void)setShadowColor:(UIColor *)shadowColor{
    self.layer.shadowColor = shadowColor.CGColor;
}


@end


