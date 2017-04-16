//
//  DCGlobal.h
//  DynamicCollection
//
//  Created by DaljeetSingh on 15/04/17.
//  Copyright © 2017 mli. All rights reserved.
//

#ifndef DCGlobal_h
#define DCGlobal_h
#define SECTION_OFFSET 100000
#define SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define SCALE SCREEN_WIDTH/320

#define DA_SERVER_PROD 0

#endif /* DCGlobal_h */
