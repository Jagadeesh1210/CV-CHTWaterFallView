//
//  ViewController.h
//  PSTCView
//
//  Created by ios on 02/09/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CCell.h"
#import "CHTCollectionViewWaterfallLayout.h"

@interface ViewController : UIViewController <CHTCollectionViewDelegateWaterfallLayout,UICollectionViewDataSource,UICollectionViewDataSource>
{
     NSMutableArray *data, *data1;
     UIRefreshControl *ref;
}

@property(nonatomic,retain) NSMutableArray *data;
@property(nonatomic,retain) NSMutableArray *data1;
@property (strong, nonatomic) UICollectionView *collectionView;
@property(nonatomic,retain) UIRefreshControl *ref;

@end
