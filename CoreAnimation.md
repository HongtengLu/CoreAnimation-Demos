<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. CALayer</a>
<ul>
<li><a href="#sec-1-1">1.1. 内容</a>
<ul>
<li><a href="#sec-1-1-1">1.1.1. (id) contents</a></li>
<li><a href="#sec-1-1-2">1.1.2. (NSString *) contentGravity</a></li>
<li><a href="#sec-1-1-3">1.1.3. (CGFloat) contentsScale</a></li>
<li><a href="#sec-1-1-4">1.1.4. (BOOL) maskToBounds</a></li>
<li><a href="#sec-1-1-5">1.1.5. (CGRect)contentsRect</a></li>
<li><a href="#sec-1-1-6">1.1.6. (CGRect) contentsCenter</a></li>
</ul>
</li>
<li><a href="#sec-1-2">1.2. 自定义绘画</a></li>
<li><a href="#sec-1-3">1.3. 布局</a>
<ul>
<li><a href="#sec-1-3-1">1.3.1. (CGPoint) anchorPoint 与 (CGPoint ) position</a></li>
<li><a href="#sec-1-3-2">1.3.2. (BOOL)geometryFlipped</a></li>
<li><a href="#sec-1-3-3">1.3.3. (CGFloat)zPosition 和 (CGFloat)anchorPointZ</a></li>
<li><a href="#sec-1-3-4">1.3.4. 不同图层是坐标系转换</a></li>
<li><a href="#sec-1-3-5">1.3.5. -containsPoint: 和 -hitTest:</a></li>
</ul>
</li>
<li><a href="#sec-1-4">1.4. 基本视觉效果</a>
<ul>
<li><a href="#sec-1-4-1">1.4.1. 边框,圆角与裁剪</a></li>
<li><a href="#sec-1-4-2">1.4.2. 阴影</a></li>
<li><a href="#sec-1-4-3">1.4.3. (CALayer)mask 图层蒙版</a></li>
<li><a href="#sec-1-4-4">1.4.4. 拉伸过滤</a></li>
<li><a href="#sec-1-4-5">1.4.5. 组透明</a></li>
</ul>
</li>
<li><a href="#sec-1-5">1.5. 仿射变换</a>
<ul>
<li><a href="#sec-1-5-1">1.5.1. 单一的仿射变换</a></li>
<li><a href="#sec-1-5-2">1.5.2. 混合变换</a></li>
</ul>
</li>
<li><a href="#sec-1-6">1.6. 一些工具图层类</a>
<ul>
<li><a href="#sec-1-6-1">1.6.1. CAShapeLayer</a></li>
<li><a href="#sec-1-6-2">1.6.2. CATextLayer</a></li>
<li><a href="#sec-1-6-3">1.6.3. CATransformLayer</a></li>
<li><a href="#sec-1-6-4">1.6.4. CAGradientLayer</a></li>
<li><a href="#sec-1-6-5">1.6.5. CAReplicatorLayer</a></li>
<li><a href="#sec-1-6-6">1.6.6. CAScrollLayer</a></li>
<li><a href="#sec-1-6-7">1.6.7. CATiledLayer</a></li>
<li><a href="#sec-1-6-8">1.6.8. CAEmitterLayer</a></li>
<li><a href="#sec-1-6-9">1.6.9. CAEAGLLayer</a></li>
<li><a href="#sec-1-6-10">1.6.10. AVPlayLayer</a></li>
</ul>
</li>
<li><a href="#sec-1-7">1.7. 隐式动画</a>
<ul>
<li><a href="#sec-1-7-1">1.7.1. 事务 CATransaction</a></li>
<li><a href="#sec-1-7-2">1.7.2. 图层行为</a></li>
<li><a href="#sec-1-7-3">1.7.3. 呈现图层与模型图层</a></li>
</ul>
</li>
<li><a href="#sec-1-8">1.8. 显式动画</a>
<ul>
<li><a href="#sec-1-8-1">1.8.1. 属性动画</a></li>
<li><a href="#sec-1-8-2">1.8.2. 过渡动画</a></li>
</ul>
</li>
<li><a href="#sec-1-9">1.9. 图层时间</a>
<ul>
<li><a href="#sec-1-9-1">1.9.1. CAMediaTiming 概览</a></li>
<li><a href="#sec-1-9-2">1.9.2. 层级时间</a></li>
<li><a href="#sec-1-9-3">1.9.3. 全局时间</a></li>
<li><a href="#sec-1-9-4">1.9.4. 时间转换</a></li>
<li><a href="#sec-1-9-5">1.9.5. 时间属性的应用</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</div>
</div>

# CALayer<a id="sec-1" name="sec-1"></a>

## 内容<a id="sec-1-1" name="sec-1-1"></a>

### (id) contents<a id="sec-1-1-1" name="sec-1-1-1"></a>

首先,contents属性之所以会是id类型,是因为 Mac OS 与 iOS 同样使用了 CALayer, 在 Mac OS 上,这个属性对 CGImage 和 NSImage 类型的值都起作用,而在 iOS 上只能对 CGImageRef 类型的值起作用, CGImageRef 是一个指向 CGImage 结构的指针.UIImage 有一个 CGImage 的属性,返回一个 CGImageRef 指针.但是CGImageRef 是一个 Core Foundation 类型,不能直接被赋值给 contents,可以使用 bridged 关键字转换:

    layer.contents = (__bridge id)image.CGImage;

### (NSString \*) contentGravity<a id="sec-1-1-2" name="sec-1-1-2"></a>

