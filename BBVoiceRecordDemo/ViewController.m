//
//  ViewController.m
//  BBVoiceRecordDemo
//
//  Created by 谢国碧 on 2016/12/10.
//
//

#import "ViewController.h"
#import "BBVoiceRecordController.h"
#import "UIColor+BBVoiceRecord.h"
#import "BBHoldToSpeakButton.h"

#define kFakeTimerDuration       0.2
#define kMaxRecordDuration       60     //最长录音时长
#define kRemainCountingDuration  10     //剩余多少秒开始倒计时

@interface ViewController ()

@property (nonatomic, strong) BBVoiceRecordController *voiceRecordCtrl;
@property (nonatomic, weak) IBOutlet BBHoldToSpeakButton *btnRecord;
@property (nonatomic, assign) BBVoiceRecordState currentRecordState;
@property (nonatomic, strong) NSTimer *fakeTimer;
@property (nonatomic, assign) float duration;
@property (nonatomic, assign) BOOL canceled;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _btnRecord.layer.borderWidth = 0.5;
    _btnRecord.layer.borderColor = [UIColor colorWithHex:0xA3A5AB].CGColor;
    _btnRecord.layer.cornerRadius = 4;
    _btnRecord.layer.masksToBounds = YES;
    _btnRecord.enabled = NO;    //将事件往上传递
    _btnRecord.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [_btnRecord setTitleColor:[UIColor colorWithHex:0x565656] forState:UIControlStateNormal];
    [_btnRecord setTitleColor:[UIColor colorWithHex:0x565656] forState:UIControlStateHighlighted];
    [_btnRecord setTitle:@"Hold to talk" forState:UIControlStateNormal];
}

- (void)startFakeTimer
{
    if (_fakeTimer) {
        [_fakeTimer invalidate];
        _fakeTimer = nil;
    }
    self.fakeTimer = [NSTimer scheduledTimerWithTimeInterval:kFakeTimerDuration target:self selector:@selector(onFakeTimerTimeOut) userInfo:nil repeats:YES];
    [_fakeTimer fire];
}

- (void)stopFakeTimer
{
    if (_fakeTimer) {
        [_fakeTimer invalidate];
        _fakeTimer = nil;
    }
}

- (void)onFakeTimerTimeOut
{
    self.duration += kFakeTimerDuration;
    NSLog(@"+++duration+++ %f",self.duration);
    float remainTime = kMaxRecordDuration-self.duration;
    if ((int)remainTime == 0) {
        self.currentRecordState = BBVoiceRecordState_Normal;
        [self dispatchVoiceState];
    }
    else if ([self shouldShowCounting]) {
        self.currentRecordState = BBVoiceRecordState_RecordCounting;
        [self dispatchVoiceState];
        [self.voiceRecordCtrl showRecordCounting:remainTime];
    }
    else
    {
        float fakePower = (float)(1+arc4random()%99)/100;
        [self.voiceRecordCtrl updatePower:fakePower];
    }
}

- (BOOL)shouldShowCounting
{
    if (self.duration >= (kMaxRecordDuration-kRemainCountingDuration) && self.duration < kMaxRecordDuration && self.currentRecordState != BBVoiceRecordState_ReleaseToCancel) {
        return YES;
    }
    return NO;
}

- (void)resetState
{
    [self stopFakeTimer];
    self.duration = 0;
    self.canceled = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    if (CGRectContainsPoint(_btnRecord.frame, touchPoint)) {
        self.currentRecordState = BBVoiceRecordState_Recording;
        [self dispatchVoiceState];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_canceled) {
        return;
    }
    
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    if (CGRectContainsPoint(_btnRecord.frame, touchPoint)) {
        self.currentRecordState = BBVoiceRecordState_Recording;
    }
    else
    {
        self.currentRecordState = BBVoiceRecordState_ReleaseToCancel;
    }
    [self dispatchVoiceState];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_canceled) {
        return;
    }
    
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    if (CGRectContainsPoint(_btnRecord.frame, touchPoint)) {
        if (self.duration < 3) {
            [self.voiceRecordCtrl showToast:@"Message Too Short."];
        }
        else
        {
            //upload voice
        }
    }
    self.currentRecordState = BBVoiceRecordState_Normal;
    [self dispatchVoiceState];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_canceled) {
        return;
    }
    
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    if (CGRectContainsPoint(_btnRecord.frame, touchPoint)) {
        if (self.duration < 3) {
            [self.voiceRecordCtrl showToast:@"Message Too Short."];
        }
        else
        {
            //upload voice
        }
    }
    self.currentRecordState = BBVoiceRecordState_Normal;
    [self dispatchVoiceState];
}

- (void)dispatchVoiceState
{
    if (_currentRecordState == BBVoiceRecordState_Recording) {
        self.canceled = NO;
        [self startFakeTimer];
    }
    else if (_currentRecordState == BBVoiceRecordState_Normal)
    {
        [self resetState];
    }
    [_btnRecord updateRecordButtonStyle:_currentRecordState];
    [self.voiceRecordCtrl updateUIWithRecordState:_currentRecordState];
}

- (BBVoiceRecordController *)voiceRecordCtrl
{
    if (_voiceRecordCtrl == nil) {
        _voiceRecordCtrl = [BBVoiceRecordController new];
    }
    return _voiceRecordCtrl;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
