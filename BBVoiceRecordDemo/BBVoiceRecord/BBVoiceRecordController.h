//
//  BBVoiceRecordController.h
//  BBVoiceRecordDemo
//
//  Created by 谢国碧 on 2016/12/10.
//
//

#import <Foundation/Foundation.h>
#import "BBVoiceRecordHeaderDefine.h"

@interface BBVoiceRecordController : NSObject

- (void)updateUIWithRecordState:(BBVoiceRecordState)state;
- (void)showToast:(NSString *)message;
- (void)updatePower:(float)power;
- (void)showRecordCounting:(float)remainTime;

@end
