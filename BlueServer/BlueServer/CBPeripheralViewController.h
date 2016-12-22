//
//  CBPeripheralViewController.h
//  BlueServer
//
//  Created by Son Thai on 11/26/16.
//  Copyright © 2016 Son Thai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface CBPeripheralViewController : UIViewController<CBPeripheralManagerDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *sendDataText;
@property (strong, nonatomic) CBPeripheralManager *peripheralManager;
@property (strong, nonatomic) CBMutableCharacteristic *transferCharacteristic;
@property (strong, nonatomic) NSData *dataToSend;
@property (nonatomic, readwrite) NSInteger sendDataIndex;
@property (nonatomic, readwrite) NSInteger isBroadCast;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *broadcastBtn;
- (IBAction)clickBtn:(UIButton*)sender;


@end
