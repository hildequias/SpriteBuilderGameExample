#import "MainScene.h"

@implementation MainScene

+ (CCScene *) scene {
    return [[self alloc] init];
}

-(id)init {
    
    if(self = [super init]){
        
        winSize = [[CCDirector sharedDirector] viewSize];
        
        CGPoint center = CGPointMake(winSize.width/2,
                                     winSize.height/2);
        
        //Background
        CCNode* backgroundColorNode = [CCNodeColor nodeWithColor:[CCColor
                                                      colorWithRed:0.0f
                                                      green:1.0
                                                      blue:0.0]];
        
        [self addChild:backgroundColorNode];
        
        // Parallax background sprite - ADD
        pSprite = [[ParallaxSprite alloc] initWithFileName:@"Bg.png" speed:5];
        [self addChild:pSprite];
        
        hero = [[Hero alloc]initWithFileName:@"hero.png"];
        [hero setScale:.2];
        hero.position = CGPointMake(center.x - winSize.width/4, winSize.height/2);
        [self addChild:hero];
        
        CGPoint initPos = hero.position;
        CGPoint finalPos = CGPointMake(center.x + winSize.width/4, center.y - winSize.height/4);
        
        CCActionFiniteTime* actionMove = [CCActionMoveTo actionWithDuration:1.0 position:finalPos];
        CCAction *rotateBy = [CCActionRotateBy actionWithDuration:2.0 angle: 180];
        
        CCAction *tintTo= [CCActionTintTo actionWithDuration:1.0 color: [CCColor colorWithRed:0.0f green:1.0 blue:0.0]];
        
        CCAction *delay = [CCActionDelay actionWithDuration:1.0];
        CCAction *moveToInit = [CCActionMoveTo actionWithDuration:1.0 position:initPos];
        
        CCAction *rotateBack = [CCActionRotateBy actionWithDuration:2.0 angle: 180];
        
        CCAction *tintBlue= [CCActionTintTo actionWithDuration:1.0 color: [CCColor colorWithRed:0.0f green:0.0 blue:1.0]];
        
        CCAction *sequence = [CCActionSequence actions:actionMove, rotateBy,tintTo, moveToInit, delay, rotateBack, tintBlue, nil];
        
        [hero runAction:sequence];
    }
    
    return self;
}

- (CCSprite *) spriteWithColor:(ccColor4F) bgColor textureWidth:(float)textureWidth textureHeight:(float)textureHeight {

    CCRenderTexture *rt = [CCRenderTexture renderTextureWithWidth:textureWidth height:textureHeight];
    
    [rt beginWithClear:bgColor.r
                    g:bgColor.g
                    b:bgColor.b
                    a:bgColor.a];
    
    [rt end];
    
    return [CCSprite spriteWithTexture:rt.sprite.texture];
}

@end
