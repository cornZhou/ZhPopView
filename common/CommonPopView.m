

#import "CommonPopView.h"

@implementation CommonPopView
{
    UIView      *_backView;//背景view
}
@synthesize contentView = _contentView;

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (void)setupViews
{
    _backView = [[UIView alloc] init];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundClick:)];
    [_backView addGestureRecognizer:tap];
    [self addSubview:_backView];
}

-(void)setContentView:(UIView *)contentView
{
    _contentView = contentView;
    
    [self addSubview:_contentView];
//    [self setContentViewFrameWithAfterActtion:NO];
}

- (UIView *)contentView
{
    return _contentView;
}

- (void)showInView:(UIView*)superView
{
    
    [self showInView:superView withFinishedShowedHandle:nil];
}

//handler 完全显示出来之后的block
- (void)showInView:(UIView *)superView withFinishedShowedHandle:(void(^)(void))handler
{
    [superView addSubview:self];
    self.frame = superView.bounds;
    _backView.frame = self.bounds;
    _backView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:self.alpha];
    
    [self addSwipGesture];
    
    [self setContentViewFrame];
    __weak typeof(self) __self = self;
    
    [UIView animateWithDuration:0.3 animations:^{
        [__self contentViewTransFormShow];
    } completion:^(BOOL finished) {
        if (finished && handler) {
            handler();
        }
    }];
}

- (void)addSwipGesture
{
    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipSelf:)];
    if (self.direction == PopViewFromDirection_up)
    {
        swip.direction = UISwipeGestureRecognizerDirectionUp;
    }
    else if (self.direction == PopViewFromDirection_left)
    {
        swip.direction = UISwipeGestureRecognizerDirectionLeft;
    }
    else if (self.direction == PopViewFromDirection_bottom)
    {
        swip.direction = UISwipeGestureRecognizerDirectionDown;
    }
    else if (self.direction == PopViewFromDirection_right)
    {
        swip.direction = UISwipeGestureRecognizerDirectionRight;
    }
    [self addGestureRecognizer:swip];
}

- (void)swipSelf:(UISwipeGestureRecognizer*)swip
{
    [self removeSelfAnimation];
}

- (void)backgroundClick:(UIGestureRecognizer*)tap
{
    [self removeSelfAnimation];
}

- (void)removeSelfAnimation
{
    [self dismissViewWithCompleteActionBlock:nil];
}

- (void)dismissViewWithCompleteActionBlock:(void(^)(void))actionBlock
{
    __weak typeof(self) __self = self;
    [UIView animateWithDuration:0.3 animations:^{
        [__self contentViewTransFormHidden];
    } completion:^(BOOL finished) {
        [__self removeFromSuperview];
        if (__self.actionBeforeRemove) {
            __self.actionBeforeRemove();
        }
        
        if (actionBlock) {
            actionBlock();
        }
    }];
}

- (void)contentViewTransFormHidden
{
    CGFloat height = _contentView.height;
    CGFloat width = _contentView.width;
    CGFloat offsetx = 0;
    CGFloat offsety = 0;
    
    if (self.dockCenter)
    {
        offsetx = self.width/2 - self.contentView.width/2;
        offsety = self.height/2 - self.contentView.height/2;
    }

    if (self.direction == PopViewFromDirection_up)
    {
        _contentView.transform = CGAffineTransformTranslate(self.contentView.transform, 0, -(height + offsety));
    }
    else if (self.direction == PopViewFromDirection_left)
    {
        _contentView.transform = CGAffineTransformTranslate(self.contentView.transform, -(width + offsetx), 0);
    }
    else if (self.direction == PopViewFromDirection_bottom)
    {
        _contentView.transform = CGAffineTransformTranslate(self.contentView.transform, 0, height + offsety);
    }
    else if (self.direction == PopViewFromDirection_right)
    {
        _contentView.transform = CGAffineTransformTranslate(self.contentView.transform, width + offsetx, 0);
    }
}

- (void)contentViewTransFormShow
{
    CGFloat height = _contentView.height;
    CGFloat width = _contentView.width;
    CGFloat offsetx = 0;
    CGFloat offsety = 0;
    
    if (self.dockCenter)
    {
        offsetx = self.width/2 - self.contentView.width/2;
        offsety = self.height/2 - self.contentView.height/2;
    }

    if (self.direction == PopViewFromDirection_up)
    {
        _contentView.transform = CGAffineTransformTranslate(self.contentView.transform, 0, (height + offsety));
    }
    else if (self.direction == PopViewFromDirection_left)
    {
        _contentView.transform = CGAffineTransformTranslate(self.contentView.transform, (width + offsetx), 0);
    }
    else if (self.direction == PopViewFromDirection_bottom)
    {
        _contentView.transform = CGAffineTransformTranslate(self.contentView.transform, 0, -(height + offsety));
    }
    else if (self.direction == PopViewFromDirection_right)
    {
        _contentView.transform = CGAffineTransformTranslate(self.contentView.transform, -(width + offsetx), 0);
    }
}

//侧滑前的frame
- (void)setContentViewFrame
{
    CGFloat supHeight = self.superview.bounds.size.height;
    CGFloat supWidth = self.superview.bounds.size.width;
    CGFloat height = _contentView.height;
    CGFloat width = _contentView.width;
    
    if (self.direction == PopViewFromDirection_up)
    {
        _contentView.frame = CGRectMake(MAX(0, (supWidth - width)/2.0), -height, width, height);
    }
    else if (self.direction == PopViewFromDirection_left)
    {
        _contentView.frame = CGRectMake(-width, MAX(0, (supHeight - height)/2.0), width, height);
    }
    else if (self.direction == PopViewFromDirection_bottom)
    {
        _contentView.frame = CGRectMake(MAX(0, (supWidth - width)/2.0), supHeight, width, height);
    }
    else if (self.direction == PopViewFromDirection_right)
    {
        _contentView.frame = CGRectMake(supWidth, MAX(0, (supHeight - height)/2.0), width, height);
    }
}


@end
