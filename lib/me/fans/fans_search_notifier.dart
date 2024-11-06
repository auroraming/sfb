/**
 *  Copyright (C) 2018-2024

 */
import 'package:flutter/cupertino.dart';

//
class FansSearchNotifier extends ValueNotifier<String> {
  FansSearchNotifier(value) : super(value);
}

FansSearchNotifier fansSearchNotifier = new FansSearchNotifier('');
