
// 
// <+FILE NAME+>
// 
// Created by <+AUTHOR+> on <+DATE+>
// Copyright (c) <+call:strftime("%Y")+> <+COMPANY+>. All rights reserved.
// 



#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <DervishSoftwareAppKit/DervishSoftwareAppKit.h>


@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (strong) NSWindow* window;
@end


/*
 *
 *
 *================================================================================================*/
#pragma mark - Application Delegate
/*==================================================================================================
 */


@implementation AppDelegate


-(void)applicationDidFinishLaunching:(NSApplication*)app
{
    PDEBUG(@"Starting <+FILE NAME ROOT+>");
    self.window = [ NSWindow dsk_standardWindowOfSize:NSMakeSize(500,300) ];
    [ self.window makeKeyAndOrderFront:self ];

    // Set up application
    <+CURSOR+>
}


-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication*)app/*{{{*/
{
    return YES;
}/*}}}*/
@end


@interface TestApplication : NSApplication/*{{{*/
@end
static AppDelegate* sApplicationDelegate = nil; // strong reference needed -- NSApplication's delegate is weak
@implementation TestApplication
-(void)run {
    self.delegate = sApplicationDelegate;
    NSLog(@"Application delegate = %@", self.delegate);
    [ super run ];
}
@end

int main(int argc, char *argv[]) {
    sApplicationDelegate = [ AppDelegate new ];
    return NSApplicationMain(argc, (const char **)argv);
}/*}}}*/

// vim:foldmethod=marker:foldlevel=0
