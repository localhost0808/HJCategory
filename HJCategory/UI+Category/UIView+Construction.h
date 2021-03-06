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
-(UIView *(^)(__weak id,SEL))viewAddTarget;
// Marks UIView frame property instead dot syntax.(view.addSubView).return parameter is UIView instace object.
-(UIView *(^)(UIView * ))viewAddSubView;
// Marks UIView frame property instead dot syntax.([view.addSubView:self]).return parameter is UIView instace object.
-(UIView *(^)(UIView * __weak))viewAddSuperView;
// Marks UIView frame property instead dot syntax.(view.AddSubviews is custom).return parameter is UIView instace object.
-(UIView *(^)(NSArray<__kindof UIView *> *))viewAddSubviews;



/**
 * Category provide UIView Create Defualt View,and custom UIView Constrution function.
 */
// Marks UIView and UIView subClass View Class Constrution function (C define function).
UIView * viewCreate(void);
UIView * viewCreateAddSubView(__weak id superView);
UIView * viewCreateFrame(CGRect rect);
UIView * viewCreateBackground(UIColor *color);
UIView * viewCreateParam(CGRect rect,UIColor *color,__weak id superView);
UIView * viewCreateParamMore(CGRect rect,UIColor *color,__weak id target,SEL action,__weak id superView);
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
-(UIButton *(^)(__weak id,SEL))buttonAddTarget;

// Marks UIButton and UIButton subClass View Class Constrution function (C define function).
UIButton * buttonCreate(void);
UIButton * buttonCreateFrame(CGRect rect);
UIButton * buttonCreateTitle(NSString *title);
UIButton * buttonCreateTitleColor(UIColor *color);
UIButton * buttonCreateBGColor(UIColor *color);
UIButton * buttonCreateImage(UIImage *image);
UIButton * buttonCreateBGImage(UIImage *image);
UIButton * buttonCreateFont(CGFloat fontSize);
UIButton * buttonCreateTarget(__weak id target,SEL action);
UIButton * buttonCreateParam(CGRect rect,NSString *title,UIImage *image,__weak id target,SEL action,__weak id superView);

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
UILabel * labelCreate(void);
UILabel * labelCreateFrame(CGRect rect);
UILabel * labelCreateText(NSString *text);
UILabel * labelCreateTextColor(UIColor *color);
UILabel * labelCreateBackground(UIColor *color);
UILabel * labelCreateImage(UIImage *image);
UILabel * labelCreateBackgroundImage(UIImage *image);
UILabel * labelCreateFont(CGFloat fontSize);
UILabel * labelCreateTarget(__weak id target,SEL action);
UILabel * labelCreateParam(CGRect rect,NSString *text,__weak id superView);

/**
 * Create UIImageView object dot syntax Invoke.Set UIImageView property.(chain-type structure).
 */
/**
 * Create UIImageView object dot syntax Invoke.Set UIImageView property.(chain-type structure).
 */
-(UIImageView *(^)(NSString *))imageViewImageNamed;

-(UIImageView *(^)(UIImage *))imageViewImage;

UIImageView * imageViewCreate(void);

UIImageView * imageViewCreateImageNamed(NSString * imageNamed);

UIImageView * imageViewCreateImage(UIImage *image);

UIImageView * imageViewCreateAddSubView(__weak id superView);

UIImageView * imageViewCreateFrame (CGRect rect);

UIImageView * imageViewCreateBackground (UIColor *color);

UIImageView * imageViewCreateParam(CGRect rect,NSString *imageNamed,__weak id superView);

UIImageView * imageViewCreateParamMore(CGRect rect,UIColor *color,__weak id target,SEL action,__weak id superView);

/**
 * Create UITableView object dot syntax Invoke.Set UIImageView property.(chain-type structure).
 */
/**
 * Create UITableView object dot syntax Invoke.Set UIImageView property.(chain-type structure).
 */

-(UITableView *(^)(__weak UIView * headerView))tableViewHeaderView;

-(UITableView *(^)(__weak UIView * headerView))tableViewFooterView;

-(UITableView *(^)(__weak id delegate))tableViewDelegte;


UITableView *tableViewCreate(CGRect frame);

UITableView *tableViewCreateParam(CGRect frame,UITableViewStyle style,__weak id superView);

UITableView *tableViewCreateParamMore(CGRect frame,UITableViewStyle style,__weak id superView,__weak id delegate);

@end
