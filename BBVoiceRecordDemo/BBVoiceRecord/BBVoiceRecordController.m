//
//  BBVoiceRecordController.m
//  BBVoiceRecordDemo
//
//  Created by 谢国碧 on 2016/12/10.
//
//

#import "BBVoiceRecordController.h"
#import "BBVoiceRecordView.h"

@interface BBVoiceRecordController ()

@property (nonatomic, strong) BBVoiceRecordView *voiceRecordView;
@property (nonatomic, strong) BBVoiceRecordTipView *tipView;
@end

@implementation BBVoiceRecordController

- (void)updatePower:(float)power
{
    [self.voiceRecordView updatePower:power];
}

- (void)showRecordCounting:(float)remainTime
{
    [self.voiceRecordView updateWithRemainTime:remainTime];
}

- (void)showToast:(NSString *)message
{
    if (self.tipView.superview == nil) {
        [[UIApplication sharedApplication].keyWindow addSubview:self.tipView];
        [self.tipView showWithMessage:message];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tipView removeFromSuperview];
        });
    }
}

- (void)updateUIWithRecordState:(BBVoiceRecordState)state
{
    if (state == BBVoiceRecordState_Normal) {
        if (self.voiceRecordView.superview) {
            [self.voiceRecordView removeFromSuperview];
        }
        return;
    }
    
    if (self.voiceRecordView.superview == nil) {
        [[UIApplication sharedApplication].keyWindow addSubview:self.voiceRecordView];
    }
    
    [self.voiceRecordView updateUIWithRecordState:state];
}

- (BBVoiceRecordView *)voiceRecordView
{
    if (_voiceRecordView == nil) {
        _voiceRecordView = [BBVoiceRecordView new];
        _voiceRecordView.frame = CGRectMake(0, 0, 150, 150);
        _voiceRecordView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    }
    return _voiceRecordView;
}

- (BBVoiceRecordTipView *)tipView
{
    if (_tipView == nil) {
        _tipView = [BBVoiceRecordTipView new];
        _tipView.frame = CGRectMake(0, 0, 150, 150);
        _tipView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    }
    return _tipView;
}

@end
