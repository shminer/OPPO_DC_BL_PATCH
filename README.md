## 20220225
第一版发布，具备开机自动启用DC调光

## 20220226 未发布
* Q:经测试，有人反应色彩泛白，色温及护眼模式不能启用。
* 色彩泛白后续可对画面伽马进行修正，包括绿屏问题。
* 色温及护眼模式不能启用主要由于系统检测到了开启HBM所以主动关闭了。





## TODO(从上到下优先级越来越低)：
1、DSI CMD调整gamma使得画面接近OOS11：
	分两步进行，第一步先测试dimming cmd（DSICMD从OOS11源码获取），降低绿色，第二部测试curver，提升画面对比（通过现有dsicmd进行测试）。
	
2、patch使用二进制方式而不是IDA，这样大幅增强对各个系统的支持程度。

3、尝试开发xposed模块或者app启用服务，增加更多节点判定，对整个oppo系进行支持

x、尝试找到方法解决和HBM冲突问题
