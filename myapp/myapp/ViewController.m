//
//  ViewController.m
//  myapp
//
//  Created by Eric Ito on 12/18/13.
//
//

#import "ViewController.h"
#import "mylib.h"
#import "JSONKit.h"

#define TIME_URL [NSURL URLWithString:@"http://time.jsontest.com/"]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData* data = [NSData dataWithContentsOfURL:TIME_URL];
        MYJSONDecoder *decoder = [MYJSONDecoder decoder];
        NSDictionary *json = [decoder JSONFromData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Decoded from library JSONKit");
            [self gotJSON:json];
        });
        
        NSDictionary *json2 = [[JSONDecoder decoder] objectWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Decoded from app JSONKit");            
            [self gotJSON:json2];
        });
    });
}
    
-(void)gotJSON:(NSDictionary*)json{
    NSLog(@"JSON: %@", json);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
