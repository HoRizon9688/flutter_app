import 'package:flutter/material.dart';

// 点击导航区域传递的数据结构：包含 导航名称、图片、点击事件
class IndexNavigatorItem {
  final String title;
  final String imageUrl;
  final Function(BuildContext contenxt) onTap;
  IndexNavigatorItem(this.title, this.imageUrl, this.onTap);
}

List<IndexNavigatorItem> indexNavigatorItemList = [
  IndexNavigatorItem('自然风光', 'static/images/natural_scenery.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('主题乐园', 'static/images/amusement_park.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('郊外露营', 'static/images/camping.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('名胜古迹', 'static/images/places_of_interest.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
];
