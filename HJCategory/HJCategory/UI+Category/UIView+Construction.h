//  UIView+Construction.m
//  Created by iOS on 2018/6/6.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Construction)
/**
 * Add a lot if UIView instasceObjcet
 */
- (void)addSubviews:(NSArray<__kindof UIView *> *)subViews;
/**
 * Create UIView object dot syntax Invoke.Set UIView property.(chain-type structure).
 */
// Marks UIView frame property instead dot syntax.(view.frame).return parameter is UIView instace object.
-(UIView *(^)(CGRect))viewFrame;
// Marks UIView frame property instead dot syntax.(view.backgroundColor).return parameter is UIView instace object.
-(UIView *(^)(UIColor *))viewColor;
// Marks UIView frame property instead dot syntax.(view.tag).return parameter is UIView instace object.
-(UIView *(^)(NSInteger))viewTag;
// Marks UIView frame property instead dot syntax.(view.bounds).return parameter is UIView instace object.
-(UIView *(^)(CGRect))viewBounds;
// Marks UIView frame property instead dot syntax.(view.center).return parameter is UIView instace object.
-(UIView *(^)(CGPoint))viewCenter;
// Marks UIView frame property instead dot syntax.(view.bounds and view.center).return parameter is UIView instace object.
-(UIView *(^)(CGRect))viewCenterFrame;
// Marks UIView frame property instead dot syntax.(view.alpha).return parameter is UIView instace object.
-(UIView *(^)(CGFloat))viewAlpha;
// Marks UIView frame property instead dot syntax.(view.hidden).return parameter is UIView instace object.
-(UIView *(^)(BOOL))viewHidden;
// Marks UIView frame property instead dot syntax..return parameter is UIView instace object.
-(UIView *(^)(BOOL))viewRadius;
// Marks UIView frame property instead dot syntax.(view.userInteractionEnabled).return parameter is UIView instace object.
-(UIView *(^)(BOOL))viewUserInteractionEnabled;
// Marks UIView frame property instead dot syntax.(view.addGestureRecognizer).return parameter is UIView instace object.
-(UIView *(^)(UIGestureRecognizer * ))viewAddGestureRecognizer;
// Marks UIView frame property instead dot syntax.(view.removeGestureRecognizer).return parameter is UIView instace object.
-(UIView *(^)(UIGestureRecognizer * ))viewRemoveGestureRecognizer;
// Marks UIView frame property instead dot syntax.(view.addGestureRecognizer(tagate,action(string))).return parameter is UIView instace object.
-(UIView *(^)(__weak id,NSString *))viewAddTarget;
// Marks UIView frame property instead dot syntax.(view.addSubView).return parameter is UIView instace object.
-(UIView *(^)(UIView * ))viewAddSubView;
// Marks UIView frame property instead dot syntax.([view.addSubView:self]).return parameter is UIView instace object.
-(UIView *(^)(UIView * __weak))viewAddSuperView;
// Marks UIView frame property instead dot syntax.(view.AddSubviews is custom).return parameter is UIView instace object.
-(UIView *(^)(NSArray<__kindof UIView *> *))viewAddSubviews;



/**
 * Category provide UIView Creat Defualt View,and custom UIView Constrution function.
 */
// Marks UIView and UIView subClass View Class Constrution function (C define function).
UIView * viewCreat(void);
UIView * viewCreatAddSubView(__weak id superView);
UIView * viewCreatFrame(CGRect rect);
UIView * viewCreatBackground(UIColor *color);
UIView * viewCreatParam(CGRect rect,UIColor *color,__weak id superView);
UIView * viewCreatParamMore(CGRect rect,UIColor *color,__weak id target,NSString *action,__weak id superView);
//@end
//
//
//@interface UIButton (Construction)
/**
 * Create UIButton object dot syntax Invoke.Set UIButton property.(chain-type structure).
 */
-(UIButton *(^)(NSString *))buttonTitle;
-(UIButton *(^)(NSString *,UIControlState))buttonTitleState;
-(UIButton *(^)(UIColor *))buttonTitleColor;
-(UIButton *(^)(UIFont *))buttonFont;
-(UIButton *(^)(CGFloat))buttonFontSize;
-(UIButton *(^)(NSInteger))buttonNumberOfLines;
-(UIButton *(^)(BOOL))buttonAdjustsFontSizeToFitWidth;
-(UIButton *(^)(UIImage *))buttonImage;
-(UIButton *(^)(UIImage *,UIControlState))buttonImageState;
-(UIButton *(^)(UIColor *color))buttonBGColor;
-(UIButton *(^)(UIImage *))buttonBGImage;
-(UIButton *(^)(UIImage *,UIControlState))buttonBGImageState;
-(UIButton *(^)(__weak id,NSString *))buttonAddTarget;

// Marks UIButton and UIButton subClass View Class Constrution function (C define function).
UIButton * buttonCreat(void);
UIButton * buttonCreatFrame(CGRect rect);
UIButton * buttonCreatTitle(NSString *title);
UIButton * buttonCreatTitleColor(UIColor *color);
UIButton * buttonCreatBGColor(UIColor *color);
UIButton * buttonCreatImage(UIImage *image);
UIButton * buttonCreatBGImage(UIImage *image);
UIButton * buttonCreatFont(CGFloat fontSize);
UIButton * buttonCreatTarget(__weak id target,NSString *action);
UIButton * buttonCreatParam(CGRect rect,NSString *title,UIImage *image,__weak id target,NSString *action,__weak id superView);

/**
 * Create UILabel object dot syntax Invoke.Set UILabel property.(chain-type structure).
 */
-(UILabel *(^)(NSString *))labelText;
-(UILabel *(^)(UIColor *))labelTextColor;
-(UILabel *(^)(UIFont *))labelFont;
-(UILabel *(^)(CGFloat))labelFontSize;
-(UILabel *(^)(NSInteger))labelNumberOfLines;
-(UILabel *(^)(BOOL))labelAdjustsFontSizeToFitWidth;

// Marks UILabel and UILabel subClass View Class Constrution function (C define function).
UILabel * labelCreat(void);
UILabel * labelCreatFrame(CGRect rect);
UILabel * labelCreatText(NSString *text);
UILabel * labelCreatTextColor(UIColor *color);
UILabel * labelCreatBackground(UIColor *color);
UILabel * labelCreatImage(UIImage *image);
UILabel * labelCreatBackgroundImage(UIImage *image);
UILabel * labelCreatFont(CGFloat fontSize);
UILabel * labelCreatTarget(__weak id target,NSString *action);
UILabel * labelCreatParam(CGRect rect,NSString *text,__weak id superView);
@end
