import 'package:flutter/material.dart';

import '../Util/toast_utils.dart';

class UserDashboardPage extends StatefulWidget {
  @override
  _UserDashboardPageState createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  // 定义动态状态变量
  double balance = 0.00; // 余额
  int todayEarnings = 12; // 今日预估收益
  double monthEarnings = 333.3; // 本月预估收益
  int lastMonthEarnings = 10000; // 上月预估收益

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFBFB), // 设置背景颜色
      body: Column(
        children: [
          // 顶部头像和标题部分
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // 头像
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/images/custom/me/me.png'), // 替换为实际头像
                ),
                SizedBox(width: 16),
                // 用户信息
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '快要吃饭了',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          '邀请码：123456',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            ToastUtils.showToastBOTTOM('复制成功');
                          },
                          child: Icon(Icons.copy, size: 16, color: Colors.grey),
                        )
                        // IconButton(
                        //     icon: Icon(Icons.copy),
                        //     size: 16,
                        //     color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 余额和提现部分
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue, // 背景颜色
              borderRadius: BorderRadius.circular(16), // 圆角半径
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 余额
                    Text(
                      '余额 ${balance.toStringAsFixed(2)} 元',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    // 提现按钮
                    ElevatedButton(
                      onPressed: _handleWithdraw, // 提现按钮点击事件
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('立即提现'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // 收益统计
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildEarningsInfo(todayEarnings.toString(), '今日预估收益'),
                    _buildEarningsInfo(monthEarnings.toString(), '本月预估收益'),
                    _buildEarningsInfo(lastMonthEarnings.toString(), '上月预估收益'),
                  ],
                ),
              ],
            ),
          ),

          // 功能列表
          Expanded(
              child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16), // 内边距
            children: _buildListTile({
              "1": {'订单明细': Icons.list, '订单找回': Icons.search},
              "2": {
                '分享APP': Icons.share,
                '我的用户': Icons.person,
                '积分商城': Icons.shopping_cart
              },
              "3": {'新手教程': Icons.school}
            }),
          )),
        ],
      ),
    );
  }

  // 构建收益统计项
  Widget _buildEarningsInfo(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ],
    );
  }

  // 构建功能列表项
  List<Widget> _buildListTile(Map<String, Map<String, IconData>> data) {
    return data.entries.map((entry) {
      return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 16), // 列表项之间的分隔线
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
          ),
          ...entry.value.entries.map((item) {
            var title = item.key;
            var icon = item.value;
            return ListTile(
              leading: Icon(icon, color: Colors.blue),
              title: Text(title),
              trailing:
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () {
                // 点击事件处理
                _handleItemTap(title);
              },
            );
          }).toList(),
        ]),
      );
    }).toList();
  }

  // 提现按钮事件处理
  void _handleWithdraw() {
    setState(() {
      balance = 0.0; // 更新余额
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('提现成功！')),
    );
  }

  // 列表项点击事件处理
  void _handleItemTap(String title) {
    ToastUtils.showToastBOTTOM('点击了$title');
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('点击了$title')),
    // );
  }
}
