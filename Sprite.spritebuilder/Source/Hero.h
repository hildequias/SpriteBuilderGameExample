//
//  Hero.h
//  Sprite
//
//  Created by Hildequias Junior on 5/26/17.
//  Copyright © 2017 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Hero : CCSprite {
    
    CGSize winSize;
}

- (id) initWithFileName:(NSString *) filename;

@end
