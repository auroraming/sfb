import 'package:flutter/material.dart';

class LinkTransferPage extends StatefulWidget {
  @override
  _LinkTransferPageState createState() => _LinkTransferPageState();

  final String hint = '''
  领无门槛🧧+下拉200-20卷
  https://u.jd.com/IGe9iSW
  零食5️折卷 先领了❗️
  https://u.jd.com/IgehhlH
  服饰5️折+3️折券都领❗️
  https://u.jd.com/Ige5kOe
  ⬇️服饰总范围（可自行选）
  https://u.jd.com/Igee7WP
  ''';
}

class _LinkTransferPageState extends State<LinkTransferPage> {
  // 当前选中的切换按钮（0：智能转链，1：生成短链）
  int _selectedTab = 0;

  // 商品列表数据
  List<Map<String, String>> _items = [
    {
      'title': '商品标题1',
      'profit': '\$14.98',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': '商品标题2',
      'profit': '\$20.00',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': '商品标题3',
      'profit': '\$30.00',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // 设置背景色
      appBar: AppBar(
        title: Text('转链'),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, size: 24),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: InkWell(
                onTap: () {},
                child: Icon(Icons.refresh, size: 24),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 顶部描述
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.white,
              child: Row(
                children: [
                  Icon(Icons.info, color: Colors.orange),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '将复制链接转换成自己专属的推广链接后，分享给好友或通过朋友圈转链商品，返利佣金入您账户。',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),

            // 切换按钮
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedTab = 0;
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor:
                          _selectedTab == 0 ? Colors.white : Colors.black,
                      backgroundColor: _selectedTab == 0 ? Colors.blue : null,
                    ),
                    child: Text(
                      '智能转链',
                      style: TextStyle(),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedTab = 1;
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor:
                          _selectedTab == 1 ? Colors.white : Colors.black,
                      backgroundColor: _selectedTab == 1 ? Colors.blue : null,
                    ),
                    child: Text('生成短链'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),

            // 转链结果
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 8),
                      Text('转链成功', style: TextStyle(fontSize: 16)),
                      Spacer(),
                      Icon(Icons.delete, color: Colors.grey),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      minLines: 5,
                      maxLines: 100,
                      decoration: InputDecoration(
                        hintText: widget.hint,
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '转链成功1条，失败0条',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text('重新转换链接'),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            '一键复制',
                          ),
                          style: ButtonStyle(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),

            // 商品列表
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '以下商品成功转链',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _items.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      return ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(item['image']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(item['title']!),
                        subtitle: Text('转链收益：${item['profit']}'),
                        trailing: TextButton(
                          onPressed: () {
                            // 处理复制链接逻辑
                          },
                          child: Text(
                            '复制链接',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
