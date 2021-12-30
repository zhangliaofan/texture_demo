//
//  TexturePlugin.m
//  Runner
//
//  Created by wd on 12/29/21.
//

#import "TexturePlugin.h"
#import "GLRender.h"

@interface TexturePlugin()
@property (nonatomic, strong) NSObject<FlutterTextureRegistry> *textures;
@property (nonatomic, strong) GLRender *glRender;
@end

@implementation TexturePlugin

- (instancetype) initWithTextures:(NSObject<FlutterTextureRegistry> *)textures {
    if (self = [super init]) {
        _textures = textures;
    }
    return self;
}

+ (void)registerWithRegistrar:(nonnull NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"opengl_texture" binaryMessenger:[registrar messenger]];
    
    TexturePlugin *instance = [[TexturePlugin alloc ] initWithTextures:registrar.textures ];

    [registrar addMethodCallDelegate:instance channel:channel];
}


-(void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    
    if ([call.method isEqualToString:@"newTexture"]) {
    
          __block int64_t textureId = 0;
          
        
        _glRender = [[GLRender alloc] initWithFrame];
        
         [self.textures textureFrameAvailable:textureId];
          textureId = [_textures registerTexture:_glRender];
          
//          [_glRender startRender];
          
          result(@(textureId));
      }
}

@end
