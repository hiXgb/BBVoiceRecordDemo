//
//  BBVoiceRecordView.m
//  BBVoiceRecordDemo
//
//  Created by 谢国碧 on 2016/12/10.
//
//

#import "BBVoiceRecordView.h"
#import "UIColor+BBVoiceRecord.h"

@interface BBVoiceRecordView ()

@property (nonatomic, strong) BBVoiceRecordingView *recodingView;
@property (nonatomic, strong) BBVoiceRecordReleaseToCancelView *releaseToCancelView;
@property (nonatomic, strong) BBVoiceRecordCountingView *countingView;
@property (nonatomic, assign) BBVoiceRecordState currentState;

@end

@implementation BBVoiceRecordView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    if (!_recodingView) {
        self.recodingView = [[BBVoiceRecordingView alloc] initWithFrame:self.bounds];
        [self addSubview:_recodingView];
        _recodingView.hidden = YES;
    }
    
    if (!_releaseToCancelView) {
        self.releaseToCancelView = [[BBVoiceRecordReleaseToCancelView alloc] initWithFrame:self.bounds];
        [self addSubview:_releaseToCancelView];
        _releaseToCancelView.hidden = YES;
    }
    
    if (!_countingView) {
        self.countingView = [[BBVoiceRecordCountingView alloc] initWithFrame:self.bounds];
        [self addSubview:_countingView];
        _countingView.hidden = YES;
    }
    
    self.backgroundColor = [UIColor colorWithHex:0x000000 alpha:0.5];
    self.layer.cornerRadius = 6;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _recodingView.frame = self.bounds;
    _releaseToCancelView.frame = self.bounds;
    _countingView.frame = self.bounds;
}

- (void)updatePower:(float)power
{
    if (_currentState != BBVoiceRecordState_Recording) {
        return;
    }
    [_recodingView updateWithPower:power];
}

- (void)updateWithRemainTime:(float)remainTime
{
    if (_currentState != BBVoiceRecordState_RecordCounting || _releaseToCancelView.hidden == false) {
        return;
    }
    [_countingView updateWithRemainTime:remainTime];
}

- (void)updateUIWithRecordState:(BBVoiceRecordState)state
{
    self.currentState = state;
    if (state == BBVoiceRecordState_Normal) {
        _recodingView.hidden = YES;
        _releaseToCancelView.hidden = YES;
        _countingView.hidden = YES;
    }
    else if (state == BBVoiceRecordState_Recording)
    {
        _recodingView.hidden = NO;
        _releaseToCancelView.hidden = YES;
        _countingView.hidden = YES;
    }
    else if (state == BBVoiceRecordState_ReleaseToCancel)
    {
        _recodingView.hidden = YES;
        _releaseToCancelView.hidden = NO;
        _countingView.hidden = YES;
    }
    else if (state == BBVoiceRecordState_RecordCounting)
    {
        _recodingView.hidden = YES;
        _releaseToCancelView.hidden = YES;
        _countingView.hidden = NO;
    }
    else if (state == BBVoiceRecordState_RecordTooShort)
    {
        _recodingView.hidden = YES;
        _releaseToCancelView.hidden = YES;
        _countingView.hidden = YES;
    }
}

@end
