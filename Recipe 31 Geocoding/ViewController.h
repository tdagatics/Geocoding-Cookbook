//
//  ViewController.h
//  Recipe 31 Geocoding
//
//  Created by Anthony Dagati on 11/7/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (strong, nonatomic) CLGeocoder *geocoder;
@property (strong, nonatomic) CLLocationManager *locationManager;

- (IBAction)findAddress:(UIButton *)sender;
- (IBAction)findLocation:(UIButton *)sender;

@end

