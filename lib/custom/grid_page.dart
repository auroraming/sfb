import 'package:flutter/material.dart';

class IconGridPage extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'icon': 'assets/images/custom/menu/tb.png', 'label': '淘宝'},
    {'icon': 'assets/images/custom/menu/jd.png', 'label': '京券'},
    {'icon': 'assets/images/custom/menu/pdd.png', 'label': '多券'},
    {'icon': 'assets/images/custom/menu/dy.png', 'label': '抖券'},
    {'icon': 'assets/images/custom/menu/wei.png', 'label': '唯券'},
    {'icon': 'assets/images/custom/menu/ele.png', 'label': '饿了么'},
    {'icon': 'assets/images/custom/menu/meituan.png', 'label': '美团'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white, // 设置背景颜色
        child: SizedBox(
          height: 212, // 指定高度
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(), // 禁止滑动
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // 每行4个图标
              mainAxisSpacing: 0, // 上下间距
              crossAxisSpacing: 10, // 左右间距
              childAspectRatio: 1, // 宽高比
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(item['icon']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    item['label']!,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        ));
  }
}
