//
//  DateTimePicker.h
//  SpaceEye
//
//  Created by  Aman Hafaz on 7/24/16.
//  Copyright © 2016  Aman Hafaz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateTimePicker : UIView {
}

@property (nonatomic, assign, readonly) UIDatePicker *picker;

- (void) setMode: (UIDatePickerMode) mode;
- (void) addTargetForDoneButton: (id) target action: (SEL) action;
- (void) addTargetForCancelButton: (id) target action: (SEL) action;

@end
