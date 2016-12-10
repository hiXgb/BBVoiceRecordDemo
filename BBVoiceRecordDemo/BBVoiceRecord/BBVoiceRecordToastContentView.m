//
//  BBVoiceRecordToastContentView.m
//  BBVoiceRecordDemo
//
//  Created by 谢国碧 on 2016/12/10.
//
//

#import "BBVoiceRecordToastContentView.h"
#import "BBVoiceRecordPowerAnimationView.h"
#import "UIColor+BBVoiceRecord.h"
#import "Masonry.h"

@implementation BBVoiceRecordToastContentView

@end

//----------------------------------------//
@interface BBVoiceRecordingView ()

@property (nonatomic, strong) UIImageView *imgRecord;
@property (nonatomic, strong) UILabel *lbContent;
@property (nonatomic, strong) BBVoiceRecordPowerAnimationView *powerView;

@end

@implementation BBVoiceRecordingView

- (void)dealloc
{
    //
}

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
    if (_lbContent == nil) {
        _lbContent = [[UILabel alloc] initWithFrame:self.bounds];
        _lbContent.backgroundColor = [UIColor clearColor];
        _lbContent.text = @"Slide up to cancel";
        _lbContent.textColor = [UIColor whiteColor];
        _lbContent.textAlignment = NSTextAlignmentCenter;
        _lbContent.font = [UIFont systemFontOfSize:14];
        [self addSubview:_lbContent];
    }
    if (_imgRecord == nil) {
        _imgRecord = [UIImageView new];
        _imgRecord.backgroundColor = [UIColor clearColor];
        _imgRecord.image = [UIImage imageNamed:@"ic_record"];
        [self addSubview:_imgRecord];
    }
    if (_powerView == nil) {
        _powerView = [BBVoiceRecordPowerAnimationView new];
        _powerView.backgroundColor = [UIColor clearColor];
        [self addSubview:_powerView];
    }
    
    
    CGSize textSize = [_lbContent sizeThatFits:CGSizeZero];
    [_lbContent mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.bottom.equalTo(self).offset(-12);
        make.size.height.mas_equalTo(ceil(textSize.height));
    }];
    
    [_imgRecord mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(30);
        make.leading.equalTo(self).offset(40);
        make.size.mas_equalTo(CGSizeMake(_imgRecord.image.size.width, _imgRecord.image.size.height));
    }];
    
    CGSize powerSize = CGSizeMake(18, 56);
    [_powerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_imgRecord);
        make.leading.equalTo(_imgRecord.mas_trailing).offset(4);
        make.size.mas_equalTo(powerSize);
    }];
    //默认显示一格音量
    _powerView.originSize = powerSize;
    [_powerView updateWithPower:0];
}

- (void)updateWithPower:(float)power
{
    [_powerView updateWithPower:power];
}

@end

//----------------------------------------//
@interface BBVoiceRecordReleaseToCancelView ()

@property (nonatomic, strong) UIImageView *imgRelease;
@property (nonatomic, strong) UILabel *lbContent;

@end

@implementation BBVoiceRecordReleaseToCancelView

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
    if (_lbContent == nil) {
        _lbContent = [[UILabel alloc] initWithFrame:self.bounds];
        _lbContent.backgroundColor = [UIColor colorWithHex:0xA52E2C];
        _lbContent.text = @"Release to cancel";
        _lbContent.textColor = [UIColor whiteColor];
        _lbContent.textAlignment = NSTextAlignmentCenter;
        _lbContent.font = [UIFont boldSystemFontOfSize:14];
        _lbContent.layer.cornerRadius = 2;
        _lbContent.clipsToBounds = YES;
        [self addSubview:_lbContent];
    }
    if (_imgRelease == nil) {
        _imgRelease = [UIImageView new];
        _imgRelease.backgroundColor = [UIColor clearColor];
        _imgRelease.image = [UIImage imageNamed:@"ic_release_to_cancel"];
        [self addSubview:_imgRelease];
    }
    
    [_imgRelease mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(30);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(_imgRelease.image.size.width, _imgRelease.image.size.height));
    }];
    
    [_lbContent mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(3);
        make.trailing.equalTo(self).offset(-3);
        make.bottom.equalTo(self).offset(-7);
        make.size.height.mas_equalTo(25);
    }];
    
}

@end

//----------------------------------------//
@interface BBVoiceRecordCountingView ()

@property (nonatomic, strong) UILabel *lbContent;
@property (nonatomic, strong) UILabel *lbRemainTime;

@end

@implementation BBVoiceRecordCountingView

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
    if (_lbContent == nil) {
        _lbContent = [[UILabel alloc] initWithFrame:self.bounds];
        _lbContent.backgroundColor = [UIColor colorWithHex:0xA52E2C];
        _lbContent.text = @"Release to cancel";
        _lbContent.textColor = [UIColor whiteColor];
        _lbContent.textAlignment = NSTextAlignmentCenter;
        _lbContent.font = [UIFont boldSystemFontOfSize:14];
        _lbContent.layer.cornerRadius = 2;
        _lbContent.clipsToBounds = YES;
        [self addSubview:_lbContent];
    }
    if (_lbRemainTime == nil) {
        _lbRemainTime = [UILabel new];
        _lbRemainTime.backgroundColor = [UIColor clearColor];
        _lbRemainTime.font = [UIFont boldSystemFontOfSize:80];
        _lbRemainTime.textColor = [UIColor whiteColor];
        [self addSubview:_lbRemainTime];
    }
    
    [_lbContent mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(3);
        make.trailing.equalTo(self).offset(-3);
        make.bottom.equalTo(self).offset(-7);
        make.size.height.mas_equalTo(25);
    }];
}

- (void)updateWithRemainTime:(float)remainTime
{
    _lbRemainTime.text = [NSString stringWithFormat:@"%d",(int)remainTime];
    CGSize textSize = [_lbRemainTime sizeThatFits:CGSizeZero];
    [_lbRemainTime mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(16);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(ceil(textSize.width), 95));
    }];
}

@end

//----------------------------------------//
@interface BBVoiceRecordTipView ()

@property (nonatomic, strong) UIImageView *imgIcon;
@property (nonatomic, strong) UILabel *lbContent;

@end

@implementation BBVoiceRecordTipView

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
    self.backgroundColor = [UIColor colorWithHex:0x000000 alpha:0.5];
    self.layer.cornerRadius = 6;
    
    if (_lbContent == nil) {
        _lbContent = [[UILabel alloc] initWithFrame:self.bounds];
        _lbContent.backgroundColor = [UIColor clearColor];
        _lbContent.textColor = [UIColor whiteColor];
        _lbContent.textAlignment = NSTextAlignmentCenter;
        _lbContent.font = [UIFont systemFontOfSize:14];
        _lbContent.text = @"Message Too Short.";
        [self addSubview:_lbContent];
    }
    if (_imgIcon == nil) {
        _imgIcon = [UIImageView new];
        _imgIcon.backgroundColor = [UIColor clearColor];
        _imgIcon.image = [UIImage imageNamed:@"ic_record_too_short"];
        [self addSubview:_imgIcon];
    }
}

- (void)showWithMessage:(NSString *)msg
{
    _lbContent.text = msg;
    
    [_imgIcon mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(32);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(_imgIcon.image.size.width, _imgIcon.image.size.height));
    }];
    CGSize textSize = [_lbContent sizeThatFits:CGSizeZero];
    [_lbContent mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-12);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.size.height.mas_equalTo(ceil(textSize.height));
    }];
}

@end

