#ifdef TARGET_OS_MAC
#else
  #import <Foundation/Foundation.h>
#endif

@interface NSObject (ConventionalC)

/* Creates a dictionary representing the object. Cyclical references are not detected.
 * • NSStrings, NSNumbers, and NSNulls are returned unprocessed.
 * • NSArray elements are converted as needed and returned in a new array.
 * • Other objects are converted to dictionaries.
 */
@property(nonatomic, readonly) NSDictionary* asDictionary;

// Returns property names as NSStrings.
@property(nonatomic, readonly) NSArray* propertyNames;

// Returns YES if the object matches any of the classes passed.
-(BOOL)isKindOfClasses:(NSArray*)classes;

@end