和 UIView 的 contentMode 一样,contentsGravity 的目的是为了决定内容在图层的边界中怎么对齐,可选的常量值有如下:
-   **kCaGravityCenter:** 不会拉伸图片,居中.
-   **kCaGravityTop:** 
-   **kCaGravityBottom:** 
-   **kCaGravityLeft:** 
-   **kCaGravityRight:** 
-   **kCaGravityTopLeft:** 
-   **kCaGravityTopRight:** 
-   **kCaGravityBottomRight:** 
-   **kCaGravityBottomLeft:** 
-   **kCaGravityResize:** 
-   **kCaGravityResizeAspect:** 等同于 UIViewContentModeScaleAspectFit,同时它还能在图层中等比例拉伸以适应图层的边界.
-   **kCaGravityResizeAspectFill:** 

    self.layerView.layer.contentsGravity = kCaGravityResizeAspect

### (CGFloat) contentsScale<a id="sec-1-1-3" name="sec-1-1-3"></a>

这个属性定义了寄宿图的像素尺寸和视图大小的比例,默认为 1.0 的浮点数.表示将会以每个点1个像素绘制图片,如果设置为2.0则会以每个点2个像素绘制.
tip:如果对应的 layer 设置了 contentsGravity 属性为 Resize 系列 ,此时设置 contentsScale 就不会有任何影响,因为设置了 Resize 就会拉伸图片来适应图层,不会考虑分辨率的问题.相反,如果设置了 contentsGravity 为 Center,就会有明显的影响.绘制图片会依据 contentsScale 比例来绘制,受图片比例影响,会出现图片过大或者过小的问题.

### (BOOL) maskToBounds<a id="sec-1-1-4" name="sec-1-1-4"></a>

对应 UIView 的 clipsToBounds 属性,修剪超出边界的内容.

### (CGRect)contentsRect<a id="sec-1-1-5" name="sec-1-1-5"></a>

该属性允许我们在图层边框里显示寄宿图的一个子域,和 bounds 和 frame 不同, contentRect 不是按照点来计算的,它使用了单位坐标,是一个相对值,相对于寄宿图的尺寸.可以理解为剪图,通过指定的相对坐标,将寄宿图指定的区域剪辑出来,只绘制该区域.
contentsRect 主要应用在图片拼合和图片加载的性能优化.同时加载多张小图比加载一张大图使用的时间更多.

### (CGRect) contentsCenter<a id="sec-1-1-6" name="sec-1-1-6"></a>

contentsCenter 属性与寄宿图拉伸有关,默认值是{0,0,1,1},这意味着如果图层大小(由 contentsGravity 决定)改变了,寄宿图就会被均匀地拉伸开.但是如果假设指定为{0.25,0.25,0.5,0.5},在指定区域的边界处就创造了一个假象的边框,这个边框里面的内容会被均匀地拉伸,而边框上下的内容会被水平拉伸,边框左右的内容会被垂直拉伸,边框的四个角的区域(以{0.25,0.25,0.5,0.5}为例,左上角的区域:{0,0,0.25,0.25})不会被拉伸.
contentsCenter 属性可以在 IB 里面设置,就是 UIView 类目下的 Stretching 属性.

## 自定义绘画<a id="sec-1-2" name="sec-1-2"></a>

给 contents 赋 CGImage 的值不是唯一的设置寄宿图的方法,我们也可以使用 Core Graphics 直接绘制寄宿图.通过继承 UIView 并实现 -drawRect: 方法来实现自定义绘制.
简单介绍 -drawRect: 方法. 首先系统没有默认实现 -drawRect: 方法,因为对于 UIView 来说,寄宿图并不是必须的.如果 UIView 检测到该方法被自定义实现了,那它就会为视图分配一个寄宿图,这个寄宿图的像素尺寸等于视图大小乘以 contentsScale 的值.所以,如果不需要寄宿图就不应该创建这个方法(即使是空实现),会造成资源的浪费.

