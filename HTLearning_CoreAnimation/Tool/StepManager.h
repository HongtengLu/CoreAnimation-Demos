//
//  StepManager.h
//  HTLearning_CoreAnimation
//
//  Created by Lu on 2017/1/3.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class StepManager;
//@protocol StepManagerDataSource
//-(NSArray<NSString *> *)SelectorStringsForStepManager:(StepManager *)stepManager index:(NSUInteger)index;
//@end

typedef void(^StepManagerResetBlock)();

@interface StepManager : NSObject

//@property (nonatomic, weak) id <StepManagerDataSource> dataSource;

@property (nonatomic,readonly, strong)NSMutableDictionary *SELS;

@property (nonatomic, strong)UIButton *stepBtn;

@property (nonatomic, assign)BOOL resetable;

@property (nonatomic, copy) StepManagerResetBlock resetBlock;

+ (instancetype)manager;

+(instancetype)managerWithSEL:(NSArray *)SELS target:(id)target resetBlock:(StepManagerResetBlock)block;

- (void)resetTarget:(id)target SelectorStrings:(NSArray *)selectorStrings;

@end
