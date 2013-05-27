//
//  MTZSwipeToMoveCursorTextView.m
//  SwipeToMoveCursor
//
//  Created by Matt on 5/4/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZSwipeToMoveCursorTextView.h"

@implementation MTZSwipeToMoveCursorTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		// Initialization code
		[self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		// Initialization code
		[self setup];
	}
    return self;
}

- (id)init
{
	self = [super init];
	if (self) {
		// Initialization code
		[self setup];
	}
	return self;
}

- (void)setup
{
	UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeLeft:)];
	[swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
	[self addGestureRecognizer:swipeLeft];
	
	UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeRight:)];
	[swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
	[self addGestureRecognizer:swipeRight];
}

- (void)didSwipeLeft:(id)sender
{
	NSRange range = self.selectedRange;
	
	if ( range.length > 0 )
	{
		// increase length
		// snap to word?
		// add or subtract from length?
		// two finger swipe left/right?
	}
	
	range.location--;
	[self setSelectedRange:range];
}

- (void)didSwipeRight:(id)sender
{
	NSRange range = self.selectedRange;
	range.location++;
	[self setSelectedRange:range];
}

@end
