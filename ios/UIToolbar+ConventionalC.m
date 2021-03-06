#import "UIToolbar+ConventionalC.h"
#import "ConventionalC.h"

@implementation UIToolbar(ConventionalC)

+(UIToolbar*)toolbarWithItems:(NSArray*)items
{
    UIToolbar* bar = UIToolbar.new;
    bar.items = items;
    
    UIView* v = bar.subviews.last;
    bar.width = v.x + v.width;
    
    return bar;
}

-(void)removeItem:(UIBarButtonItem*)i
{
    self.items = [self.items arrayByRemovingObject:i];
}

-(void)removeLastItem
{
    self.items = [self.items arrayByRemovingLastObject];
}

-(void)addItem:(UIBarButtonItem*)i
{
    self.items = [self.items arrayByAddingObject:i];
}

@end
