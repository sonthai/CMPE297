//
//  ViewController.h
//  BlueServer
//
//  Created by Son Thai on 11/26/16.
//  Copyright © 2016 Son Thai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface CBCentralManagerViewController : UIViewController<CBCentralManagerDelegate, CBPeripheralDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *centralTxtView;
@property (strong, nonatomic) CBCentralManager *centralManager;
@property (strong, nonatomic) CBPeripheral *discoveredPeripheral;
@property (strong, nonatomic) NSMutableData *data;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
- (IBAction)backBtn:(UIButton*)sender;
@end

