//
//  OTRDescriptionOnboardingView.m
//  Off the Record
//
//  Created by David on 7/24/13.
//  Copyright (c) 2013 Chris Ballinger. All rights reserved.
//

#import "OTRDescriptionOnboardingView.h"
#import "Strings.h"
#import "OTRConstants.h"

@implementation OTRDescriptionOnboardingView

@synthesize sendCrashReportsSwitch,sendCrashReportsLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.actionButton setTitle:@"Continue" forState:UIControlStateNormal];
        self.textLabel.text = @"This is a cool nifty description";
        
        crittercismSetting = [[OTRBoolSetting alloc] initWithTitle:CRITTERCISM_TITLE_STRING description:CRITTERCISM_DESCRIPTION_STRING settingsKey:kOTRSettingKeyCrittercismOptIn];
        
        CGFloat y = self.textLabel.frame.size.height +self.textLabel.frame.origin.y+10;
        CGRect crashReportsFrame = CGRectMake(self.textLabel.frame.origin.x, y, frame.size.width-20, 50);
        UIView * crashReportsview = [[UIView alloc] initWithFrame:crashReportsFrame];
        self.sendCrashReportsSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
        CGRect switchRect = self.sendCrashReportsSwitch.frame;
        switchRect.origin.x = crashReportsview.frame.size.width - switchRect.size.width;
        switchRect.origin.y = (crashReportsview.frame.size.height - switchRect.size.height)/2;
        self.sendCrashReportsSwitch.frame = switchRect;
        self.sendCrashReportsSwitch.on = YES;
        [crittercismSetting setEnabled:self.sendCrashReportsSwitch.on];
        [self.sendCrashReportsSwitch addTarget:crittercismSetting action:crittercismSetting.action forControlEvents:UIControlEventValueChanged];
        
        
        self.sendCrashReportsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, crashReportsFrame.size.width-switchRect.size.width, crashReportsFrame.size.height)];
        self.sendCrashReportsLabel.text = @"Send anonymous crash reports";
        self.sendCrashReportsLabel.font = [UIFont systemFontOfSize:15.0];
        
        [crashReportsview addSubview:self.sendCrashReportsLabel];
        [crashReportsview addSubview:self.sendCrashReportsSwitch];
        
        
        [self addSubview:crashReportsview];
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
