//
//  PACollapsibleSectionBox.h
//  StackedListView
//
//  Created by Tomas Franzén on 2008-07-17.
//  Copyright 2008 Lighthead Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PACollapsibleSectionBox : NSView {
  IBOutlet NSView     *sectionHeaderView;
  IBOutlet NSButton   *disclosureTriangle;
  NSAnimation         *animation;
}

- (IBAction)toggleState:(id)sender;

@end
