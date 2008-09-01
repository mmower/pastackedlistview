//
//  PASectionHeaderView.m
//  StackedListView
//
//  Created by Tomas Franzén on 2008-07-17.
//  Copyright 2008 Lighthead Software. All rights reserved.
//

#import "PASectionHeaderView.h"

@implementation PASectionHeaderView

- (void)awakeFromNib {
  NSString *imagePath = [[NSBundle bundleForClass:[PASectionHeaderView class]] pathForImageResource:@"sectionheader.gif"];
  image = [[NSImage alloc] initWithContentsOfFile:imagePath];
}

- (void)drawRect:(NSRect)rect {
  [image drawInRect:[self bounds] fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
}

- (void)mouseUp:(NSEvent*)e {
  [box toggleState:self];
}

@end
