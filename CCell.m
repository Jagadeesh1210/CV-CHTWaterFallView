//
//  CCell.m
//  PSTCView
//
//  Created by ios on 27/09/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import "CCell.h"
#import "ViewController.h"

@implementation CCell

@synthesize label,label2,label3,iv,btn;
@synthesize _delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
	if (self) {
		[self setBackgroundColor:[UIColor grayColor]];
        iv = [[UIImageView alloc] init];
        [self addSubview:iv];
        label = [[UILabel alloc] init];
        [self addSubview:label];
        label2 = [[UILabel alloc] init];
        [self addSubview:label2];
        label3 = [[UILabel alloc] init];
        [self addSubview:label3];
        btn=[[UIButton alloc] init];
        [self addSubview:btn];
        
	}
	return self;
}

-(void)buttonPressed:(id)sender
{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Share-Link" message:self.label.text delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
    [_delegate buttonTapped:sender];    
}



@end
