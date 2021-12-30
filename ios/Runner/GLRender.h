//
//  GLRender.h
//  Runner
//
//  Created by wd on 12/29/21.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLRender : NSObject<FlutterTexture>
- (instancetype)initWithFrame;
@end

NS_ASSUME_NONNULL_END
