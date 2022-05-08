import 'package:flutter/material.dart';

class CommonTag extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? backgroundColor;

  const CommonTag.origin(
    this.title, {
    Key? key,
    this.color = Colors.black,
    this.backgroundColor = Colors.grey,
  }) : super(key: key);

  factory CommonTag(String title) {
    switch (title) {
      case '亲子同乐':
        return CommonTag.origin(
          title,
          color: Colors.blue,
          backgroundColor: Colors.red[50],
        );
      case '可订今日':
        return CommonTag.origin(
          title,
          color: Colors.red,
          backgroundColor: Colors.blue[50],
        );
      case '可订明日':
        return CommonTag.origin(
          title,
          color: Colors.green,
          backgroundColor: Colors.green[50],
        );
      case '正在拼团':
        return CommonTag.origin(
          title,
          color: Colors.red,
          backgroundColor: Colors.red[50],
        );
      default:
        return CommonTag.origin(title,
            color: Colors.green,
            backgroundColor: Colors.yellow[50]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 10,
          color: color,
        ),
      ),
    );
  }
}
