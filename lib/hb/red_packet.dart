/**
 *  Copyright (C) 2018-2024

 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maixs_utils/widget/paixs_widget.dart';
import 'package:sufenbao/hb/red_packet_controller.dart';
import 'package:sufenbao/hb/red_packet_painter.dart';
import 'package:sufenbao/util/custom.dart';

import '../util/global.dart';


OverlayEntry? entry;
void showRedPacket(BuildContext context, num commission, String platform, Function? onOpen){
  entry = OverlayEntry(builder: (context) => RedPacket(onFinish: _removeRedPacket, onOpen: onOpen,
    commission: commission, platform: platform,));
  Overlay.of(context)?.insert(entry!);
}

void _removeRedPacket(){
  entry?.remove();
  entry = null;
}


class RedPacket extends StatefulWidget {

  Function? onFinish;
  Function? onOpen;
  num? commission;
  String? max;
  String? platform;
  RedPacket({Key? key,this.onFinish, this.onOpen,
  this.commission, this.platform}) : super(key: key);



  @override
  _RedPacketState createState() => _RedPacketState();
}

class _RedPacketState extends State<RedPacket> with TickerProviderStateMixin{

  late RedPacketController controller = RedPacketController(tickerProvider: this);

  @override
  void initState() {
    super.initState();
    controller.onOpen = widget.onOpen;
    controller.onFinish = widget.onFinish;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0x88000000),
      child: GestureDetector(
        child: ScaleTransition(
          scale: Tween<double>(begin: 0, end: 1.0).animate(CurvedAnimation(parent: controller.scaleController, curve: Curves.fastOutSlowIn)),
          child: buildRedPacket(),
        ),
        onPanDown: (d) => controller.handleClick(d.globalPosition),
      ),
    );
  }

  Widget buildRedPacket() {
    return GestureDetector(
      onTapUp: controller.clickGold,
      child: CustomPaint(
        size: Size(1.sw, 1.sh),
        painter: RedPacketPainter(controller: controller),
        child: buildChild(),
      ),
    );
  }


  Widget buildChild() {
    Map data = getHbData(widget.commission, widget.platform);
    String min = data['min'];
    String max = data['max'];
    return AnimatedBuilder(
      animation: controller.translateController,
      builder: (context, child) => Container(
        padding: EdgeInsets.only(top: 0.3.sh * (1 - controller.translateCtrl.value)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PWidget.text('$APP_NAME发出的红包', [Color(0xFFF8E7CB), 16.sp]),
            SizedBox(height: 15.w,),
            PWidget.text('恭喜发财', [Color(0xFFF8E7CB), 18.sp]),
            SizedBox(height: 15.w,),
            PWidget.text('可拆$min元-$max元红包', [Color(0xFFF8E7CB), 14.sp]),
          ],
        ),
      ),
    );
  }
}


