
#import "MYJSONDecoder.h"
#import "JSONKit.h"

@interface MYJSONDecoder () {
    JSONDecoder *_decoder;
}

@end

@implementation MYJSONDecoder
    
+(instancetype)decoder {
    return [[self alloc] init];
}
    
- (id)init
{
    self = [super init];
    if (self) {
        _decoder = [JSONDecoder decoder];
    }
    return self;
}
    
-(NSDictionary*)JSONFromData:(NSData*)data {
    return [_decoder objectWithData:data];
}

@end
