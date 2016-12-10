//
//  BBVoiceRecordHeaderDefine.h
//  BBVoiceRecordDemo
//
//  Created by 谢国碧 on 2016/12/10.
//
//

#ifndef BBVoiceRecordHeaderDefine_h
#define BBVoiceRecordHeaderDefine_h

typedef NS_ENUM(NSInteger, BBVoiceRecordState)
{
    BBVoiceRecordState_Normal,          //初始状态
    BBVoiceRecordState_Recording,       //正在录音
    BBVoiceRecordState_ReleaseToCancel, //上滑取消（也在录音状态，UI显示有区别）
    BBVoiceRecordState_RecordCounting,  //最后10s倒计时（也在录音状态，UI显示有区别）
    BBVoiceRecordState_RecordTooShort,  //录音时间太短（录音结束了）
};

#endif /* BBVoiceRecordHeaderDefine_h */
