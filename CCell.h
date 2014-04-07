//
//  CCell.h
//  PSTCView
//
//  Created by ios on 27/09/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol cellButtonTappedProtocal <NSObject>

-(void)buttonTapped:(id)sender;

@end


@interface CCell : UICollectionViewCell


@property(nonatomic,retain) UILabel *label;
@property(nonatomic,retain) UILabel *label2;
@property(nonatomic,retain) UILabel *label3;
@property(nonatomic,retain) UIImageView *iv;
@property(nonatomic,retain) IBOutlet UIButton *btn;
@property (nonatomic ,retain) id <cellButtonTappedProtocal> _delegate;

-(void)buttonPressed:(id)sender;

@end
