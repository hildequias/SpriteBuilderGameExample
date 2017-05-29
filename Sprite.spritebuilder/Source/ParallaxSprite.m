//
//  ParallaxSprite.m
//  Sprite
//
//  Created by Hildequias Junior on 5/29/17.
//  Copyright © 2017 Apportable. All rights reserved.
//

#import "ParallaxSprite.h"

@implementation ParallaxSprite

-(id) initWithFileName:(NSString *) fileName speed:(float) speed {
    
    if(self = [super init]) {
        
        NSLog(@"[parallaxSprite] (init) ");
        
        _winSize = [[CCDirector sharedDirector] viewSize];
        _center = CGPointMake(_winSize.width/2, _winSize.height/2);
        _speed = speed;
        
        _sprite1 = [CCSprite spriteWithImageNamed:fileName];
        _sprite1.position = _center;
        [self addChild:_sprite1];
        
        _sprite2 = [CCSprite spriteWithImageNamed:fileName];
        _sprite2.position = CGPointMake(_sprite1.position.x + _winSize.width, _center.y);
        [self addChild:_sprite2];
    }
    
    return self;
}

-(void) update:(CCTime) delta {
    
    float xPos1 = _sprite1.position.x - _speed;
    float xPos2 = _sprite2.position.x - _speed;
    
    _sprite1.position = CGPointMake(xPos1, _sprite1.position.y);
    _sprite2.position = CGPointMake(xPos2, _sprite1.position.y);
    
    if(xPos1 + _winSize.width/2 <= 0) {
        
        _sprite1.position = CGPointMake(_sprite2.position.x + _winSize.width, _center.y);
        
    }else if(xPos2 + _winSize.width/2 <= 0) {
        
        _sprite2.position = CGPointMake(_sprite1.position.x + _winSize.width, _center.y);
    }
}

@end
