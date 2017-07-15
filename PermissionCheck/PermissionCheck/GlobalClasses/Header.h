//
//  Header.h
//  PermissionCheck
//
//  Created by wos on 15/07/17.
//  Copyright © 2017 Ravi. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define APP_NAME                                            @"PermissionCheck"

#define MESS_EnableAccess_Camera_Title                      [NSString stringWithFormat:@"Allow '%@' access to your camera",APP_NAME]
#define MESS_EnableAccess_Camera                            [NSString stringWithFormat:@"'%@' does not have access to your camera.\nYou can enable access to change the Privacy Settings for tap setting and enable access to your camera.",APP_NAME]

#define MESS_EnableAccess_Gallery_Title                     [NSString stringWithFormat:@"Allow '%@' access to your gallery",APP_NAME]
#define MESS_EnableAccess_Gallery                           [NSString stringWithFormat:@"'%@' does not have access to your gallery.\nYou can enable access to change the Privacy Settings for tap setting and enable access to your gallery.",APP_NAME]

#define MESS_EnableAccess_MICROPHONE_Title                  [NSString stringWithFormat:@"Allow '%@' access to your gallery",APP_NAME]
#define MESS_EnableAccess_MICROPHONE                        [NSString stringWithFormat:@"'%@' does not have access to your gallery.\nYou can enable access to change the Privacy Settings for tap setting and enable access to your microphone.",APP_NAME]

#endif /* Header_h */
