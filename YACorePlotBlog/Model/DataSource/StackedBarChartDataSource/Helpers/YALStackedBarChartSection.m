//
//  YALStackedBarChartSection.m
//  YACorePlotBlog
//
//  Created by Eugene Goloboyar on 17.10.14.
//  Copyright (c) 2014 Yalantis. All rights reserved.
//

#import "YALStackedBarChartSection.h"

//model
#import "YAExercise.h"
#import "YALStackedBarChartObject.h"

//category
#import "NSDate+YABeginAndAndOfDay.h"

@interface YALStackedBarChartSection ()

@property (nonatomic, copy) NSDate *date;

//array of stackedBarChartObjects in each section
@property (nonatomic, strong) NSArray *objects;

@end

@implementation YALStackedBarChartSection

#pragma mark - Initialization

- (instancetype)initWithDate:(NSDate *)date inContext:(NSManagedObjectContext *)context {
    self = [super init];
    if (self) {
        _date = date;

        //collect all exercises which have sets for date which corresponds to our section
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(SUBQUERY(sets, $x, ($x.doneAt >= %@ AND $x.doneAt < %@)).@count > 0)", [_date ya_beginningOfDay], [_date ya_endOfDay]];
        NSArray *exercises = [YAExercise MR_findAllWithPredicate:predicate inContext:context];
                              
        //turn all collected exercises with sets to stackedBarChartObjects
        _objects = [YALStackedBarChartObject arrayWithDate:_date exercises:exercises];
    }
    return self;
}

#pragma mark - Public

- (NSUInteger)numberOfObjects {
    return [self.objects count];
}

- (YALStackedBarChartObject *)objectAtIndex:(NSInteger)index {
    return self.objects[index];
}

@end
