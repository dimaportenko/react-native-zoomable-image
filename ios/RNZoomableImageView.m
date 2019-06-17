//
//  RNZoomableImageView.m
//  RNReactNativeZoomableImage
//
//  Created by Dmytro Portenko on 6/17/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RNZoomableImageView.h"

@implementation RNZoomableImageView
{
    UIScrollView *_scrollView;
    UIImageView *_imageView;
    UIImage *_image;
    CGSize _imageSize;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        [_scrollView setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
        
        _scrollView.minimumZoomScale = 1;
        _scrollView.maximumZoomScale = 5;
        _scrollView.zoomScale = 1;
        _image = [UIImage imageNamed:@"map.jpg"];
        _imageSize = _image.size;
        _imageView = [[UIImageView alloc] initWithImage:_image];
//        [_imageView setContentMode:UIViewContentModeScaleAspectFit];
        
//        _scrollView.contentSize = _imageView.frame.size;
        [_scrollView addSubview:_imageView];
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        
    }
    
    return self;
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    // return which subview we want to zoom
    return _imageView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_scrollView setFrame:self.bounds];
//    [_scrollView setContentMode:UIViewContentModeScaleAspectFill];
//
    
    
    CGSize size = CGSizeMake(self.bounds.size.width, _imageSize.height / (_imageSize.width / self.bounds.size.width));
//    [_scrollView setContentSize:self.bounds.size];
    [_imageView setFrame:CGRectMake(0, 0, size.width, size.height)];
//    [_imageView sizeToFit];
}

@end
