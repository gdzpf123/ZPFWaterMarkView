# ZPFWaterMarkView
对图片添加水印功能的类库，图片截图后不失真

WaterMarksView.h 是对图片加水印封装的一个视图控件，图片的添加水印，截图保存到本地都在这里了
具体用法如下

 WaterMarksView* marksView=[[WaterMarksView alloc] init];
 [self.contentsView addSubview:marksView];

 marksView.waterMarkImgsArr=[NSArray arrayWithArray:imgsArr]; //添加需要添加水印的底图，可传一张货多张
[marksView addNotificationObserve];   //控件添加对工具类操作发出的通知监听

WaterMarkToolsView.h 是控制WaterMarksView中的水印样式的工具类
具体用法如下
 toolsView=[[WaterMarkToolsView alloc] init];
 [self.contentsView addSubview:toolsView];
 toolsView.y=self.contentsView.height-toolsView.height;
 toolsView.delegate=self;
 
在需要使用时，将这两个类照上面代码实例化即可使用，实现相应代理方法即可完成图片加水印功能


![image](http://osuswbquh.bkt.clouddn.com/%E5%8A%A0%E6%B0%B4%E5%8D%B02.gif) 
