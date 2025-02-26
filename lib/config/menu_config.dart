import '../models/menu_item_model.dart';

// 定义常量以提高可读性
const _introTitle = '引言';
const _preludeTitle = '序曲';
const _newChapterTitle = '新章';
const _turningPointTitle = '转折';
const _confrontationTitle = '对峙';
const _climaxTitle = '高潮';
const _finaleTitle = '终幕';
const _messageTitle = '寄语';

const _version30 = '3.0版本';
const _version31 = '3.1版本';
const _version32 = '3.2版本';
const _version33 = '3.3版本';
const _version42to45 = '4.2~4.5版本';
const _version46 = '4.6版本';
const _version47to49 = '4.7~4.9版本';
const _version50 = '5.0版本';

const _routeZS1 = '/zs1';
const _routeZS2 = '/zs2';

// 菜单项配置
const menuItems = [
  MenuItem(title: _introTitle),
  MenuItem(title: _preludeTitle),
  MenuItem(title: _newChapterTitle),
  MenuItem(
    title: _turningPointTitle,
    children: [
      MenuItem(title: _version30, routeName: _routeZS1),
      MenuItem(title: _version31, routeName: _routeZS2),
      MenuItem(title: _version32),
      MenuItem(title: _version33),
    ],
  ),
  MenuItem(
    title: _confrontationTitle,
    children: [
      MenuItem(title: _version42to45, routeName: _routeZS1),
      MenuItem(title: _version46, routeName: _routeZS2),
      MenuItem(title: _version47to49),
      MenuItem(title: _version50),
    ],
  ),
  MenuItem(title: _climaxTitle),
  MenuItem(title: _finaleTitle),
  MenuItem(title: _messageTitle),
];
