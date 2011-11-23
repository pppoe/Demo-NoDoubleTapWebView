//
//  NoDoubleTapWebView.m
//  NoDoubleTapWebView
//
//  Created by Haoxiang Li on 11/23/11.
//  Copyright (c) 2011 DEV. All rights reserved.
//

#import "NoDoubleTapWebView.h"

@implementation NoDoubleTapWebView

- (void)goThroughSubViewFrom:(UIView *)view {
    for (UIView *v in [view subviews])
    {
        if (v != view)
        {
            [self goThroughSubViewFrom:v];
        }
    }
    for (UIGestureRecognizer *reco in [view gestureRecognizers])
    {
        if ([reco isKindOfClass:[UITapGestureRecognizer class]])
        {
            if ([(UITapGestureRecognizer *)reco numberOfTapsRequired] == 2)
            {
                [view removeGestureRecognizer:reco];
            }
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    static BOOL doubleTapRemoved = NO;
    if (!doubleTapRemoved)
    {
        [self goThroughSubViewFrom:self];
    }
}

@end
