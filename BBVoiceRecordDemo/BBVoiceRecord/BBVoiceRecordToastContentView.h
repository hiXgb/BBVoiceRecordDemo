//
//  BBVoiceRecordToastContentView.h
//  BBVoiceRecordDemo
//
//  Created by 谢国碧 on 2016/12/10.
//
//

#import <UIKit/UIKit.h>

@interface BBVoiceRecordToastContentView : UIView

@end

//----------------------------------------//
@interface BBVoiceRecordingView : BBVoiceRecordToastContentView

- (void)updateWithPower:(float)power;

@end

//----------------------------------------//
@interface BBVoiceRecordReleaseToCancelView : BBVoiceRecordToastContentView


@end

//----------------------------------------//

@interface BBVoiceRecordCountingView : BBVoiceRecordToastContentView

- (void)updateWithRemainTime:(float)remainTime;

@end

//----------------------------------------//
@interface BBVoiceRecordTipView : BBVoiceRecordToastContentView

- (void)showWithMessage:(NSString *)msg;

@end
