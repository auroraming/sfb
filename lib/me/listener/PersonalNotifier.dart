/**
 *  Copyright (C) 2018-2024

 */
import 'package:flutter/cupertino.dart';

//刷新个人中心
class PersonalNotifier extends ValueNotifier<bool> {
  PersonalNotifier(value) : super(value);
}


PersonalNotifier personalNotifier = new PersonalNotifier(false);