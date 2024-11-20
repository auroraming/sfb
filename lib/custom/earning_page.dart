import 'package:flutter/material.dart';

class EarningsPage extends StatefulWidget {
  @override
  _EarningsPageState createState() => _EarningsPageState();
}

class _EarningsPageState extends State<EarningsPage> {
  // 模拟收益数据（可以通过接口动态获取）
  int todayEarnings = 12;
  double monthlyEarnings = 333.3;
  int lastMonthEarnings = 10000;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '我的收益',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                TextButton(
                  onPressed: () {
                    // 跳转到累计收益页面逻辑
                    print("点击事件");
                  },
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(
                        Colors.transparent), // 鼠标悬浮时无背景色
                  ),
                  child: Text(
                    '累计收益 >',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          // 收益数据展示
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // 数据行
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildEarningsItem('$todayEarnings', '今日预估收益'),
                        _buildEarningsItem('$monthlyEarnings', '本月预估收益'),
                        _buildEarningsItem('$lastMonthEarnings', '上月预估收益'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 提示文字
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info_outline, color: Colors.grey, size: 16),
                SizedBox(width: 8),
                Text(
                  '每月25~31号可提现上月结算收益',
                  style: TextStyle(fontSize: 14, color: Color(0xFF3097FF)),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // 模拟数据更新按钮
          // ElevatedButton(
          //   onPressed: _updateEarningsData,
          //   child: Text('更新收益数据'),
          // ),
        ],
      ),
    );
  }

  /// 构建收益数据项
  Widget _buildEarningsItem(String value, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: Colors.black),
        ),
      ],
    );
  }

  // 模拟刷新收益数据
  void _updateEarningsData() {
    setState(() {
      todayEarnings += 5; // 增加今日收益
      monthlyEarnings += 20.0; // 增加本月收益
      lastMonthEarnings += 100; // 增加上月收益
    });
  }
}
