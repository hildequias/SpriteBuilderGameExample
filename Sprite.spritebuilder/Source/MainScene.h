#import "Hero.h"
#import "ParallaxSprite.h"

@interface MainScene : CCNode {

    CGSize winSize;
    Hero *hero;
    ParallaxSprite *pSprite;
}

+ (CCScene *) scene;

@end
