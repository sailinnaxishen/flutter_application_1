# Flutter Application

这是一个 Flutter 应用程序，包含一个版本导航系统。左侧菜单栏固定，右侧内容区域根据选择的版本切换展示页。

## 项目结构

```
lib/
├── app/
│   ├── app.dart
│   ├── routes.dart
│   ├── theme.dart
├── components/
│   ├── dynamic_content.dart
│   ├── navigation/
│   │   ├── navigation_panel.dart
│   │   ├── side_menu.dart
│   │   └── menu_item.dart
├── config/
│   └── menu_config.dart
├── models/
│   └── menu_item_model.dart
├── pages/
│   ├── zs1.dart
│   └── zs2.dart
├── state/
│   └── navigation_state.dart
└── main.dart
```

## 主要功能

- 左侧菜单栏固定，方便随时切换不同版本。
- 右侧内容区域根据选择的版本切换展示页。
- 菜单项支持子菜单，子菜单项可以绑定不同的页面。

## 如何运行

1. 确保你已经安装了 Flutter 环境。
2. 克隆此仓库到本地。
3. 在项目根目录运行 `flutter pub get` 安装依赖。
4. 运行 `flutter run` 启动应用程序。

## 贡献

欢迎提交 PR 和 Issue 来帮助改进此项目。
