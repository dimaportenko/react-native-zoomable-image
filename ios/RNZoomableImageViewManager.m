//
//  RNZoomableImageViewManager.m
//  RNReactNativeZoomableImage
//
//  Created by Dmytro Portenko on 6/17/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RNZoomableImageViewManager.h"
#import <UIKit/UIKit.h>
#import "RNZoomableImageView.h"

@implementation RNZoomableImageViewManager

RCT_EXPORT_MODULE(RNZoomableImage)

- (UIView *)view
{
    return [[RNZoomableImageView alloc] init];
}


@end
