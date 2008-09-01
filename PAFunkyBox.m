//
//  PAFunkyBox.m
//  StackedListView
//
//  Created by Tomas Franzén on 2008-07-16.
//  Copyright 2008 Lighthead Software. All rights reserved.
//

#import "PAFunkyBox.h"


@implementation PAFunkyBox

- (IBAction)toggleSize:(id)sender {
	if(animation) [animation stopAnimation];
	
	NSRect r = [self frame];
	if(r.size.height == 20) {
		
		float minY = 0;
		for(NSView *subview in [[self contentView] subviews])
			minY = MIN(minY, [subview frame].origin.y);

		r.size.height = [self frame].size.height + abs(minY);
	}else{
		r.size.height = 20;
	}
	
	NSDictionary *aniProps = [NSDictionary dictionaryWithObjectsAndKeys:self, NSViewAnimationTargetKey, [NSValue valueWithRect:r], NSViewAnimationEndFrameKey, nil];
	animation = [[NSViewAnimation alloc] initWithViewAnimations:[NSArray arrayWithObject:aniProps]];
	[animation setDuration:0.17];
	[animation startAnimation];
}

@end
