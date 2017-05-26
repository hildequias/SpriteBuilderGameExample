#import "MainScene.h"

@implementation MainScene

+ (CCScene *) scene {
    return [[self alloc] init];
}

-(id)init{
    
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
        
        CCSprite *backgroundImage = [CCSprite spriteWithImageNamed:@"Bg.png"];
        backgroundImage.position = CGPointMake(winSize.width/2,
                                               winSize.height/2);
        [self addChild:backgroundImage];
        
        //rtSprite
        CCSprite* rtSprite = [self spriteWithColor:ccc4f(1.0, 1.0, 0.0, 1.0) textureWidth:150 textureHeight:150];
        
        rtSprite.position = CGPointMake(winSize.width/2, winSize.height/2);
        [self addChild:rtSprite];

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
