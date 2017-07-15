# PermissionCheck
Permits the user request for permission access the operating system's (Camera, Gallery and Microphone), with the objective-c block support.

# Gallery Permission
```
    [Utility getPermitionOfAccess_Gallery:^(NSString *strSuccess) {
        NSLog(@"Permission Access.");
    } failureBlock:^(NSString *strFailure) {
        NSLog(@"Permission Denied.");
    }];
```

# Camera Permission
```
    [Utility getPermitionOfAccess_Camera:^(NSString *strSuccess) {
        NSLog(@"Permission Access.");
    } failureBlock:^(NSString *strFailure) {
        NSLog(@"Permission Denied.");
    }];
```

# Audio Permission
```
    [Utility getPermitionOfAccess_Audio:^(NSString *strSuccess) {
        NSLog(@"Permission Access.");
    } failureBlock:^(NSString *strFailure) {
        NSLog(@"Permission Denied.");
    }];
```
