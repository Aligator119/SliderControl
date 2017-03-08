//
//  ViewController.m
//  slider
//
//  Created by Ozzy   on 3/8/17.
//  Copyright © 2017 WallTree. All rights reserved.
//

#import "ViewController.h"
#import "RangeSlider.h"


@interface ViewController ()
{
    RangeSlider *slider;
//    UILabel *reportLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    slider = [[RangeSlider alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 30)]; // the slider enforces a height of 30, although I'm not sure that this is necessary
    
    slider.minimumRangeLength = 0.25; // this property enforces a minimum range size. By default it is set to 0.0
    
    [slider setMinThumbImage:[UIImage imageNamed:@"rangethumb.png"]]; // the two thumb controls are given custom images
    [slider setMaxThumbImage:[UIImage imageNamed:@"rangethumb.png"]];
    
    
    UIImage *image; // there are two track images, one for the range "track", and one for the filled in region of the track between the slider thumbs
    
    [slider setTrackImage:[[UIImage imageNamed:@"fullrange.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(14.0, 9.0, 14.0, 9.0)]];
    
    image = [UIImage imageNamed:@"fillrange.png"];
    [slider setInRangeTrackImage:image];
    
    
    [slider addTarget:self action:@selector(report:) forControlEvents:UIControlEventValueChanged]; // The slider sends actions when the value of the minimum or maximum changes
    
    
//    reportLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 30, 310, 30)]; // a label to see the values of the slider in this demo
//    reportLabel.adjustsFontSizeToFitWidth = YES;
//    reportLabel.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:reportLabel];
//    NSString *report = [NSString stringWithFormat:@"current slider range is %f to %f", slider.min, slider.max];
//    reportLabel.text = report;
    
    [self.view addSubview:slider];
}


- (void)report:(RangeSlider *)sender {
    NSString *report = [NSString stringWithFormat:@"current slider range is %f to %f", sender.min, sender.max];
//    reportLabel.text = report;
    NSLog(@"%@",report);
}


@end
