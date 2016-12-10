//
//  BBVoiceRecordView.h
//  BBVoiceRecordDemo
//
//  Created by 谢国碧 on 2016/12/10.
//
//

#import <UIKit/UIKit.h>
#import "BBVoiceRecordHeaderDefine.h"
#import "BBVoiceRecordToastContentView.h"

@interface BBVoiceRecordView : UIView

- (void)updateUIWithRecordState:(BBVoiceRecordState)state;
- (void)updatePower:(float)power;
- (void)updateWithRemainTime:(float)remainTime;

@end
