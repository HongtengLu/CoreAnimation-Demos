//
//  UIView+SCUtils.h
//  Family
//
//  Created by Aevitx on 13-12-31.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

////检测app是否当前运行在iOS 7环境
//NSUInteger DeviceSystemMajorVersion();
//NSUInteger DeviceSystemMajorVersion() {
//    static NSUInteger _deviceSystemMajorVersion = -1;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _deviceSystemMajorVersion = [[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue];
//	});
//    
//	return _deviceSystemMajorVersion;
//}
//#define IS_IOS_7 (DeviceSystemMajorVersion() >= 7)

@interface UIView (SCUtils)

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = x
 */
@property (nonatomic) CGFloat x;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = y
 */
@property (nonatomic) CGFloat y;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.x + frame.origin.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y + frame.origin.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;

/**
 * Return the x coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat screenX;

/**
 * Return the y coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat screenY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGRect screenFrame;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

/**
 * Return the width in portrait or the height in landscape.
 */
@property (nonatomic, readonly) CGFloat orientationWidth;

/**
 * Return the height in portrait or the width in landscape.
 */
@property (nonatomic, readonly) CGFloat orientationHeight;

//适配iOS7前的系统
- (void)adjustBeforeIOS7;
- (void)moveDownForIOS7;

/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;

/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;

/**
 Attaches the given block for a single tap action to the receiver.
 @param block The block to execute.
 */
- (void)whenTapWithBlock:(void (^)(void))block;

/**
 Attaches the given block for a long press action to the receiver.
 @param block The block to execute.
 */
- (void)whenLongPressWithBlock:(void (^)(void))block;


//摇晃
- (void)shakeHorizon;


/**
 *  打印所有层次的view，self为最顶层view
 */
- (void)printViewHierarchy;

@end



@interface UIView (FindFirstResponder)
- (UIView*)findFirstResponder;
@end