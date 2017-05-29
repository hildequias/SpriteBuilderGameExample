//
//  ParallaxSprite.h
//  Sprite
//
//  Created by Hildequias Junior on 5/29/17.
//  Copyright © 2017 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface ParallaxSprite : CCSprite {
    CGSize _winSize;
    CGPoint _center;
    CCSprite *_sprite1, *_sprite2;
    float _speed;
}

-(id) initWithFileName:(NSString *) fileName speed:(float) speed;
-(void) update:(CCTime) delta;

@end
