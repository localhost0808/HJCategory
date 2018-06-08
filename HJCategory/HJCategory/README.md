# HJCategory-本框架由凌菲网 Harry 提供

我们开发者到底得罪了谁，为什么会有这么长的方法名。在我们创建视图对象时，冗长的代码，定义并不多的内容，大量重复性苦力。
我们到底是要写代码，还是搬运代码。既然搬运何不用更便捷的搬运。
UIView *view = [[UIView alloc] init];
view.frame = CGRectMake(100,100,100,100);
view.backgroundColor = [UIColor redColor];
[view addGestureRecoginzer:get];
[self.view addSubView:view];
.....
也许还有很多。

UIView+Construction 我只是一个类别，我是C和OC的融合体。

UIView *view = viewCreate().viewBroundColor[UIColor redColor].viewAlpha(5.f).viewAddGestureRecoginzer:get.viewAddSuperView(self.view);
.......
你还可以写的更多。更简便

UIView *view = viewCreateParame(color,frame,self.view,get,............);

甚至我们还有自适应的圆角属性。


UI、NS等一些常用类类别，简化判断、减少代码。在维护中能用到的，有些可以代替基类


HJCategoryHeader.h 可以导入全部类别 

有些依赖第三方库，没有导入第三方库的情况下，编译器也不会编译，不会报错。充分降低依赖性。

