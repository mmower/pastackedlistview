//
//  PACollapsibleSectionBox.m
//  StackedListView
//
//  Created by Tomas Franzén on 2008-07-17.
//  Copyright 2008 Lighthead Software. All rights reserved.
//

#import "PACollapsibleSectionBox.h"

@implementation PACollapsibleSectionBox

- (IBAction)toggleState:(id)sender {
  if(animation) [animation stopAnimation];
  
  CGFloat collapsedHeight = sectionHeaderView ? [sectionHeaderView frame].size.height : 20;
  NSRect r = [self frame];
  
  if(r.size.height == collapsedHeight) {
    float minY = 0;
    for(NSView *subview in [self subviews])
      minY = MIN(minY, [subview frame].origin.y);
    r.size.height = [self frame].size.height + abs(minY);
    
    [disclosureTriangle setState:NSOnState];
  } else {
    r.size.height = collapsedHeight;
    
    [disclosureTriangle setState:NSOffState];
  }
  
  NSDictionary *aniProps = [NSDictionary dictionaryWithObjectsAndKeys:self, NSViewAnimationTargetKey, [NSValue valueWithRect:r], NSViewAnimationEndFrameKey, nil];
  animation = [[NSViewAnimation alloc] initWithViewAnimations:[NSArray arrayWithObject:aniProps]];
  [animation setDuration:0.17];
  [animation startAnimation];
}

@end
