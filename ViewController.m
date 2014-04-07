//
//  ViewController.m
//  PSTCView
//
//  Created by ios on 02/09/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import "ViewController.h"
#import "SVPullToRefresh.h"
#import "CCell.h"
//#import "CHTCollectionViewWaterfallLayout.h"


@interface ViewController ()

@end

@implementation ViewController
static NSString *cellIdentifier = @"CCell";
@synthesize collectionView,data1;
@synthesize data,ref;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)loadView {
	[super loadView];
	#pragma mark LoadView
	self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
	       
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.delegate = self;
    
    collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 320, CGRectGetHeight(self.view.bounds)) collectionViewLayout:layout];
    collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    layout.columnCount = 2;
	layout.itemWidth = 150;
	[collectionView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin];
	[collectionView setBackgroundColor:[UIColor clearColor]];
    [collectionView registerClass:[CCell class] forCellWithReuseIdentifier:cellIdentifier];

	[self.view addSubview:collectionView];
                }

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self updateLayout];
}
- (void)updateLayout {
	CHTCollectionViewWaterfallLayout *layout =
    (CHTCollectionViewWaterfallLayout *)self.collectionView.collectionViewLayout;
	layout.columnCount = 2;
	layout.itemWidth = 150;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration {
	[super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation
	                                        duration:duration];
	[self updateLayout];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
 
   data=[[NSMutableArray alloc] initWithObjects:@"GoogleEarth", @"BlurredLines", @"DogLession",@"Quotes",@"Food&Fitness",@"Books",@"DogJokes", @"Adele", @"Chemicals",@"Quotes",@"GoogleEarth",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"HaiFriends How areu",@"Hurrey I am going to Newyork",@"GoodNight",@"Have a Nice Day . See you soon",@"In dancing mood...!!! Have a nice day friends Keep rocking ....!!!! :) :) :)", nil] ;
    data1=[[NSMutableArray alloc] initWithObjects:@"1.jpg", @"2.jpg", @"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"7.jpg", @"8.jpg", @"9.jpg",@"10.jpg",@"1.jpg",@"11.jpg", @"12.jpg", @"13.jpg",@"14.jpg",@"15.jpg",@"16.jpg",@"17.jpg", @"18.jpg", @"19.jpg",@"20.jpg",@"21.jpg", @"22.jpg", @"23.jpg",@"24.jpg",@"25.jpg",@"26.jpg",@"26.jpg",@"26.jpg",@"26.jpg",@"26.jpg",@"26.jpg", nil];
    
  /*
    data = @[
             @[@"GoogleEarth", @"BlurredLines", @"DogLession",@"Quotes",@"Food&Fitness",@"Books",@"DogJokes", @"Adele", @"Chemicals",@"Quotes",@"GoogleEarth",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"GamingBooks",@"HaiFriends How areu",@"Hurrey I am going to Newyork",@"GoodNight",@"Have a Nice Day . See you soon",@"In dancing mood...!!! Have a nice day friends Keep rocking ....!!!! :) :) :)"]

             ];
    data1=@[
            @[@"1.jpg", @"2.jpg", @"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"7.jpg", @"8.jpg", @"9.jpg",@"10.jpg",@"1.jpg",@"11.jpg", @"12.jpg", @"13.jpg",@"14.jpg",@"15.jpg",@"16.jpg",@"17.jpg", @"18.jpg", @"19.jpg",@"20.jpg",@"21.jpg", @"22.jpg", @"23.jpg",@"24.jpg",@"25.jpg",@"26.jpg",@"26.jpg",@"26.jpg",@"26.jpg",@"26.jpg",@"26.jpg"]

            ];
   */
    
    __weak ViewController *weakSelf = self;
    
    // setup pull-to-refresh
    [self.collectionView addPullToRefreshWithActionHandler:^{
        [weakSelf insertRowAtTop];
    }];
   /*
    UIRefreshControl *refreshControl = [UIRefreshControl.alloc init];
    refreshControl.attributedTitle   = [NSAttributedString.alloc initWithString:@"Refreshing..."];
    [refreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
    //self.refreshControl = refreshControl;
    self.collectionView.=refreshControl;
    // setup infinite scrolling
    */
    [self.collectionView addInfiniteScrollingWithActionHandler:^{
        [weakSelf insertRowAtBottom];
    }];

}

- (void)reloadData
{

}
- (void)insertRowAtTop {
    NSLog(@"Row at Top");

    __weak ViewController *weakSelf = self;
    
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [data insertObject:@"TestCell" atIndex:0];
        [data1 insertObject:@"17.jpg" atIndex:0];

       // [self.collectionView reloadData];
        [weakSelf.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] ];
        [weakSelf.collectionView.pullToRefreshView stopAnimating];

    });
     
}


