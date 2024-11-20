import 'package:flutter/material.dart';
import 'package:sufenbao/custom/earning_page.dart';
import 'package:sufenbao/custom/grid_page.dart';
import 'package:sufenbao/custom/tranlink_page.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      // 监听 Tab 切换事件
      if (_tabController.indexIsChanging) {
        if (_tabController.index == 1) {
          // 如果是第3个 Tab，跳转到新页面
          Future.microtask(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LinkTransferPage()),
            );
            // 将 TabBar 的选项重置到第一个选项
            _tabController.index = 0;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, // 去除阴影
        backgroundColor: Colors.white,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              // 调整光标位置
              // contentPadding: EdgeInsets.symmetric(vertical: 0),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10), // 调整右侧整体靠左
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4), // 图标与文本的间距
                      child: Icon(Icons.search, color: Colors.black),
                    ),
                    Text(
                      '搜索',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0), // 设置 TabBar 的高度
          child: TabBar(
            controller: _tabController,
            isScrollable: false,
            indicatorPadding: EdgeInsets.all(0),
            // 控制下标的内边距
            labelPadding: EdgeInsets.all(0),
            // 控制标签的内边距
            indicatorSize: TabBarIndicatorSize.label,
            // 下划线宽度与文本一致
            indicatorColor: Color(0xFFFFC831),
            // 下划线颜色
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            // 选中 Tab 时文本颜色
            unselectedLabelColor: Color(0xFF666666),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
            ),
            // 未选中 Tab 时文本颜色
            // splashFactory: NoSplash.splashFactory, // 禁用涟漪效果
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            // 去除选中背景色
            tabs: [
              Tab(text: '精选'),
              Tab(text: '转链接'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          firstPage(),
          Center(child: Text('跳转')),
        ],
      ),
    );
  }

  /// 首页
  Widget firstPage() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            IconGridPage(),
            EarningsPage(),
          ],
        ),
      ),
    );
  }
}
