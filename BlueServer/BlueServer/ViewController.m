//
//  ViewController.m
//  BlueServer
//
//  Created by Son Thai on 11/26/16.
//  Copyright © 2016 Son Thai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController: UIViewController
@property (weak, nonatomic) IBOutlet UIButton *centralMgrBtn;
@property (weak, nonatomic) IBOutlet UIButton *peripheralBtn;

- (IBAction)click:(UIButton*)sender;

@end

@implementation ViewController

- (IBAction) click:(UIButton*) sender {
    if (sender.tag == 0) {
        [self performSegueWithIdentifier:@"centralSegue" sender:nil];
    } else if (sender.tag == 1) {
        [self performSegueWithIdentifier:@"peripheralSegue" sender:nil];
    }
}

@end

