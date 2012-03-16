/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiLocalyticsModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "LocalyticsSession.h"

@implementation TiLocalyticsModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"ce4235ea-fd6f-4ebb-89b9-6f800ae6dc95";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.localytics";
}

#pragma mark Lifecycle

-(void)startup
{
	[super startup];
}

-(void)shutdown:(id)sender
{
	[super shutdown:sender];
}

-(void)suspend:(id)sender
{
    [[LocalyticsSession sharedLocalyticsSession] close];
    [[LocalyticsSession sharedLocalyticsSession] upload];
    
	[super suspend:sender];
}

-(void)resume:(id)sender
{
	[[LocalyticsSession sharedLocalyticsSession] resume];
    [[LocalyticsSession sharedLocalyticsSession] upload];
    
	[super resume:sender];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Close Localytics Session
    [[LocalyticsSession sharedLocalyticsSession] close];
    [[LocalyticsSession sharedLocalyticsSession] upload];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma Public APIs

-(void)initialize:(id)apiKey
{
	ENSURE_SINGLE_ARG(apiKey, NSString);
    [[LocalyticsSession sharedLocalyticsSession] startSession:apiKey];
}


-(void)logEvent:(id)args
{
    ENSURE_UI_THREAD(logEvent, args);
	NSString *event = [args objectAtIndex:0];
	NSDictionary *props = nil;
	if ([args count] > 1)
	{
		props = [args objectAtIndex:1];
	}
	if (props == nil)
	{
		[[LocalyticsSession sharedLocalyticsSession] tagEvent:event];
	}
	else 
	{
		[[LocalyticsSession sharedLocalyticsSession] tagEvent:event attributes:props];
	}
}

/*-(void)disable:(id)args
{
    [[LocalyticsSession sharedLocalyticsSession] setOptIn:NO];
}*/

-(BOOL)isLogging:(id)args
{
    return [LocalyticsSession sharedLocalyticsSession].isOptedIn;
}

/*-(void)enable:(id)args
{
    [[LocalyticsSession sharedLocalyticsSession] setOptIn:YES];
}*/

// Turn debugging on or off
// @use     debug(true)
-(void)debug:(id)value
{
    ENSURE_SINGLE_ARG(value,NSObject);
	BOOL yn = [TiUtils boolValue:value];
    if (yn == YES) {
        [LocalyticsSession sharedLocalyticsSession].logOn = YES;
    } else {
        [LocalyticsSession sharedLocalyticsSession].logOn = NO;
    }
}

// Log screen name
// @use     logScreen("splash")
-(void)logView:(id)value
{
    ENSURE_SINGLE_ARG(value, NSString);
    [[LocalyticsSession sharedLocalyticsSession] tagScreen:value];
}



@end
