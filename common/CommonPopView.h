

//本工具view 支持 从上下左右 边缘侧滑入 父view 中，如果设置了 contentView 则侧滑到 contentView 刚好全部显示的位置，如果设置了finalPosition，则优先用自定义的位置
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,PopViewFromDirection) {
    
    PopViewFromDirection_up,
    PopViewFromDirection_left,
    PopViewFromDirection_bottom,
    PopViewFromDirection_right,
};

@interface CommonPopView : UIView

@property (nonatomic,strong) UIView *contentView;//添加的内容

@property (nonatomic) NSNumber *finalPosition;//单位向量( @(0) - @(1) )，从边缘侧滑到哪个位置，滑动的总距离 = 父view（长或宽） * finalPosition

@property (nonatomic) CGFloat alpha;//背景view 的 透明度

@property (nonatomic) PopViewFromDirection direction;//从那个方向滑入
@property (nonatomic) BOOL dockCenter;  //是否停在屏幕中间

@property (nonatomic) void(^actionBeforeRemove)(void);//移除self前 要做的事

- (void)showInView:(UIView*)superView;

//handler 完全显示出来之后的block
- (void)showInView:(UIView *)superView withFinishedShowedHandle:(void(^)(void))handler;

- (void)dismissViewWithCompleteActionBlock:(void(^)(void))actionBlock;

@end
