//
//  RNZoomableImageViewManager.m
//  RNReactNativeZoomableImage
//
//  Created by Dmytro Portenko on 6/17/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RNZoomableImageViewManager.h"
#import "RNZoomableImageView.h"
#import <UIKit/UIKit.h>
#import <React/RCTConvert.h>

@implementation RNZoomableImageViewManager

RCT_EXPORT_MODULE(RNZoomableImage)

- (UIView *)view
{
    return [[RNZoomableImageView alloc] init];
}

RCT_CUSTOM_VIEW_PROPERTY(source, UIImage, RNZoomableImageView)
{
    [view setImage:json ? [RCTConvert UIImage:json] : NULL];
}


@end
