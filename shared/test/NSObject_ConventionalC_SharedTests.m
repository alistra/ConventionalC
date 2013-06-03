#import <SenTestingKit/SenTestingKit.h>
#import "NSObject+ConventionalC.h"

@interface NSObject_ConventionalC_SharedTests : SenTestCase
@end

@interface TestObject : NSObject
  @property(retain) NSString* string;
  @property(retain) NSArray* strings;
  @property(retain) NSArray* testObjects;
  @property(retain) NSObject* nilValue;
@end

@implementation NSObject_ConventionalC_SharedTests

-(void)testPropertyNames
{
    STAssertEqualObjects(TestObject.new.propertyNames, (@[@"string", @"strings", @"testObjects", @"nilValue"]), nil);
}

-(void)testAsDictionary
{
    STAssertEqualObjects(TestObject.new.asDictionary,
                         (@{@"string":@"string1",
                            @"strings":@[@"string2", @"string3"],
                            @"testObjects":@[
                                @{@"string":@"string4"},
                                NSNull.null
                            ],
                          }), nil);
}

-(void)testIsKindOfClasses
{
    STAssertTrue([TestObject.new isKindOfClasses:@[NSObject.class]], nil);
    STAssertTrue([TestObject.new isKindOfClasses:@[TestObject.class]], nil);
    STAssertFalse([TestObject.new isKindOfClasses:@[NSString.class]], nil);
    STAssertTrue([TestObject.new isKindOfClasses:(@[NSString.class, TestObject.class])], nil);
}

@end

@implementation TestObject

+(instancetype)new
{
    TestObject* object = super.new;
    object.string = @"string1";
    object.strings = @[@"string2", @"string3"];
    TestObject* subObject = TestObject.alloc.init;
    subObject.string = @"string4";
    object.testObjects = @[subObject, object]; //Add object to test recursion.
    return object;
}

@end