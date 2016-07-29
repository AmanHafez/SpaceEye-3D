//
//  DateTimePicker.m
//  SpaceEye
//
//  Created by Aman Hafaz on 7/24/16.
//  Copyright © 2016 Aman Hafaz. All rights reserved.
//

#import "DateTimePicker.h"

#import "DateTimePicker.h"

#define MyDateTimePickerToolbarHeight 40

@interface DateTimePicker()

@property (nonatomic, assign, readwrite) UIDatePicker *picker;

@property (nonatomic, assign) id doneTarget;
@property (nonatomic, assign) id cancelTarget;
@property (nonatomic, assign) SEL doneSelector;
@property (nonatomic, assign) SEL cancelSelector;

- (void) donePressed;

@end


@implementation DateTimePicker

@synthesize picker = _picker;

@synthesize doneTarget = _doneTarget;
@synthesize cancelTarget = _cancelTarget;
@synthesize doneSelector = _doneSelector;
@synthesize cancelSelector = _cancelSelector;

- (id) initWithFrame: (CGRect) frame {
    if ((self = [super initWithFrame: frame])) {
        
        CATransition *animation = [CATransition animation];
        [animation setDelegate:self];
        // Set the type and if appropriate direction of the transition,
        [animation setType:kCATransitionMoveIn];
        [animation setSubtype:kCATransitionFromBottom];
        // Set the duration and timing function of the transtion -- duration is passed in as a parameter, use ease in/ease out as the timing function
        [animation setDuration:0.4];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
        
        UIDatePicker *picker = [[UIDatePicker alloc] initWithFrame: CGRectMake(0, 0, frame.size.width, frame.size.height)];
        picker.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        // switch the DatePicker mode to UIDatePickerModeDate
        picker.datePickerMode = UIDatePickerModeDate;
        [[picker layer] addAnimation:animation forKey:@"transittionAnimation"];
        
        [self addSubview: picker];
        
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0, 0, picker.frame.size.width, 44)];
        toolbar.barStyle = UIBarStyleBlackOpaque;
        toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle: @"Done" style: UIBarButtonItemStyleDone target: self action: @selector(donePressed)];
        UIBarButtonItem* flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle: @"Cancel" style: UIBarButtonItemStyleDone target: self action: @selector(cancelPressed)];
        toolbar.items = [NSArray arrayWithObjects:cancelButton,flexibleSpace, doneButton, nil];
        
        [self addSubview: toolbar];
        
        self.picker = picker;
        // Get currently selected date
        NSDate *currentDate = picker.date;;
        NSLog(@"Date = %@", currentDate);
        
        
        
        // use the maximumDate and the minimumDate properties to adjust the range
        
        NSTimeInterval oneYearTime = 365 * 24 * 60 * 60;
        NSDate *Date1 = [NSDate date];
        NSDate *epochDate = [Date1 dateByAddingTimeInterval:-46 *oneYearTime];
        
        NSDate *year3000 = [Date1 dateByAddingTimeInterval:1716 * oneYearTime];
        
        
        picker.minimumDate = epochDate;
        picker.maximumDate = year3000;
        
    }
    return self;
}

- (void) setMode: (UIDatePickerMode) mode {
    self.picker.datePickerMode = mode;
}

- (void) donePressed {
    if (self.doneTarget) {
        [self.doneTarget performSelector:self.doneSelector withObject:nil afterDelay:0];
    }
}

- (void) cancelPressed {
    if (self.cancelTarget) {
        [self.cancelTarget performSelector:self.cancelSelector withObject:nil afterDelay:0];
    }
}

- (void) addTargetForDoneButton: (id) target action: (SEL) action {
    self.doneTarget = target;
    self.doneSelector = action;
}

- (void) addTargetForCancelButton: (id) target action: (SEL) action {
    self.cancelTarget=target;
    self.cancelSelector=action;
}

@end

