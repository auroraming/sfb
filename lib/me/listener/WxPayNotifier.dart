/**
 *  Copyright (C) 2018-2024

 */
import 'package:flutter/cupertino.dart';
import 'package:fluwx/fluwx.dart';

//微信支付通知
class WxPayNotifier extends ValueNotifier<WeChatResponse> {
  WxPayNotifier(value) : super(value);
}

WxPayNotifier wxPayNotifier = new WxPayNotifier(WeChatResponse.create('onShareResponse',
    {'type':1}));