- (void)insertRowAtBottom {
    NSLog(@"Row at Bottom");
    __weak ViewController *weakSelf = self;
    
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [data addObject:@"TestCell" ];
        [data1 addObject:@"10.jpg"];
        //[self.collectionView reloadData];
        [weakSelf.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:data.count-1 inSection:0]] ];
        [weakSelf.collectionView.infiniteScrollingView stopAnimating];

    });
     

}

-(void)newControllerDelegateSelected:(NSMutableArray *)arry
{
    NSLog(@"this method is calleds");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark PSUICollectionView stuff

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    //return [data count];
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    NSLog(@"Count::%i",[data count]);
    return [data count];
    
    //return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //  NSString *searchTerm = [[data1 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    UIImage *image = [ UIImage imageNamed:[data1  objectAtIndex:indexPath.row]] ;
    //NSLog(@"In Cell for row at Index %@",[[data1 objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]);
    // NSLog(@"Name Of the Image %@ and Width %f Height %f",searchTerm,image.size.width, image.size.height);
    
    CGSize retval;
    
    if( image.size.width >100 && image.size.width < 300)
    {
        retval.height = 100; retval.width = 150;
    } else if( image.size.width >300 && image.size.width < 500)
    {
        retval.height = 190; retval.width = 150;
    }
    else if( image.size.width >500 && image.size.width < 700)
    {
        retval.height = 110; retval.width = 150;
    }
    else if( image.size.width >700)
    {
        retval.height = 350; retval.width = 150;
    }
    else {  retval.height = 300; retval.width = 150;  }
    

    
    CCell *cell = (CCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    //NSLog(@"Cell:: %@",cell);
    
    
   // if([[[data objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] isEqualToString:@"Quotes"] )
        if(indexPath.row > 25)
    {
        NSString *txt1=[data objectAtIndex:indexPath.row];
        CGSize stringsize1 = [txt1 sizeWithFont:[UIFont systemFontOfSize:12]];
        retval.height=(stringsize1.width/30)*12;
        if(retval.height < 12) {  retval.height=12; }
        //NSLog(@"No Image");
        cell.iv.image=image;
        [cell.iv setFrame:CGRectMake(0, 0, 0,0)];
        //cell.iv.layer.borderColor = [UIColor whiteColor].CGColor;
        //cell.iv.layer.borderWidth = 1.0f;
        
        [cell.label setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
        //[label setTag:123];
        [cell.label setBackgroundColor:[UIColor clearColor]];
        [cell.label setTextAlignment:NSTextAlignmentCenter];
        
        //[label setFrame:CGRectMake(x,y,stringsize1.width,hieght)];
        //[label setText:txt1];
        //[cell.label sizeToFit];
       // [cell.label setNumberOfLines:(NSInteger)(stringsize1.width/(retval.width-20))];
        cell.label.numberOfLines=0;
        cell.label.text  =txt1;
        cell.label.layer.borderColor = [UIColor whiteColor].CGColor;
        cell.label.layer.borderWidth = 1.0f;
        cell.label.textColor=[UIColor yellowColor];
        //cell.label.font=[UIFont systemFontOfSize:12];
        [cell.label setFrame:CGRectMake(10,10,retval.width-20,retval.height)];
        
       // NSLog(@"Width:%f Height:%f Required HeightOfTheLabel %i",stringsize1.width,stringsize1.height,(NSInteger)(stringsize1.width/30)*12);
        
        [cell.label2 setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
        [cell.label2 setTag:2];
        [cell.label2 setBackgroundColor:[UIColor clearColor]];
        [cell.label2 setTextAlignment:NSTextAlignmentLeft];
        cell.label2.font=[UIFont systemFontOfSize:13];
        
        cell.label2.text  = @"  Title Description!!!";
        cell.label2.textColor=[UIColor whiteColor];
        [cell.label2 setFrame:CGRectMake(0,retval.height+15,retval.width,15)];
        
        [cell.label3 setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
        [cell.label3 setTag:3];
        [cell.label3 setBackgroundColor:[UIColor clearColor]];
        [cell.label3 setTextAlignment:NSTextAlignmentLeft];
        cell.label3.font=[UIFont systemFontOfSize:12];
        cell.label3.text  = @"  Like | comment | report";
        cell.label3.textColor=[UIColor blueColor];
        [cell.label3 setFrame:CGRectMake(0,retval.height+30,retval.width,15)];
        
        [cell.btn setTitle:@"Share" forState:UIControlStateNormal];
        [cell.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cell.btn setBackgroundColor:[UIColor whiteColor]];
        [cell.btn setTag:4];
        [cell.btn addTarget:cell action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        cell.btn.layer.borderColor = [UIColor grayColor].CGColor;
        cell.btn.layer.borderWidth = 2.0f;
        [cell.btn setFrame:CGRectMake(0+4,retval.height+45,retval.width-8,20)];

      }
    else{

        //NSLog(@"In Image");
    cell.iv.image=image;
    [cell.iv setFrame:CGRectMake(10, 10, retval.width-20,retval.height-20)];
    cell.iv.layer.borderColor = [UIColor whiteColor].CGColor;
    cell.iv.layer.borderWidth = 1.0f;
        
    [cell.label setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
    //[label setTag:123];
    [cell.label setBackgroundColor:[UIColor clearColor]];
    [cell.label setTextAlignment:NSTextAlignmentCenter];
    cell.label.text  = [data  objectAtIndex:indexPath.row];
    cell.label.textColor=[UIColor blackColor];
    cell.label.font=[UIFont systemFontOfSize:15];
    cell.label.layer.borderWidth = 0.0f;
    [cell.label setFrame:CGRectMake(0,retval.height,retval.width,15)];
        
        [cell.label2 setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
        [cell.label2 setTag:2];
        [cell.label2 setBackgroundColor:[UIColor clearColor]];
        [cell.label2 setTextAlignment:NSTextAlignmentLeft];
        cell.label2.font=[UIFont systemFontOfSize:13];
        
        cell.label2.text  = @"  Title Description!!!";
        cell.label2.textColor=[UIColor whiteColor];
        [cell.label2 setFrame:CGRectMake(0,retval.height+15,retval.width,15)];
        
        [cell.label3 setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
        [cell.label3 setTag:3];
        [cell.label3 setBackgroundColor:[UIColor clearColor]];
        [cell.label3 setTextAlignment:NSTextAlignmentLeft];
        cell.label3.font=[UIFont systemFontOfSize:12];
        cell.label3.text  = @"  Like | comment | report";
        cell.label3.textColor=[UIColor blueColor];
        [cell.label3 setFrame:CGRectMake(0,retval.height+30,retval.width,15)];
        
        [cell.btn setTitle:@"Share" forState:UIControlStateNormal];
        [cell.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cell.btn setBackgroundColor:[UIColor whiteColor]];
        [cell.btn setTag:4];
        [cell.btn addTarget:cell action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        cell.btn.layer.borderColor = [UIColor grayColor].CGColor;
        cell.btn.layer.borderWidth = 2.0f;
        [cell.btn setFrame:CGRectMake(0+4,retval.height+45,retval.width-8,20)];
    }

    
    cell.layer.borderColor = [UIColor whiteColor].CGColor;
    cell.layer.borderWidth = 4.0f;
    
    CGFloat xx=cell.frame.origin.x;
    CGFloat yy=cell.frame.origin.y;
    CGRect frame = cell.frame;
    frame.origin.x = -180; // new x coordinate
    frame.origin.y = 0; // new y coordinate
    cell.frame = frame;
    
    
    [UIView animateWithDuration:1.0 animations:^{
        
        CGRect frame = cell.frame;
        frame.origin.x = xx; // new x coordinate
        frame.origin.y = yy; // new y coordinate
        cell.frame = frame;
        // cell.entityImageEffect.alpha = 1;
    }];
    
    return cell;
}

-(void)clicked:(UIButton *)sender
{
    
    NSLog(@"Test Case %d",sender.tag);
}

//Delegate Method


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"WorldNews" message:[data objectAtIndex:indexPath.row] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Display the Hello World Message
   [messageAlert show]; 
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"InDidHighLight");
}
#pragma mark - UICollectionViewWaterfallLayoutDelegate
- (CGFloat) collectionView:(UICollectionView *)collectionView
                      layout:(CHTCollectionViewWaterfallLayout *)collectionViewLayout
    heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIImage *image = [ UIImage imageNamed:[data1 objectAtIndex:indexPath.row] ];
   // NSLog(@"Name Of the Image %@ and Width %f Height %f",searchTerm,image.size.width, image.size.height);
   // NSString *str=[[data objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    CGSize retval;
    
    if( image.size.width >100 && image.size.width < 300)
    {
        retval.height = 100; retval.width = 150;
    } else if( image.size.width >300 && image.size.width < 500)
    {
        retval.height = 190; retval.width = 150;
    }
    else if( image.size.width >500 && image.size.width < 700)
    {
        retval.height = 110; retval.width = 150;
    }
    else if( image.size.width >700)
    {
        retval.height = 350; retval.width = 150;
    }
    else {  retval.height = 300; retval.width = 150;  }
    retval.height=retval.height+45+20+5;

    if(indexPath.row > 25)
    {
        NSString *txt1=[data  objectAtIndex:indexPath.row];
        CGSize stringsize1 = [txt1 sizeWithFont:[UIFont systemFontOfSize:12]];
        if((stringsize1.width/30)*12 < 12) {  retval.height=12+45+20+5; }
        else
        retval.height=(stringsize1.width/30)*12+45+20+5;
    }
	return retval.height;
}


@end
