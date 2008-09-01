//
//  PAStackedListView.m
//  StackedListView
//
//  Created by Tomas Franzén on 2008-07-16.
//  Copyright 2008 Lighthead Software. All rights reserved.
//

#import "PAStackedListView.h"


@implementation PAStackedListView

- (BOOL)isFlipped {
	return YES;
}

- (void)rearrangeSubviews {
	CGFloat totalHeight = 0;
	for(NSView *subview in [self subviews])
		if(![subview isHidden]) totalHeight += [subview frame].size.height;
	
	NSRect selfRect = [self frame];
	selfRect.size.height = totalHeight;
	[self setFrame:selfRect];
	
	
	NSPoint point = NSMakePoint(0,0);
	
	for(NSView *subview in [[self subviews] reverseObjectEnumerator]) {
		if([subview isHidden]) continue;
		NSRect newRect = {point,[subview frame].size};
		[subview setFrame:newRect];
		point.y += newRect.size.height;
	}
}

- (void)addStackingView:(NSView *)view {
  [self addSubview:view positioned:NSWindowBelow relativeTo:nil];
  [self rearrangeSubviews];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(subviewChanged:) name:NSViewFrameDidChangeNotification object:view];
}

- (void)awakeFromNib {
	[self rearrangeSubviews];
	for(NSView *subview in [self subviews]) {
		if([subview isHidden]) continue;
		[subview setPostsFrameChangedNotifications:YES];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(subviewChanged:) name:NSViewFrameDidChangeNotification object:subview];
		[subview setFrameSize:NSMakeSize([self bounds].size.width,[subview frame].size.height)];
	}
}


- (void)subviewChanged:(NSNotification*)notification {
	[self rearrangeSubviews];
}


@end
