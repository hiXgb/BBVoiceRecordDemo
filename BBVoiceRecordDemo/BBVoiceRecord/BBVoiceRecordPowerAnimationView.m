//
//  BBVoiceRecordPowerAnimationView.m
//  BBVoiceRecordDemo
//
//  Created by 谢国碧 on 2016/12/10.
//
//

#import "BBVoiceRecordPowerAnimationView.h"

@interface BBVoiceRecordPowerAnimationView ()

@property (nonatomic, strong) UIImageView *imgContent;
@property (nonatomic, strong) CAShapeLayer *maskLayer;

@end

@implementation BBVoiceRecordPowerAnimationView

- (void)updateWithPower:(float)power
{
    if (_imgContent == nil) {
        self.imgContent = [UIImageView new];
        _imgContent.backgroundColor = [UIColor clearColor];
        _imgContent.image = [UIImage imageNamed:@"ic_record_ripple"];
        [self addSubview:_imgContent];
    }
    _imgContent.frame = CGRectMake(0, 0, _originSize.width, _originSize.height);
    
    int viewCount = ceil(fabs(power)*10);
    if (viewCount == 0) {
        viewCount++;
    }
    if (viewCount > 9) {
        viewCount = 9;
    }
    
    if (_maskLayer == nil) {
        self.maskLayer = [CAShapeLayer new];
        _maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    }
    
    CGFloat itemHeight = 3;
    CGFloat itemPadding = 3.5;
    CGFloat maskPadding = itemHeight*viewCount + (viewCount-1)*itemPadding;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, _originSize.height - maskPadding, _originSize.width, _originSize.height)];
    _maskLayer.path = path.CGPath;
    _imgContent.layer.mask = _maskLayer;
    
}

@end
