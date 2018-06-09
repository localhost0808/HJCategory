//  UIView+Construction.m
//  Created by iOS on 2018/6/6.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "UIView+Construction.h"

#define addView \
if (superView == NULL) {\
    return view;\
}\
[superView addSubview:view];\
return view;

@implementation UIView (Construction)
/**
 * Add a lot if UIView instasceObjcet
 */
- (void)addSubviews:(NSArray<__kindof UIView *> *)subViews {
    for (UIView *view in subViews) {
        [self addSubview:view];
    }
}
/**
 * Create UIView object dot syntax Invoke.Set UIView property.(chain-type structure).
 */
// Marks UIView frame property instead dot syntax.(view.frame).return parameter is UIView instace object.
/**
 * mark s UIVIew
 */
-(UIView *(^)(CGRect))viewFrame {
    return ^id(CGRect frame) {
        self.frame = frame;
        return self;
    };
}
// Marks UIView frame property instead dot syntax.(view.backgroundColor).return parameter is UIView instace object.
-(UIView *(^)(UIColor *))viewColor {
    return ^id(UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}
// Marks UIView frame property instead dot syntax.(view.tag).return parameter is UIView instace object.
-(UIView *(^)(NSInteger))viewTag {
    return ^id(NSInteger tag) {
        self.tag = tag;
        return self;
    };
}
// Marks UIView frame property instead dot syntax.(view.bounds).return parameter is UIView instace object.
-(UIView *(^)(CGRect))viewBounds {
    return ^id(CGRect bounds) {
        self.bounds = bounds;
        return self;
    };
}
// Marks UIView frame property instead dot syntax.(view.center).return parameter is UIView instace object.
-(UIView *(^)(CGPoint))viewCenter {
    return ^id(CGPoint center) {
        self.center = center;
        return self;
    };
}
// Marks UIView frame property instead dot syntax.(view.bounds and view.center).return parameter is UIView instace object.
-(UIView *(^)(CGRect))viewCenterFrame {
    return ^id(CGRect frame) {
        self.bounds = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.center = frame.origin;
        return self;
    };
}
// Marks UIView frame property instead dot syntax.(view.alpha).return parameter is UIView instace object.
-(UIView *(^)(CGFloat))viewAlpha {
    return ^id(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}
// Marks UIView frame property instead dot syntax.(view.hidden).return parameter is UIView instace object.
-(UIView *(^)(BOOL))viewHidden {
    return ^id(BOOL hidden) {
        self.hidden = hidden;
        return self;
    };
}
-(UIView *(^)(BOOL))viewRadius {
    return ^id(BOOL radius) {
        if (radius) {
            [self layoutIfNeeded];
            CGFloat cor = self.frame.size.width < self.frame.size.height? self.frame.size.width : self.frame.size.height;
            self.layer.cornerRadius = cor/2;
            self.clipsToBounds = YES;
        }
        return self;
    };
}

// Marks UIView frame property instead dot syntax.(view.userInteractionEnabled).return parameter is UIView instace object.
-(UIView *(^)(BOOL))viewUserInteractionEnabled {
    return ^id(BOOL userInteractionEnabled) {
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}
// Marks UIView frame property instead dot syntax.(view.addGestureRecognizer).return parameter is UIView instace object.
-(UIView *(^)(UIGestureRecognizer * ))viewAddGestureRecognizer {
    return ^id(UIGestureRecognizer *gestureRecognizer) {
        [self addGestureRecognizer:gestureRecognizer];
        return self;
    };
}
// Marks UIView frame property instead dot syntax.(view.removeGestureRecognizer).return parameter is UIView instace object.
-(UIView *(^)(UIGestureRecognizer * ))viewRemoveGestureRecognizer {
    return ^id(UIGestureRecognizer *gestureRecognizer) {
        [self removeGestureRecognizer:gestureRecognizer];
        return self;
    };
}

-(UIView *(^)(__weak id,NSString *))viewAddTarget {
    return ^id(__weak id target,NSString *action) {
        UIGestureRecognizer *tap = [[UIGestureRecognizer alloc] initWithTarget:target action:@selector(action)];
        [self addGestureRecognizer:tap];
        return self;
    };
}
// Marks UIView frame property instead dot syntax.(view.addSubView).return parameter is UIView instace object.
-(UIView *(^)(UIView * ))viewAddSubView {
    return ^id(UIView *view) {
        [self addSubview:view];
        return self;
    };
}
// Marks UIView frame property instead dot syntax.(view.AddSubviews is custom).return parameter is UIView instace object.
-(UIView *(^)(NSArray<__kindof UIView *> *))viewAddSubviews {
    return ^id(NSArray *subViews) {
        [self addSubviews:subViews];
        return self;
    };
}
// Marks UIView frame property instead dot syntax.([view.addSubView:self]).return parameter is UIView instace object.
-(UIView *(^)(UIView * __weak ))viewAddSuperView {
    return ^id(UIView *SuperView) {
        [SuperView addSubview:self];
        return self;
    };
}

# pragma mark --- Create UIView Function
UIView * viewCreate(void) {
    return UIView.new;
}
UIView * viewCreateAddSubView(__weak id superView) {
    return viewCreate().viewAddSuperView(superView);
}

UIView * viewCreateFrame (CGRect rect) {
    return viewCreate().viewFrame(rect);
}

UIView * viewCreateBackground (UIColor *color) {
    return viewCreate().viewColor(color);
}

UIView * viewCreateParam(CGRect rect,UIColor *color,__weak id superView) {
    return viewCreate().viewFrame(rect).viewColor(color).viewAddSuperView(superView);
}

UIView * viewCreateParamMore(CGRect rect,UIColor *color,__weak id target,NSString *action,__weak id superView) {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:@selector(action)];
    return viewCreate().viewFrame(rect).viewColor(color).viewAddSuperView(superView).viewAddGestureRecognizer(tap);
}
//@end

//@class UILabel;
# pragma mark --- Create UIButton Mothod
//@implementation UIButton (Construction)
//Support Mothod or function

#define isButtonDefine \
    if (![self isKindOfClass:[UIButton class]]) {\
        return self;\
    }\
    UIButton *button = (UIButton *)self;


/**
 * Create UIButton object dot syntax Invoke.Set UIButton property.(chain-type structure).
 */
-(UIButton *(^)(NSString *))buttonTitle {
    return ^id(NSString *title) {
        isButtonDefine;
        [button setTitle:title forState:UIControlStateNormal];
//        ((void (*)(id, SEL, NSString *,UIControlState))(void *)objc_msgSend)((id)self, sel_registerName("setTitle:forState:"), (NSString *)title,(UIControlState)UIControlStateNormal);
        return button;
    };
}
-(UIButton *(^)(NSString *,UIControlState))buttonTitleState {
    return ^id(NSString *title,UIControlState state) {
        isButtonDefine;
        [button setTitle:title forState:state];
//        ((void (*)(id, SEL, NSString *,UIControlState))(void *)objc_msgSend)((id)self, sel_registerName("setTitle:forState:"), (NSString *)title,(UIControlState)state);
        return button;
    };
}
-(UIButton *(^)(UIColor *))buttonTitleColor {
    return ^id(UIColor *color) {
        isButtonDefine;
        [button setTitleColor:color forState:UIControlStateNormal];
        return button;
    };
}
-(UIButton *(^)(UIFont *))buttonFont {
    return ^id(UIFont *font) {
        isButtonDefine;
        button.titleLabel.font = font;
        return button;
    };
}
-(UIButton *(^)(CGFloat))buttonFontSize {
    return ^id(CGFloat size) {
        isButtonDefine;
        button.titleLabel.font = [UIFont systemFontOfSize:size];
        return button;
    };
}
-(UIButton *(^)(NSInteger))buttonNumberOfLines {
    return ^id(NSInteger number) {
        isButtonDefine;
        button.titleLabel.numberOfLines = number;
        return button;
    };
}
-(UIButton *(^)(BOOL))buttonAdjustsFontSizeToFitWidth {
    return ^id(BOOL isFit) {
        isButtonDefine;
        button.titleLabel.adjustsFontSizeToFitWidth = isFit;
        return button;
    };
}
-(UIButton *(^)(UIImage *))buttonImage {
    return ^id(UIImage *image) {
        isButtonDefine;
        [button setImage:image forState:UIControlStateNormal];
        return button;
    };
}
-(UIButton *(^)(UIImage *,UIControlState))buttonImageState {
    return ^id(UIImage *image,UIControlState state) {
        isButtonDefine;
        [button setImage:image forState:state];
        return button;
    };
}
- (UIButton *(^)(UIColor *color))buttonBGColor {
    return ^id(UIColor *color) {
        isButtonDefine;
        [button setBackgroundColor:color];
        return button;
    };
}
-(UIButton *(^)(UIImage *))buttonBGImage {
    return ^id(UIImage *image) {
        isButtonDefine;
        [button setBackgroundImage:image forState:UIControlStateNormal];
        return button;
    };
}

-(UIButton *(^)(UIImage *,UIControlState))buttonBGImageState {
    return ^id(UIImage *image,UIControlState state) {
        isButtonDefine;
        [button setBackgroundImage:image forState:state];
        return button;
    };
}

-(UIButton *(^)(__weak id,NSString *))buttonAddTarget {
    return ^id(__weak id target,NSString *action) {
        isButtonDefine;
        [button addTarget:target action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
        return button;
    };
}

// Marks UIButton and UIButton subClass View Class Constrution function (C define function).
UIButton * buttonCreate(void) {
    return [UIButton buttonWithType:UIButtonTypeCustom];
}

UIButton * buttonCreateFrame(CGRect rect) {
    return (UIButton *)buttonCreate().viewFrame;
}
UIButton * buttonCreateTitle(NSString *title) {
    return buttonCreate().buttonTitle(title);
}
UIButton * buttonCreateTitleColor(UIColor *color) {
    return buttonCreate().buttonTitleColor(color);
}
UIButton * buttonCreateBGColor(UIColor *color) {
    return buttonCreate().buttonBGColor(color);
}
UIButton * buttonCreateImage(UIImage *image) {
    return buttonCreate().buttonImage(image);
}
UIButton * buttonCreateBGImage(UIImage *image) {
    return buttonCreate().buttonBGImage(image);
}
UIButton * buttonCreateFont(CGFloat fontSize) {
    return buttonCreate().buttonFontSize(fontSize);
}
UIButton * buttonCreateTarget(__weak id target,NSString *action) {
    return buttonCreate().buttonAddTarget(target,action);
}
UIButton * buttonCreateParam(CGRect rect,NSString *title,UIImage *image,__weak id target,NSString *action,__weak id superView) {
    return buttonCreate().viewFrame(rect).buttonTitle(title).buttonBGImage(image).viewAddSuperView(superView).buttonAddTarget(target,action);
}

# pragma mark --- UILabel


#define isLabelDefine \
if (![self isKindOfClass:[UILabel class]]) {\
return self;\
}\
UILabel *label = (UILabel *)self;


/**
 * Create UILabel object dot syntax Invoke.Set UILabel property.(chain-type structure).
 */
/**
 * Create UILabel object dot syntax Invoke.Set UILabel property.(chain-type structure).
 */
-(UILabel *(^)(NSString *))labelText {
    return ^id(NSString *text) {
        isLabelDefine;
        label.text = text;
        return label;
    };
}
-(UILabel *(^)(UIColor *))labelTextColor {
    return ^id(UIColor *textColor) {
        isLabelDefine;
        label.textColor = textColor;
        return label;
    };
}
-(UILabel *(^)(UIFont *))labelFont {
    return ^id(UIFont *font) {
        isLabelDefine;
        label.font = font;
        return label;
    };
}
-(UILabel *(^)(CGFloat))labelFontSize {
    return ^id(CGFloat fontSize) {
        isLabelDefine;
        label.font = [UIFont systemFontOfSize:fontSize];
        return label;
    };
}
-(UILabel *(^)(NSInteger))labelNumberOfLines {
    return ^id(NSInteger number) {
        isLabelDefine;
        label.numberOfLines = number;
        return label;
    };
}
-(UILabel *(^)(BOOL))labelAdjustsFontSizeToFitWidth {
    return ^id(BOOL isFit) {
        isLabelDefine;
        label.adjustsFontSizeToFitWidth = isFit;
        return label;
    };
}

// Marks UILabel and UILabel subClass View Class Constrution function (C define function).
UILabel * labelCreate(void) {
    return [UILabel new];
}
UILabel * labelCreateFrame(CGRect rect) {
    return (UILabel *)labelCreate().viewFrame(rect);
}
UILabel * labelCreateText(NSString *text) {
    return labelCreate().labelText(text);
}
UILabel * labelCreateTextColor(UIColor *color) {
    return labelCreate().labelTextColor(color);
}
UILabel * labelCreateBackground(UIColor *color) {
    return (UILabel *)labelCreate().viewColor(color);
}

UILabel * labelCreateFont(CGFloat fontSize) {
    return labelCreate().labelFontSize(fontSize);
}

UILabel * labelCreateParam(CGRect rect,NSString *text,__weak id superView) {
    return labelCreate().viewFrame(rect).viewAddSuperView(superView).labelText(text);
}

# pragma mark --- UIImageView


#define isUIImageViewDefine \
if (![self isKindOfClass:[UIImageView class]]) {\
return self;\
}\
UIImageView *imageView = (UIImageView *)self;


/**
 * Create UIImageView object dot syntax Invoke.Set UIImageView property.(chain-type structure).
 */
/**
 * Create UIImageView object dot syntax Invoke.Set UIImageView property.(chain-type structure).
 */
-(UIImageView *(^)(NSString *))imageViewImageNamed {
    return ^id(NSString *imageNamed) {
        isUIImageViewDefine;
        imageView.image = [UIImage imageNamed:imageNamed];
        return imageView;
    };
}

-(UIImageView *(^)(UIImage *))imageViewImage {
    return ^id(UIImage *image) {
        isUIImageViewDefine;
        imageView.image = image;
        return imageView;
    };
}

UIImageView * imageViewCreate(void) {
    return UIImageView.new;
}

UIImageView * imageViewCreateImageNamed(NSString * imageNamed) {
    return imageViewCreate().imageViewImageNamed(imageNamed);
}

UIImageView * imageViewCreateImage(UIImage *image) {
    return (UIImageView *)imageViewCreate().imageViewImage(image);
}

UIImageView * imageViewCreateAddSubView(__weak id superView) {
    return (UIImageView *)imageViewCreate().viewAddSuperView(superView);
}

UIImageView * imageViewCreateFrame (CGRect rect) {
    return (UIImageView *)imageViewCreate().viewFrame(rect);
}

UIImageView * imageViewCreateBackground (UIColor *color) {
    return (UIImageView *)imageViewCreate().viewColor(color);
}

UIImageView * imageViewCreateParam(CGRect rect,NSString *imageNamed,__weak id superView) {
    return (UIImageView *)imageViewCreate().viewFrame(rect).viewAddSuperView(superView).imageViewImageNamed(imageNamed);
}

UIImageView * imageViewCreateParamMore(CGRect rect,UIColor *color,__weak id target,NSString *action,__weak id superView) {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:@selector(action)];
    return (UIImageView *)imageViewCreate().viewFrame(rect).viewColor(color).viewAddSuperView(superView).viewAddGestureRecognizer(tap);
}

#define isUITableView \
if (![self isKindOfClass:[UITableView class]]) {\
return self;\
}\
UITableView *tableView = (UITableView *)self;


/**
 * Create UITableView object dot syntax Invoke.Set UIImageView property.(chain-type structure).
 */
/**
 * Create UITableView object dot syntax Invoke.Set UIImageView property.(chain-type structure).
 */

-(UITableView *(^)(__weak UIView * headerView))tableViewHeaderView {
    return ^id(__weak UIView * headerView) {
        isUITableView;
        tableView.tableHeaderView = headerView;
        return tableView;
    };
}

-(UITableView *(^)(__weak UIView * headerView))tableViewFooterView {
    return ^id(__weak UIView * footerView) {
        isUITableView;
        tableView.tableFooterView = footerView;
        return tableView;
    };
}

-(UITableView *(^)(__weak id delegate))tableViewDelegte {
    return ^id(__weak id delegate) {
        isUITableView;
        tableView.delegate = delegate;
        tableView.dataSource = delegate;
        return tableView;
    };
}

UITableView *tableViewCreate(CGRect frame) {
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    return tableView;
}


UITableView *tableViewCreateParam(CGRect frame,UITableViewStyle style,__weak id superView) {
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    [tableView addSubview:superView];
    return tableView;
}

UITableView *tableViewCreateParamMore(CGRect frame,UITableViewStyle style,__weak id superView,__weak id delegate) {
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    [tableView addSubview:superView];
    tableView.tableViewDelegte(delegate);
    return tableView;
}



@end
