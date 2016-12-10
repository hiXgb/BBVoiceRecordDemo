//
//  BBVoiceRecordPowerAnimationView.h
//  BBVoiceRecordDemo
//
//  Created by 谢国碧 on 2016/12/10.
//
//

#import <UIKit/UIKit.h>

@interface BBVoiceRecordPowerAnimationView : UIView

@property (nonatomic, assign) CGSize originSize;
- (void)updateWithPower:(float)power;

@end
