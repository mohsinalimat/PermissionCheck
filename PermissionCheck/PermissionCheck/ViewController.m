//
//  ViewController.m
//  PermissionCheck
//
//  Created by wos on 15/07/17.
//  Copyright © 2017 Ravi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Utility getPermitionOfAccess_Camera:^(NSString *strSuccess) {
        NSLog(@"Permission Access.");
    } failureBlock:^(NSString *strFailure) {
        NSLog(@"Permission Denied.");
    }];
    
    [Utility getPermitionOfAccess_Gallery:^(NSString *strSuccess) {
        NSLog(@"Permission Access.");
    } failureBlock:^(NSString *strFailure) {
        NSLog(@"Permission Denied.");
    }];
    
    [Utility getPermitionOfAccess_Audio:^(NSString *strSuccess) {
        NSLog(@"Permission Access.");
    } failureBlock:^(NSString *strFailure) {
        NSLog(@"Permission Denied.");
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnGallery:(id)sender {
    [Utility getPermitionOfAccess_Gallery:^(NSString *strSuccess) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Gallery"
                                                                                  message:@"Permission accessed..."
                                                                           preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:ok];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    } failureBlock:^(NSString *strFailure) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:MESS_EnableAccess_Gallery_Title
                                                                                  message:MESS_EnableAccess_Gallery
                                                                           preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAction];
        
        UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                                         {
                                             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                                         }];
        [alertController addAction:settingsAction];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    }];
}
- (IBAction)btnCamera:(id)sender {
    [Utility getPermitionOfAccess_Camera:^(NSString *strSuccess) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Camera"
                                                                                  message:@"Permission accessed..."
                                                                           preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:ok];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    } failureBlock:^(NSString *strFailure) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:MESS_EnableAccess_Camera_Title
                                                                                  message:MESS_EnableAccess_Camera
                                                                           preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }];
        
        [alertController addAction:cancelAction];
        [alertController addAction:settingsAction];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    }];
}
- (IBAction)btnMicrophone:(id)sender {
    [Utility getPermitionOfAccess_Audio:^(NSString *strSuccess) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Microphone"
                                                                                  message:@"Permission accessed..."
                                                                           preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:ok];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    } failureBlock:^(NSString *strFailure) {
        NSLog(@"Permission Denied.");
        UIAlertController *alert =[UIAlertController alertControllerWithTitle:MESS_EnableAccess_MICROPHONE_Title message:MESS_EnableAccess_MICROPHONE preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancelAction];
        
        UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }];
        [alert addAction:settingsAction];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
