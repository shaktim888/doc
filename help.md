#### 工具介绍
可通过本工具批量产出换皮游戏，还具有自动生成icon,宣传图、启动图、游戏描述、代码加密混淆等功能。

#### 技术方案
本工具使用node-js实现，利用了 GraphicsMagick 和 ImageMagick 库处理图像,结合jenkins自动化
实现 编码 → 构建 → 集成 → 测试 → 交付 的流程化

#### 目录结构介绍

FakeAppToolv2(换皮工具)
├──autoGenDescription（生成描述）
├──autoGenIcon （生成icon)
├──autoGenScreenShot (自动宣传图 ==》调用 AutoShowTool)
├──autoMakeLaunchScreen （自动启动图）
├──output （输出）
├──runtime （自动截图启动程序）
├──Main.js（入口）
├──FakeAppTool.js（各组件集成）
├──utils.js （工具类）
├──outGame.sh （jenkins调用shell脚本）
├──define.js （各游戏风格配置表）
└──config.js （使用者配置参数）

AutoShowTool(宣传图工具)
├──codeAndRes （各风格资源）
├──cfg （坐标与修改配置）
├──input （输入）
├──output （输出）
├──pngquant （压缩图片工具）
├──temp （临时存放）
├──start.js  （入口）
├──screenshot.js （处理截图）
└──utils.js （工具类）

AutoGenIcon(icon工具)
├──res （资源）
├──shareRes （公共资源）
├──index.js （入口）
└──utils.js （工具类）

Game(游戏存放目录)
  └──ProjectName（游戏文件夹）
      ├──Arts （游戏换皮资源）
      ├──demo（游戏代码）
      ├──UI （cocosstudio UI)
      └──project.json (路径映射与加密配置)

ShareRes(公共资源存放)
├──bg （背景）
└──role （人物）






