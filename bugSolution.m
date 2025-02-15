The solution involves explicitly retaining the object returned by `createMyClass` before it's used. With ARC, this usually means ensuring the object is assigned to a strong property or a strong local variable. This ensures that the object remains in memory until it is no longer needed.

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *someString;
@end

@implementation MyClass
- (instancetype)init {
    self = [super init];
    if (self) {
        _someString = [[NSString alloc] initWithString:@"Hello"];
    }
    return self;
}
@end

- (MyClass *)createMyClass {
    MyClass *myClass = [[MyClass alloc] init];
    return myClass; // Autoreleased
}

int main(int argc, const char * argv[]) {
    MyClass *myObject = [[self createMyClass] retain]; // Retain the object
    NSLog(@"String: %@
", myObject.someString); // Should work correctly
    [myObject release]; // Balance the retain
    return 0;
}
```
**Note:** In modern Objective-C development, using `retain` and `release` directly is discouraged.  Strong properties and ARC should handle the memory management.  The example illustrates the underlying issue; ideally, a strong property should handle object ownership.