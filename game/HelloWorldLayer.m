//
//  HelloWorldLayer.m
//  game
//
//  Created by yagami mehdi on 04/02/14.
//  Copyright yagami mehdi 2014. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
		      
        
        bgrnd1=[CCSprite spriteWithFile:@"fondecran1.jpg"];
        [bgrnd1 setAnchorPoint:ccp(0,0)];
        [bgrnd1 setPosition:ccp(0,0)];
        [self addChild:bgrnd1];
        
        
        
        
        bgrnd2 = [CCSprite spriteWithFile:@"fondecran2.jpg"];
        [bgrnd2 setAnchorPoint:ccp(0,0)];
        [bgrnd2 setPosition:ccp(0,-480)];
        [self addChild:bgrnd2];
        
       
		// ask director for the window size
		//CGSize size = [[CCDirector sharedDirector] winSize];
       
		// position the label on the center of the screen
        // create and initialize a Label
		/*CCLabelTTF *label = [CCLabelTTF labelWithString:@"Ultradeep" fontName:@"Marker Felt" fontSize:64];
		label.position =  ccp( 0, 0);
        [self addChild:label];
        */
        
        [self schedule:@selector(scrollUp:) interval:0.01];
        [self schedule:@selector(barreUp:) interval:1];
        [self schedule:@selector(stikmanUp:) interval:0.01];
       
	}
	return self;
}

-(void)scrollUp:(ccTime)dt{
    //positionY++;
    
    [bgrnd1 setPosition:ccp(0,bgrnd1.position.y+1)];
   [ bnhm setPosition:ccp(444,bnhm.position.y+1)];
   
    
    [bgrnd2 setPosition:ccp(0,bgrnd2.position.y+1)];
    if(bgrnd2.position.y==0){
        [bgrnd1 setPosition:ccp(0,-480)];
    }
    if(bgrnd1.position.y==0){
        [bgrnd2 setPosition:ccp(0,-480)];
    }
    
    
    
    
    

}
-(void)barreUp:(ccTime)dt{
    
    bar1=[CCSprite spriteWithFile:@"barr.jpg"];
    [bar1 setAnchorPoint:ccp(0,0)];
    [bar1 setPosition:ccp((arc4random()%320),100)];
    [self addChild:bar1];
    
    mvto = [CCMoveTo actionWithDuration:3 position:CGPointMake(bar1.position.x,600)];
    [bar1 runAction:mvto];
    
}

-(void)stikmanUp:(ccTime)dt{
    
    bnhm=[CCSprite spriteWithFile:@"stikman.jpg"];
    [bnhm setAnchorPoint:ccp(0,0)];
    [bnhm setPosition:ccp(500,500)];
    [self addChild:bnhm];
    
    mvto = [CCMoveTo actionWithDuration:1 position:CGPointMake(100,bnhm.position.y)];
    [bnhm runAction:mvto];
    
}




// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
