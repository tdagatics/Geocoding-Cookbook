//
//  ViewController.m
//  Recipe 31 Geocoding
//
//  Created by Anthony Dagati on 11/7/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findAddress:(UIButton *)sender {
}

- (IBAction)findLocation:(UIButton *)sender {
    
    // check to see if the geocoder is initialized, if not, initialize it
    if (self.geocoder == nil)
    {
        self.geocoder = [[CLGeocoder alloc] init];
        
        NSString *address = self.inputText.text;
        [self.geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
            if (placemarks.count > 0)
            {
                CLPlacemark *placemark = [placemarks objectAtIndex:0];
                self.outputLabel.text = placemark.location.description;
            }
            else if (error.domain == kCLErrorDomain)
            {
                switch (error.code) {
                    case kCLErrorDenied:
                        self.outputLabel.text = @"Location Services Denied by User";
                        break;
                    case kCLErrorNetwork:
                        self.outputLabel.text = @"No Network";
                        break;
                    case kCLErrorGeocodeFoundNoResult:
                        self.outputLabel.text = @"No results found.";
                        break;
                        
                    default:
                        self.outputLabel.text = error.localizedDescription;
                        break;
                }
            }

        }];
    }
}


@end
