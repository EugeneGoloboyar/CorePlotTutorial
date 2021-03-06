//
//  YALBarChartProtocol.h
//  CorePlotBlog
//
//  Created by Eugene Goloboyar on 13.10.14.
//  Copyright (c) 2014 Yalantis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YABarChartProtocol <NSObject>

@required
- (UIColor *)barColor;
- (NSNumber *)barValue;
- (NSString *)barName;
- (NSString *)barLegendString;

@end
