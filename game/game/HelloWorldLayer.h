//
//  HelloWorldLayer.h
//  game
//
//  Created by yagami mehdi on 04/02/14.
//  Copyright yagami mehdi 2014. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    CCSprite * bgrnd1;
    CCSprite * bgrnd2;
    CCSprite * bar1;
    CCSprite * bar2;
    CCSprite * bar3;
    CCSprite * bar4;
    CCSprite * bnhm;
    CCMoveTo * mvto;
   
    int positionY;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

-(void)scrollUp:(ccTime)dt;

@end
