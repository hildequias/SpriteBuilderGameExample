//
//  Hero.m
//  Sprite
//
//  Created by Hildequias Junior on 5/26/17.
//  Copyright © 2017 Apportable. All rights reserved.
//

#import "Hero.h"

@implementation Hero

- (id) initWithFileName:(NSString *) filename {
    
    if(self == [self initWithImageNamed:filename]) {
        
        NSMutableArray *animFramesArray = [NSMutableArray array];
        
        for(int i=1; i<4; i++) {
            
            [animFramesArray addObject: [CCSpriteFrame frameWithImageNamed: [NSString stringWithFormat:@"hero%d.png",i ]]];
        }
        
        CCAnimation* animation = [CCAnimation animationWithSpriteFrames:animFramesArray delay:0.3];
        CCActionInterval *animate= [CCActionAnimate actionWithAnimation:animation];
        CCAction* repeateAnimation = [CCActionRepeatForever actionWithAction:animate];
        
        [self runAction:repeateAnimation];
    }
    
    return self;
}

@end