1.  <id CALayerDelegate> delegate

    CALayerDelegate 是为了重绘和布局工作.当需要(-display 方法被调用)被重绘时,CALayer 会请求它的代理给他一个寄宿图来显示:
    
        /* If defined, called by the default implementation of the -display
         * method, in which case it should implement the entire display
         * process (typically by setting the `contents' property). */
        -(void)displayLayer:(CALayer *)layer;
    
    如果代理没有实现 -displayLayer: 方法,CALayer 就会尝试调用下面这个方法
    tip:在调用之前,CALayer 就已经创建了一个合适尺寸(由 bounds 和 contentsScale 决定)的空的寄宿图和一个 Core Graphics 的绘制上下文环境,它将作为ctx参数传入.
    
        - (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;
    
    CALayerDelegate 还有一个方法 :
    
        - (void)layoutSublayersOfLayer:(CALayer *)layer;
    
    从方法名可以知道这个方法是 CALayer 提供给代理重新布局子图层的方法.它会在 layer 的 bounds 发生改变 或者 layer 的 -setNeedsLayout 方法被调用时调用.在这个代理方法内部,我们可以手动调整图层的布局或大小.
    需要注意的是,CALayer 中并没有像 UIView 提供的 UIViewAutoresizingMask 和 NSLayoutConstraint 之类的自动布局 API,在图层中,我们只能够通过手动调整 CALayer 的布局.(尽管在 Mac OS 中有一个layoutManager 属性可以实现自动排版,iOS中却没有).

## 布局<a id="sec-1-3" name="sec-1-3"></a>

UIView  有三个比较重要的布局属性:frame,bounds 和 center
CALayer 对应地叫做:frame,bounds 和 position.
其中, position 和 center 都是表示同样的值,不同的名字只是为了区分.视图的 center 属性和图层的 position 属性都指定了 anchorPoint 相对于父图层的位置.anchorPoint 默认位于图层的重点,由于 UIView 接口中并没有暴露 anchorPoint 属性,所以我们不可以直接操作视图的anchorPoint,但是可以通过图层来实现.
tip: 这里有必要介绍一下 frame 与 bounds 之间的特殊关系:在对图层做变换的时候,比如旋转或者缩放,frame 的宽高可能会和 bounds 的宽高不再一致了.如下图
![img](/Users/teng/Desktop/学习/IOS/Core_Animation/note_core_animation/frame_and_bounds.png)

### (CGPoint) anchorPoint 与 (CGPoint ) position<a id="sec-1-3-1" name="sec-1-3-1"></a>

anchorPoint 中文称为锚点,它是一个 CGPoint 类型的相对坐标,它相对于 layer 本身,默认值是{0.5,0.5},也就是位于 layer 本身(图层)的中心.
anchorPoint 有两个作用,一是作为图层变换的支点(如旋转就以 anchorPoint 为中心旋转),通过设置不同的 anchorPoint 可以产生不同的变换效果(比如一条线段以中点旋转,轨迹成直径为线段长度的圆,以端点旋转,轨迹成直径为线段长度两倍的圆).第二个作用就是确定 layer 本身在 superLayer 中的位置 position.
第一个作用很好理解,我来解释一下第二个作用.
首先看 anchorPoint 与 position 的关系,经过 [代码](https://github.com/HongtengLu/HTLearningDemo) (可以在CALayer目录下找到 anchorPoint 和 position)的测试我们知道,无论单独修改 layer 的 anchorPoint 或者 positon,都不会影响到另外一个属性.只有 layer 的 frame.origin 发生了变化.而如果改变 frame.origin,发现 position 的值发生了变化,而 anchorPoint 的值不变.
综合代码结果,可以得出结论:
1.  position 是 layer 的 anchorPoint 在 superLayer 中的绝对坐标;
2.  anchorPoint 和 position 共同作用并影响着 frame.origin 的值,反过来,frame 影响着 position 的值,不影响 anchorPoint的值.
3.  anchorPoint 只有在手动修改的情况下值才会变.
4.  anchorPoint , position 和 frame 之间存在着这样的关系:

    position.x = frame.origin.x + 0.5 * bounds.size.width；  
    position.y = frame.origin.y + 0.5 * bounds.size.height

### (BOOL)geometryFlipped<a id="sec-1-3-2" name="sec-1-3-2"></a>

由于 iOS 和 MAC OS 的坐标系统不同,通常来说, iOS 上的图层的 position 位于父图层的左上角,但是在 Mac OS 上是在左下角.这个属性是用来适配这两种不同的情况的.如果设置为 YES, 则该图层的坐标就相对于福图层垂直翻转,所有自图层也会翻转.

### (CGFloat)zPosition 和 (CGFloat)anchorPointZ<a id="sec-1-3-3" name="sec-1-3-3"></a>

和 UIView 不同, CALayer 存在于一个三维空间中.除了已经讨论过的 position 和 anchorPoint 属性之外, zPosition 和 anchorPointZ 二者都是在 Z 轴上描述图层位置的浮点类型. 
zPosition 最实用的功能就是改变图层的显示顺序,zPosition 值大的图层会被显示在前面, 后面的图层会被遮挡.
注意:改变 zPosition 的值只会对显示渲染的效果产生影响,对原本的图层树的顺序结构不造成影响.同时也会影响 layer 对触点事件的点的判断.比如,按顺序添加蓝色图层和白色图层.白色图层覆盖了蓝色图层,我们修改蓝色图层的 zPosition 的值使得蓝色图层覆盖了白色图层,在点击事件中,响应的图层则是蓝色图层.可能有人会有疑问,CALayer 不是不能响应事件么?确实是这样的,但是 CALayer 提供了两个方法 -containsPoint: 和 -hitTest: 来通过坐标判断点的位置,结合触摸事件,就可以判断触摸了哪个图层.这在后面有介绍.

### 不同图层是坐标系转换<a id="sec-1-3-4" name="sec-1-3-4"></a>

CALayer 给不同图层之间的坐标转换提供的工具类方法:
1.  - (CGPoint)convertPoint:(CGPoint)p fromLayer:(nullable CALayer \*)l;
2.  - (CGPoint)convertPoint:(CGPoint)p toLayer:(nullable CALayer \*)l;
3.  - (CGRect)convertRect:(CGRect)r fromLayer:(nullable CALayer \*)l;
4.  - (CGRect)convertRect:(CGRect)r toLayer:(nullable CALayer \*)l;

### -containsPoint: 和 -hitTest:<a id="sec-1-3-5" name="sec-1-3-5"></a>

-containsPoint: 接收一个本图层坐标系下的 CGPoint,如果这个点在 frame 下就返回 YES,反之 NO.也就是说,如果已知一个不属于本图层坐标系的点,那就要先将点坐标转换为本图层坐标系下的坐标.
-hitTest: 接收任意一个 CGPoint 类型的值,然后返回包含这个坐标点的节点图层.可以通过根据返回的图层的指针来判断点在哪个图层上.

1.  

## 基本视觉效果<a id="sec-1-4" name="sec-1-4"></a>

### 边框,圆角与裁剪<a id="sec-1-4-1" name="sec-1-4-1"></a>

(CGFloat) borderWidth 控制边框的宽度,注意,边框是在图层边界内的,边框依据图层边界绘制.
(CGColorRef) borderColor 控制边框的颜色.
通过设置 layer 的 (CGFloat)cornerRadius(圆角半径) 的值,再设置 layer 的 (BOOL)maskToBounds(是否裁剪) 为 YES,可以看到圆角效果.
注意裁剪是根据 layer 的边界来裁剪的.

### 阴影<a id="sec-1-4-2" name="sec-1-4-2"></a>

1.  (float) shadowOpacity,(CGColorRef) shadowColor,(CGFloat) shadowRadius 和 (CGSize) shadowOffset.

    shadowOpacity 顾名思义就是阴影的不透明度,取值在 0.0 ~ 1 之间,1代表完全不透明,0代表完全透明(即不可见),默认为0.
    shadowColor 就是阴影的颜色了,默认黑色.
    shadowRadius 控制着阴影的模糊度,值越高越模糊.
    shadowOffset 控制着阴影的方向和距离, 宽度控制着阴影的横向位移,高度控制着纵向位移.默认是{0,-3},这意味着默认的是向上的阴影.Mac OS 上默认是{0,3}.同样是 Y 轴相反的原因.
    上面提到边框是根据图层边界绘制的,而阴影则会依据寄宿图的轮廓来确定.
    当裁剪遇上阴影的时候,我们会发现阴影也被裁剪掉了.解决办法就是用一个有阴影的图层包含一个需要裁剪的图层.大小一致就可以了.

2.  (CGPathRef)shadowPath 自定义阴影形状

    我们知道图层阴影在有寄宿图的时候是通过寄宿图的形状来计算阴影形状的,这是非常消耗资源的.而如果我们事先提供一个 CGPathRef 类型来指定阴影的形状,就可以解决这个问题.

### (CALayer)mask 图层蒙版<a id="sec-1-4-3" name="sec-1-4-3"></a>

有时候我们可能需要按照特定的形状裁剪图层的显示内容,这个时候 mask 就派上用场了,mask 也是一个 CALayer 类型,它表现得就像是拥有该属性的图层的子图层.
如何使用 mask?我们要关心的只有 mask 的轮廓&#x2014;即 mask 的 contents.一旦 mask 的大小比 layer 的小,mask 就会按照 mask.contents 的轮廓裁剪 layer 的可视部分.

### 拉伸过滤<a id="sec-1-4-4" name="sec-1-4-4"></a>

### 组透明<a id="sec-1-4-5" name="sec-1-4-5"></a>

## 仿射变换<a id="sec-1-5" name="sec-1-5"></a>

### 单一的仿射变换<a id="sec-1-5-1" name="sec-1-5-1"></a>

CALayer 中有这样两个方法:

    /* Convenience methods for accessing the `transform' property as an
     * affine transform. */
    - (CGAffineTransform)affineTransform;
    - (void)setAffineTransform:(CGAffineTransform)m;

CALayer 并没有声明 affineTransform 这个属性,但是提供了 setter 和 getter .由注释可以知道这两个方法内部是与 transform 属性做了一些处理.我们可以通过 -setAffineTransfrom: 来实现图层二维空间的平移,缩放和旋转.
先来说一下 CGAffineTransform 这个类型, CGAffineTransform 是一个可以和二维空间向量(例如 CGPoint)做乘法的 3X2 的矩阵.这里不探究矩阵数学和仿射变换的本质,只介绍使用方法.
如何创建一个 CGAffineTransform? Core Graphics 提供了一系列函数来做一些简单的变换:

    CGAffineTransformMakeScale(CGFloat sx, CGFloat sy);//缩放转换
    CGAffineTransformMakeRotation(CGFloat angle);//旋转转换,angle 参数是指需要旋转的弧度,弧度用 π 的倍数来表示.
    CGAffineTransformMakeTranslation(CGFloat tx, CGFloat ty);//平移转换

通过实验我们可以看到,如果每次都新建一个 CGAffineTransfrom(不管它是哪种变换),然后将连续将每个 transform 赋值给同一图层,并不会得到连续的动画效果,只会看到最后一个变换效果.
如果我们想连续或者同时进行多种变换,那就要使用到混合变换.

### 混合变换<a id="sec-1-5-2" name="sec-1-5-2"></a>

Core Graphics 已经为我们想好了,下面是在一个变换的基础上进行另外的变换的函数.

    CGAffineTransformRotate(CGAffineTransform t, CGFloat angle);
    CGAffineTransformScale(CGAffineTransform t, CGFloat sx, CGFloat sy);
    CGAffineTransformTranslate(CGAffineTransform t, CGFloat tx, CGFloat ty);

使用方法跟单一的变换差不多,只是需要将上一步变换的基础传入到新的变换函数中,只是一开始需要创建一个空的 CGAffineTransform .如下:

    CGAffineTransform transform = CGAffineTransformIdentity;//必须
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    transform = CGAffineTransformRotate(transform, M_PI / 180 * 30);
    transform = CGAffineTransformTranslate(transform, 50, 0);
    self.layerView.layer.affineTransform = transform;

注意:后添加的每一个变换都是建立在上一个变换的基础之上的,所以最后一个变换不是将图层向 x 方向移动 50 个点了,而是斜向地移动 25个点,因为之前已经做过缩放和旋转.这就意味着如果改变变换的顺序,会有不同的结果.

## 一些工具图层类<a id="sec-1-6" name="sec-1-6"></a>

### CAShapeLayer<a id="sec-1-6-1" name="sec-1-6-1"></a>

### CATextLayer<a id="sec-1-6-2" name="sec-1-6-2"></a>

### CATransformLayer<a id="sec-1-6-3" name="sec-1-6-3"></a>

### CAGradientLayer<a id="sec-1-6-4" name="sec-1-6-4"></a>

### CAReplicatorLayer<a id="sec-1-6-5" name="sec-1-6-5"></a>

### CAScrollLayer<a id="sec-1-6-6" name="sec-1-6-6"></a>

### CATiledLayer<a id="sec-1-6-7" name="sec-1-6-7"></a>

### CAEmitterLayer<a id="sec-1-6-8" name="sec-1-6-8"></a>

### CAEAGLLayer<a id="sec-1-6-9" name="sec-1-6-9"></a>

### AVPlayLayer<a id="sec-1-6-10" name="sec-1-6-10"></a>

## 隐式动画<a id="sec-1-7" name="sec-1-7"></a>

改变 CALayer 的可动画属性,我们会发现系统会自动地添加动画.这个行为默认是开启的.这就是 Core Animation 的隐式动画.那么 Core Animation 如何判断动画的类型和动画的持续时间?其实动画的执行时间取决于当前 事务 的设置,动画类型取决于 图层行为.下面的代码可以看到图层的颜色不是突然变化的而是有一个渐变的过程.

    self.playingLayer = [CALayer layer];
    [self.view.layer addSublayer:self.playingLayer];
    self.playingLayer.backgroundColor = [UIColor randomColor].CGColor;

### 事务 CATransaction<a id="sec-1-7-1" name="sec-1-7-1"></a>

事务可以理解为 CALayer 属性动画的集合,Core Animation 在每个 run loop 周期中都回自动开始一次新的事务,在每个事务中包含着所有一个 run loop 周期 内 CALayer 属性的改变,然后被提交,做一次 0.25 秒的动画.
事务由 CATransaction 类管理,但是这个管理类没有属性也没有实例方法不能实例化.我们可以操作的只有 +begin 和 +commit 分别来入栈和出栈.我们还可以通过 +setAnimationDuration: 来设置当前事务的动画执行时间.通过 +animationDuration 来获取当前事物的动画执行时间.当然如果是设置动画时间的话要在改变属性之前设置.
通过 CATransaction 我们可以手动新建事务,结合 +begin 和 +commit (这两个方法需要配对存在),并在这两个方法中间添加改变属性的代码,就等于把这些属性改变添加到新建的事务中了.
UIView 中的两个方法: +beginAnimation:context: , +commitAnimation ,以及 block 方法: +animateWithDuration:animation: ,它们都是因为设置了 CATransaction 才会有因视图或图层的属性改变而导致的动画.

    -(void)setUp{
        self.container = [UIView alloc]initWithFrame:CGRectMake(100,100,100,100);
        self.helper = [CALayer layer];
        self.helper.frame = CGRectMake(50,25,50,50);
        self.playingLayer = [CALayer layer];
        self.playingLayer.frame = CGRectMake(0,30,40,40);
        [self.containerView.layer addSublayer:self.playingLayer];
        [self.containerView.layer addSublayer:self.helper];
    }
    -(void)customTransaction{
        self.helper.backgroundColor = [UIColor randomColor].CGColor;//helper的颜色改变并无动画
    
        [CATransaction begin];//开始一次新的事务
        [CATransaction setAnimationDuration:2.0];//设置当前事务的动画时间
        self.playingLayer.backgroundColor = [UIColor randomColor].CGColor;//playingLayer颜色渐变
        [CATransaction commit];//提交事务
    }

1.  动画完成回调

    通过 CATransaction 的 +setCompletionBlock: 就可以设置完成回调了,如果在 block 内部设置动画属性,也会有动画效果,只不过动画时间为默认的0.25秒,因为这是用默认的事务做变换.当然我们也可以使用 +setAnimationDuration: 来控制动画时间.
    如上面的例子中,只要将 -customTransaction 改为:
    
        -(void)customTransaction{
            self.helper.backgroundColor = [UIColor randomColor].CGColor;//helper的颜色改变并无动画
        
            [CATransaction begin];//开始一次新的事务
            [CATransaction setAnimationDuration:2.0];//设置当前事务的动画时间
            [CATransaction setCompletionBlock:^{
                [CATransaction setAnimationDuration:3.0];//手动创建的事务已经提交并出栈,此刻的事务是系统的当前事务.
                self.playingLayer.affineTransform = CGAffineTransformMakeRotation(M_PI_4);//self.playingLayer 旋转动画,持续时间 3 秒.
            }];
            self.playingLayer.backgroundColor = [UIColor randomColor].CGColor;//playingLayer颜色渐变
            [CATransaction commit];//提交事务
        }

### 图层行为<a id="sec-1-7-2" name="sec-1-7-2"></a>

我们把改变动画属性时 CALayer 自动应用的动画称作行为.上面所说的通过 CATransaction 控制事务所产生的动画只有在对没有与视图关联的 CALayer 才有作用,也就是说如果我们按照 view.layer 的方式来改变该 layer 的动画属性是不会有动画效果的.为什么会这样?我们得先来看一下默认的动画是怎么产生的.

当 CALayer 的属性被修改的时候,它会调用 -actionForKey: 方法,通过传递属性名称来获取动画行为,然后将行为去对先前和当前的值做动画. -actionForKey: 内部的查询步骤有下面几步:
1.  检查是否有委托,委托是否实现 CALayerDelegate 的 -actionForLayer:forKey: 方法,有就直接调用返回.
2.  如果没有委托或者委托没有实现 -actionForLayer:forKey: 方法,图层就会在它的 (NSDictionary \*)action 字典中检查包含属性名称对应的行为,有就返回该行为.
3.  在 (NSDictionary \*)style 字典里面查找.
4.  以上都没有找到,就调用定义了每个属性的标准行为的 -defaultActionForKey: 方法.

所以,要么 -actionForKey: 返回空,要么返回 CAAction 协议对应的对象.于是就可以解释为何直接修改 UIView 的动画属性不会产生动画,只有在动画 block 之内的改变才会有动画了.每一个 UIView 实例都扮演着对应的 view.layer 的委托对象,遵守着 CALayerDelegate 协议,并实现了 -actionForLayer:forKey: 方法.而只有在 UIView 的动画 Block 内部改变的值才会返回对应的行为,其他则返回 nil.

还有一个可以手动禁用隐式动画的方法, CATransaction 的 -setDisableAction:.只要在 [CATransaction begin] 之后紧接着调用 -setDisableAction 方法就会禁用隐式动画.

结论:
1.  UIView 关联的 layer 禁用了隐式动画,对于 UIView 关联的图层做动画的唯一方法就是使用 UIView 的动画函数(而不是依赖 CATransaction),或者继承 UIView,覆盖 -actionForLayer:forKey: 手动创建一个显式动画.
2.  对于单独的图层我们可以通过 -actionForLayer:forKey: 或者提供一个 actions 字典来直接控制隐式动画.

下面是创建一个行为并应用的例子:

    - (void)viewDidLoad {
        [super viewDidLoad];
    
        self.playingLayer = [CALayer layer];
        self.playingLayer.frame = CGRectMake(50,50, 100, 100);
        self.playingLayer.backgroundColor = [UIColor blueColor].CGColor;
    
        //创建行为
        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromLeft;
    
        self.playingLayer.actions = @{@"backgroundColor":transition};
        [self.containerView.layer addSublayer:self.playingLayer];
    
    }
    -(IBAction)changeColor{
        self.playingLayer.backgroundColor = [UIColor randomColor].CGColor;
    }

### 呈现图层与模型图层<a id="sec-1-7-3" name="sec-1-7-3"></a>

可能有人注意到,我们一直以来对图层的操作都是在动画前或者动画后,那如何获取动画过程中的图层的属性呢?或者让动画过程中的图层"接收"交互事件?假设有这样的一个需求:一个图层从左慢慢平移到右边,在这个过程中,用户点击该图层该图层要变色.我们来试试下面的代码

    -(void)presentationLayer{
        [CATransaction setAnimationDuration:5];
        self.playingLayer.frame = CGRectMake(self.playingLayer.frame.origin.x + 100, self.playingLayer.frame.origin.y, self.playingLayer.frame.size.width, self.playingLayer.frame.size.height);
    }
    
    -(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
        CGPoint point = [[touches anyObject] locationInView:self.containerView];
        if ([self.playingLayer hitTest:point]) {
            self.playingLayer.backgroundColor = [UIColor randomColor].CGColor;
        }
    }

点击移动中的 self.playingLayer 并没有让它发生颜色变化.其实去检查 playingLayer 的 frame,我们会发现在设置了它的 frame 后,frame 马上就发生了变化,所以只有在点击动画结束后 playingLayer 的所在的位置才会触发颜色变化.
要获取动画过程中图层正呈现在屏幕中的属性,其实要用到 layer.presentationLayer .这就是所谓的呈现图层,而我们的 playingLayer 则是模型图层.呈现图层储存着模型图层在当前呈现在屏幕上的实时属性.每一个模型图层都对应着一个呈现图层,同样,也会有呈现图层树.呈现图层在第一次被添加进屏幕的时候就被添加进了呈现图层树.如果那之前尝试查询模型图层的呈现图层将会返回 nil.当然 CALayer 还有一个 -modelLayer 方法,呈现图层调用这个方法就会返回对应的模型图层,而模型图层调用则会返回本身:self;
所以上面的代码只要做小小的改动就可以实现需求了:[self.playingLayer.presentaionLayer hitTest:point]

## 显式动画<a id="sec-1-8" name="sec-1-8"></a>

### 属性动画<a id="sec-1-8-1" name="sec-1-8-1"></a>

先来了解一下 CAAnimation.CAAnimation类是所有动画对象的父类，负责控制动画的持续时间和速度等，是个抽象类，不能直接使用，应该使用它具体的子类.而属性动画类 CAPropertyAnimation 就是继承于 CAAnimation,同样,它也是一个抽象类,如果要创建动画对象,那就应该使用它的两个子类: CABasicAnimation 和 CAKeyframeAnimation.我们将在下面的一些具体的例子中了解 CAAnimation 的使用.

1.  CABasicAnimation (基本动画)

    对于基本的属性动画来说, CABasicAnimation 的使用非常简单:
    
        -(void)basicAnimation{
            CABasicAnimation *basic = [CABasicAnimation animation];
            basic.keyPath = @"backgroundColor";
            basic.toValue = (__bridge id)[UIColor randomColor].CGColor;
            basic.delegate = self;
            basic.duration = 2;
            [self.playingLayer addAnimation:basic forKey:nil];
        }
    
    可以看到背景颜色改变了,但是在动画后背景颜色又恢复到了原来的颜色. 其实用 CABasicAnimation 显示地给图层添加动画相比较于隐式动画而言只有费力不讨好,但是 CABasicAnimation 很好的揭示了隐式动画背后的机制.下面看 CAKeyFrameAnimation.

2.  CAKeyframeAnimation (关键帧动画)

    和 CABasicAnimation 类似,CAKeyframeAnimation 依然作用于单一的属性,唯一的区别就是 CAKeyframeAnimation 不限制于起始值: -fromValue 和结束值 -toValue. 简单来说就是 CAKeyframeAnimation 就是 CABasicAnimation 的一个加强版,能够在起始值和结束值之间加入更多的节点(关键帧).我们用一个相似的例子来说明.
    
        -(void)keyframeAnimation{
            CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animation];
            keyframe.keyPath = @"backgroundColor";
            keyframe.duration = 2;
            keyframe.values = @[
        
                                (__bridge id)[UIColor blueColor].CGColor,
                                (__bridge id)[UIColor randomColor].CGColor,
                                (__bridge id)[UIColor randomColor].CGColor,
                                (__bridge id)[UIColor blueColor].CGColor,
                                ];
            [self.playingLayer addAnimation:keyframe forKey:nil];
        }
    
    可以看到 playingLayer 的颜色发生着连续的变化.此例子中之所以以蓝色开头和结束是因为 CAKeyframeAnimation 不能以当前值作为第一帧,并且会在动画结束后突然恢复到起始值,所以为了动画的平滑,我们需要在开始和结束的关键帧匹配当前的属性值,例子中的蓝色为默认颜色.
    
    那么关键帧动画能不能应用于位移动画呢?答案是肯定的,只不过使用数组来描述动画运动并不直观,CAKeyframeAnimation 有另一种方式去指定动画:使用 CGPath. 
    通过 -setPath: 我们可以将一个 CGPath 路径赋值给 CAKeyframeAnimation ,然后调用 layer 的 -addAnimation:forKey: 方法就能将位移动画添加到 layer 中了:
    
        -(void)keyframe_path_animation{
        
        
            UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
            [bezierPath moveToPoint:CGPointMake(0, 150)];
            [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
        
            //draw the path using a CAShapeLayer
            CAShapeLayer *pathLayer = [CAShapeLayer layer];
            pathLayer.path = bezierPath.CGPath;
            pathLayer.fillColor = [UIColor clearColor].CGColor;
            pathLayer.strokeColor = [UIColor redColor].CGColor;
            pathLayer.lineWidth = 3.0f;
            [self.containerView.layer addSublayer:pathLayer];
        
            //add the ship
            CALayer *shipLayer = [CALayer layer];
            shipLayer.frame = CGRectMake(0, 0, 64, 64);
            shipLayer.position = CGPointMake(0, 150);
            shipLayer.contents = (__bridge id)[UIImage imageNamed: @"ship.png"].CGImage;
            [self.containerView.layer addSublayer:shipLayer];
        
            //create the keyframe animation
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"position";
            animation.duration = 4.0;
            animation.path = bezierPath.CGPath;
            [shipLayer addAnimation:animation forKey:nil];
        }
    
    飞机确实按照指定的路径移动了,但是飞机头没向着移动的方向??? 其实 CAKeyframeAnimation 还有一个 (NSString\*)rotaionMode 的属性,我们只要把它设置为常量 kCAAnimationRorateAuto. 图层就会根据曲线的曲率自动旋转了.你要做的就是将原始图片的方向调整为你需要的方向.当然也可以做 transform 旋转动画,但是这可能跟其他动画冲突.
    
        animation.rotationMode = kCAAnimationRotateAuto;

3.  CAAnimationGroup (动画组)

    CABasicAnimation和CAKeyframeAnimation仅仅作用于单独的属性，而CAAnimationGroup可以把这些动画组合在一起。
    关键属性: (NSArray<CAAnimation \*>) animations 
    
        -(void)groupAnimation{
            //create a path
            UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
            [bezierPath moveToPoint:CGPointMake(0, 150)];
            [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
        
            //draw the path using a CAShapeLayer
            CAShapeLayer *pathLayer = [CAShapeLayer layer];
            pathLayer.path = bezierPath.CGPath;
            pathLayer.fillColor = [UIColor clearColor].CGColor;
            pathLayer.strokeColor = [UIColor redColor].CGColor;
            pathLayer.lineWidth = 3.0f;
            [self.containerView.layer addSublayer:pathLayer];
        
            //add a colored layer
            CALayer *colorLayer = [CALayer layer];
            colorLayer.frame = CGRectMake(0, 0, 64, 64);
            colorLayer.position = CGPointMake(0, 150);
            colorLayer.backgroundColor = [UIColor greenColor].CGColor;
            [self.containerView.layer addSublayer:colorLayer];
        
            //create the position animation
            CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animation];
            animation1.keyPath = @"position";
            animation1.path = bezierPath.CGPath;
            animation1.rotationMode = kCAAnimationRotateAuto;
        
            //create the color animation
            CABasicAnimation *animation2 = [CABasicAnimation animation];
            animation2.keyPath = @"backgroundColor";
            animation2.toValue = (__bridge id)[UIColor redColor].CGColor;
        
            //create group animation
            CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
            groupAnimation.animations = @[animation1, animation2];
            groupAnimation.duration = 4.0;
        
            //add the animation to the color layer
            [colorLayer addAnimation:groupAnimation forKey:nil];
        }

### 过渡动画<a id="sec-1-8-2" name="sec-1-8-2"></a>

通过属性动画,我们能对 layer 一些可动画属性进行动画,然后如果要实现场景的切换(具体来说是在图层树中添加或者删除图层)动画,那就要使用到过渡动画.

1.  CATransition

    CATransition 同样是一个 CAAnimation 的子类,它的关键属性是 type 和 subtype,它们用来标识变换的效果.
    type:是一个 NSString 类型,有以下值:
    -   **kCATransitionFade:** 淡入淡出.
    -   **kCATransitionMoveIn:** 从外部进来,直接覆盖原来的图层.
    -   **kCATransitionPush:** 从外部进来,会有将原来的图层推走的效果
    -   **kCATransitionReveal:** 原来的图层离开,新的图层显现;
    
    后三种 type 类型都是有一个默认的动画方向的,动画方向由 subtype 控制:
    -   **kCATransitionFromBottom:** 
    -   **kCATransitionFromTop:** 
    -   **kCATransitionFromLeft:** 
    -   **kCATransitionFromRight:** 

## 图层时间<a id="sec-1-9" name="sec-1-9"></a>

动画需要时间,所以管理整个动画时间非常重要.Core Animation 管理时间的是 CAMediaTiming 协议.CALayer 和 CAAnimation 都遵守了这个协议.

### CAMediaTiming 概览<a id="sec-1-9-1" name="sec-1-9-1"></a>

-   **@property CFTimeInterval beginTime;:** 指定了动画开始之前的延迟时间.这个延迟时间从动画添加到可见图层那一刻开始测量,默认为 0(动画立刻执行).
-   **@property CFTimeInterval duration;:** 指定了一次迭代动画的持续时间.
-   **@property float repeatCount;:** 指定了动画迭代的次数,如果 duration 的值为 2.0,repeatCount 的值为 2.5,那么完整的动画时间就是 5.
-   **@property float speed;:** 指定了动画所属图层时间的速度,默认为 1.0,小于 1.0 会减速,反之则会加速,比如 duration 为 1 的动画, 在 speed 为 2.0 的情况下, 0.5 秒就会执行完毕,在 speed 为 0.5 的情况下, 2秒才会执行完毕.
-   **@property CFTimeInterval timeOffset;:** 指定动画在一次迭代的某个时间点开始,值为 0.0 ~ 1.0;比如设置 0.5 就是在动画的一次迭代的一半的时间开始动画,但是动画并不会在当次迭代结束,而是会到下一个迭代的 timeOffset 处结束;
-   **@property CFTimeInterval repeatDuration;:** 让动画重复迭代指定的时间.
-   **@property BOOL autoreverses;:** 自动重复迭代,如果设置为 YES,动画将会一直循环.
-   **@property(copy) NSString \*fillMode;:** 

### 层级时间<a id="sec-1-9-2" name="sec-1-9-2"></a>

每个 CALayer 和 CAAnimation 都有自己的本地时间,与本地时间有关的三个属性分别为 speed,beginTime 和 timeOffset.每个图层时间都是相对于父图层时间的.比如,如果我们在 appDelegate 对 window 对象做如下设置:

    self.window.layer.speed = 100;

我们会发现基于 window 视图的所有动画都被加速了(不包括 UIAlertView 这类独立于主窗口之外的视图动画).
对于层级时间属性的修改不会影响到父层级时间.

### 全局时间<a id="sec-1-9-3" name="sec-1-9-3"></a>

Core Animation 有一个全局时间,马赫时间.马赫时间在同一设备上的所有进程是全局的,在不同设备不全局.获取马赫时间的方法:

    CFTimeInterval time = CACurrentMediaTime();

马赫时间返回了设备自上次启动后的秒数,返回的值多少并不重要,重要的是它为所有的动画提供了一个相对的时间值.我们可以利用马赫时间来统筹各层级时间之间的关系.

### 时间转换<a id="sec-1-9-4" name="sec-1-9-4"></a>

CALayer 提供了方便的转换不同图层时间的方法:

    - (CFTimeInterval)convertTime:(CFTimeInterval)t fromLayer:(CALayer *)l; 
    - (CFTimeInterval)convertTime:(CFTimeInterval)t toLayer:(CALayer *)l;

### 时间属性的应用<a id="sec-1-9-5" name="sec-1-9-5"></a>

有时候会有在动画过程中对动画进行修改的需求,但是我们不可以通过保存 CAAnimation 的指针来达到修改动画的目的,因为动画被添加到图层的时候是做了拷贝的.所以对原始动画对象的操作不会影响到图层动画的效果.或者我们可以通过 -animationForKey: 来获取图层动画对象,然后修改?同样行不通,直接修改 animation 属性程序会跑出异常.
正确的做法应该是通过 CAMediaTiming 来对动画进行修改.我们知道 CAaLyer 遵守了 CAMediaTiming 协议.通过该协议我们可以修改正在进行的动画的一些值&#x2013;对 CALayer 进行修改.

1.  暂停,倒回和快进 (speed)

    上面已经提到图层的时间相关属性都是相对于父图层的,影响子图层但是不影响父图层.所以我们可以通过 speed 来实现动画的暂停,倒回和快进的功能.
    如果将图层的 speed 设置为 0,图层将会暂停任何添加到图层上的动画,大于 0 则会快进,小于 0 则会倒回动画