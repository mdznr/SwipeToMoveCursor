//
//  MTZSwipeToMoveCursorTextView.m
//  SwipeToMoveCursor
//
//  Created by Matt on 5/4/13.
//  Copyright (c) 2013 Matt Zanchelli. All rights reserved.
//

#import "MTZSwipeToMoveCursorTextView.h"

@interface MTZSwipeToMoveCursorTextView ()

@property (nonatomic)  UISwipeGestureRecognizer *swipeLeft, *swipeLeft2, *swipeRight, *swipeRight2;

@end

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
	_swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeLeft:)];
	[_swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
	[self addGestureRecognizer:_swipeLeft];
	
	_swipeLeft2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeLeft2:)];
	[_swipeLeft2 setNumberOfTouchesRequired:2];
	[_swipeLeft2 setDirection:UISwipeGestureRecognizerDirectionLeft];
	
	_swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeRight:)];
	[_swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
	[self addGestureRecognizer:_swipeRight];
	
	_swipeRight2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeRight2:)];
	[_swipeRight2 setNumberOfTouchesRequired:2];
	[_swipeRight2 setDirection:UISwipeGestureRecognizerDirectionRight];
	
	_shouldMoveTwiceForTwoFingerSwipes = NO;
}

- (void)setShouldMoveTwiceForTwoFingerSwipes:(BOOL)shouldMoveTwiceForTwoFingerSwipes
{
	if ( shouldMoveTwiceForTwoFingerSwipes ) {
		[self addGestureRecognizer:_swipeLeft];
		[self addGestureRecognizer:_swipeRight];
	} else {
		[self removeGestureRecognizer:_swipeLeft2];
		[self removeGestureRecognizer:_swipeRight2];
	}
	
	_shouldMoveTwiceForTwoFingerSwipes = shouldMoveTwiceForTwoFingerSwipes;
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

- (void)didSwipeLeft2:(id)sender
{
	NSRange range = self.selectedRange;
	
	range.location -= 2;
	[self setSelectedRange:range];
}

- (void)didSwipeRight:(id)sender
{
	NSRange range = self.selectedRange;
	
	range.location++;
	[self setSelectedRange:range];
}

- (void)didSwipeRight2:(id)sender
{
	NSRange range = self.selectedRange;
	
	range.location += 2;
	[self setSelectedRange:range];
}

@end
