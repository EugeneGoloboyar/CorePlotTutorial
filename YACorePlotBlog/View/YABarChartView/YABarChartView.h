//
//  YABartChartView.h
//  CorePlotBlog
//
//  Created by Евгений on 13.10.14.
//  Copyright (c) 2014 Yalantis. All rights reserved.
//

#import <CorePlot/CorePlot-CocoaTouch.h>

#import "YABarChartProtocol.h"

@class YABarChartView;

//protocol for our public datasource
@protocol YABarChartViewDataSource <NSObject>

- (NSInteger)numberOfChartsInBarChartView:(YABarChartView *)barChartView;
- (id <YABarChartProtocol>)barChartView:(YABarChartView *)barChartView plotAtIndex:(NSInteger)index;

@end

@interface YABarChartView : CPTGraphHostingView

//our public dataSource
@property (nonatomic, weak) IBOutlet id <YABarChartViewDataSource> dataSource;

- (void)reloadData;

@end
