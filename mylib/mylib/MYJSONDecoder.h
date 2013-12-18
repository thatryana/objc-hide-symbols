

#import <Foundation/Foundation.h>

@interface MYJSONDecoder : NSObject

+(instancetype)decoder;
    
-(NSDictionary*)JSONFromData:(NSData*)data;
    
@end
