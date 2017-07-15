//
//  Utility.m
//  PermissionCheck
//
//  Created by wos on 15/07/17.
//  Copyright © 2017 Ravi. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (void)getPermitionOfAccess_Camera:(void (^)(NSString *))successBlock failureBlock:(void (^)(NSString *))failureBlock
{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusAuthorized) {
        successBlock(@"YES");
        // do your logic
    } else if(authStatus == AVAuthorizationStatusDenied) {
        failureBlock(@"NO");
        // denied
    } else if(authStatus == AVAuthorizationStatusRestricted) {
        failureBlock(@"NO");
        // restricted, normally won't happen
    } else if(authStatus == AVAuthorizationStatusNotDetermined) {
        // not determined?!
        [AVCaptureDevice requestAccessForMediaType:mediaType completionHandler:^(BOOL granted) {
            NSString *strmess = @"";
            if(granted) {
                strmess = [NSString stringWithFormat:@"Granted access to %@", mediaType];
                successBlock(@"YES");
            } else {
                strmess = [NSString stringWithFormat:@"Not granted access to %@", mediaType];
                failureBlock(@"NO");
            }
            NSLog(@"%@", strmess);
            //[Function showAlertMessage:strmess autoHide:NO];
        }];
    } else {
        // impossible, unknown authorization status
    }
}

+ (void)getPermitionOfAccess_Gallery:(void (^)(NSString *))successBlock failureBlock:(void (^)(NSString *))failureBlock
{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    
    switch (status) {
        case PHAuthorizationStatusAuthorized: {
            successBlock(@"YES");
            break;
        }
        case PHAuthorizationStatusDenied: {
            failureBlock(@"NO");
            break;
        }
        case PHAuthorizationStatusNotDetermined: {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                NSString *strmess = @"";
                if (status == PHAuthorizationStatusAuthorized) {
                    // Access has been granted.
                    strmess = [NSString stringWithFormat:@"Granted access to Gallery"];
                    successBlock(@"YES");
                }
                else {
                    // Access has been denied.
                    strmess = [NSString stringWithFormat:@"Not granted access to Gallery"];
                    failureBlock(@"NO");
                }
                NSLog(@"%@", strmess);
                //[Function showAlertMessage:strmess autoHide:NO];
            }];
            break;
        }
        case PHAuthorizationStatusRestricted: {
            failureBlock(@"NO");
            break;
        }
        default:
            break;
    }
}

+ (void)getPermitionOfAccess_Audio:(void (^)(NSString *))successBlock failureBlock:(void (^)(NSString *))failureBlock
{
    AVAudioSessionRecordPermission permissionStatus = [[AVAudioSession sharedInstance] recordPermission];
    
    switch (permissionStatus) {
        case AVAudioSessionRecordPermissionUndetermined:{
            [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
                // CALL YOUR METHOD HERE - as this assumes being called only once from user interacting with permission alert!
                if (granted) {
                    successBlock(@"YES");
                    // Microphone enabled code
                }
                else {
                    failureBlock(@"NO");
                    // Microphone disabled code
                }
            }];
            break;
        }
        case AVAudioSessionRecordPermissionDenied:
            // direct to settings...
            failureBlock(@"NO");
            break;
        case AVAudioSessionRecordPermissionGranted:
            // mic access ok...
            successBlock(@"YES");
            break;
        default:
            // this should not happen.. maybe throw an exception.
            break;
    }
}

@end
