# Web Ace - 白金版

## 项目亮点
- **白金主题设计**：采用#D4AF37为主色调，搭配白色背景，呈现高端质感
- **响应式布局**：左侧功能面板（20%）+ 右侧矩阵布局（60%）
- **动态交互效果**：所有组件均带有平滑动画和阴影效果
- **游戏快捷入口**：右侧第7个方块（黄金位置）直达2048游戏

## 美术规范
1. **颜色方案**
   - 主色: #D4AF37 (白金)
   - 辅色: #FFFFFF (纯白)
   - 背景色: #F8F9FA (浅灰)

2. **组件规范**
   - 面板圆角: 20px
   - 通用阴影: X:2 Y:4 Blur:15 Opacity:0.15
   - 交互动画: 300ms缓动动画

3. **图标规范**
   - 功能图标尺寸: 40px
   - 文本图标间距: 10px

## 核心交互
```dart
// 特殊方块样式逻辑
index == 6 ? 
  // 游戏入口特殊样式
  BoxDecoration(
    gradient: goldGradient,
    border: Border.all(width: 2, color: Colors.white)
  :
  // 常规样式  
  BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15))
```

## 用法示例

### ItemConfig 用法

`ItemConfig` 是一个抽象类，定义了一个项目的配置。可以通过 `ItemConfigs` 类中的静态方法来获取具体的项目配置，例如 `item1` 方法：

```dart
// 获取 item1 的配置
ItemConfig config = ItemConfigs.item1(context);

// 使用配置
print(config.text); // 输出 '32123'
config.onTap(); // 执行点击事件
```

### ItemConfig 支持的配置

`ItemConfig` 支持以下配置：

- `text` (String): 项目文本。
- `image` (ImageProvider?): 项目图像。
- `onTap` (VoidCallback): 点击事件回调。
- `style` (ItemStyle): 项目样式，包括 `activeColor`、`inactiveColor` 和 `borderWidthFactor`。
- `textColor` (Color): 文本颜色。
- `child` (Widget?): 子组件。
- `imageSize` (double?): 图像大小。
- `imageAlignment` (Alignment?): 图像对齐方式。
- `textSize` (double?): 文本大小。
- `textAlignment` (Alignment?): 文本对齐方式。

### PanelConfig 用法

`PanelConfig` 是一个抽象类，定义了一个面板的配置。可以通过 `PanelConfigs` 类中的静态属性来获取具体的面板配置，例如 `panel2` 属性：

```dart
// 获取 panel2 的配置
PanelConfig config = PanelConfigs.panel2;

// 使用配置
print(config.text); // 输出 'Analytics'
config.onTap(); // 执行点击事件
```

### PanelConfig 支持的配置

`PanelConfig` 支持以下配置：

- `text` (String): 面板文本。
- `image` (ImageProvider?): 面板图像。
- `onTap` (VoidCallback): 点击事件回调。
- `style` (PanelStyle): 面板样式，包括 `baseColor`、`borderRadiusFactor` 和 `shadowOpacity`。
- `textColor` (Color): 文本颜色。
- `child` (Widget?): 子组件。
- `imageSize` (double?): 图像大小。
- `imageAlignment` (Alignment?): 图像对齐方式。
- `textSize` (double?): 文本大小。
- `textAlignment` (Alignment?): 文本对齐方式。
 // 定义一个名为panel2的PanelConfig对象
  static final panel2 = PanelConfig(
    // 设置文本内容
    text: 'Dashboard Pro',
    // 设置图片
    image: const AssetImage('assets/images/item_7.png'),
    // 设置点击事件
    onTap: () => debugPrint('Dashboard Panel tapped'),
    // 设置样式
    style: const PanelStyle(
      // 设置基础颜色
      baseColor: Colors.blueAccent,
      // 设置圆角因子
      borderRadiusFactor: 1.0,
      // 设置阴影透明度
      shadowOpacity: 0.5,
    ),
    // 设置文本颜色
    textColor: Colors.amber,
    // 设置文本大小
    textSize: _defaultTextSize,
    // 设置文本对齐方式
    textAlignment: const Alignment(0.8, 0),
    // 设置文本偏移量
    textOffset: const Offset(-40, 0),
    // 设置图片大小
    imageSize: _defaultImageSize,
    // 设置图片对齐方式
    imageAlignment: const Alignment(0, 0),
    // 设置图片偏移量
    imageOffset: const Offset(-60, 0),
  );
## 资源文件
flutter:
  assets:
    - assets/images/se1.png
    - assets/images/panel1_bg.png
    - assets/images/panel2_bg.png
    - assets/images/item_1.png
    - assets/images/item_2.png
    # ... 继续添加item_3.png到item_12.png