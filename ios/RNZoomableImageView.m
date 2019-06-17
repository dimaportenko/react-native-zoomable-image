//
//  RNZoomableImageView.m
//  RNReactNativeZoomableImage
//
//  Created by Dmytro Portenko on 6/17/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RNZoomableImageView.h"
#import <React/RCTConvert.h>

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
//        [_scrollView setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:1 alpha:0.5]];
        _scrollView.minimumZoomScale = 1;
        _scrollView.maximumZoomScale = 5;

        _scrollView.delegate = self;
        [self addSubview:_scrollView];
    }
    
    return self;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    _imageSize = _image.size;
    _imageView = [[UIImageView alloc] initWithImage:_image];

    [_scrollView addSubview:_imageView];
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    // return which subview we want to zoom
    return _imageView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGSize size = CGSizeMake(self.bounds.size.width, _imageSize.height / (_imageSize.width / self.bounds.size.width));
    [_scrollView setFrame:self.bounds];
    [_imageView setFrame:CGRectMake(0, 0, size.width, size.height)];
    _scrollView.zoomScale = 1;
}

@end
