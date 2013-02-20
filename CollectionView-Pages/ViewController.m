//
//  ViewController.m
//  CollectionView-Pages
//
//  Created by Lucian Boboc on 2/20/13.
//  Copyright (c) 2013 Lucian Boboc. All rights reserved.
//

#import "ViewController.h"

#define kDirectionHorizontal 1
#define kCellWidth 300.0
#define kCellHeight 440.0
#define kPadding 10.0

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.collectionView.pagingEnabled = YES;
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    
#if kDirectionHorizontal
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
#else
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"MyCollectionCell" forIndexPath: indexPath];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kCellWidth, kCellHeight);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2 * kPadding;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2 * kPadding;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
#if kDirectionHorizontal
    return UIEdgeInsetsMake(0, kPadding, 0, kPadding); // horizontal scrolling
#else
    return UIEdgeInsetsMake(kPadding, 0, kPadding, 0); // vertical scrolling
#endif
}

@end
