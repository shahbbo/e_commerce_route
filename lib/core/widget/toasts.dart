import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class  Toasts{
  static void success(BuildContext context,String message) {
    CherryToast.success(
      backgroundColor : ColorManager.primary,
      title: Text(message,style: TextStyle(color: Colors.white),),
    ).show(context);
  }

  static void error(BuildContext context,String message) {
    CherryToast.error(
      backgroundColor : ColorManager.primary,
      title: Text(message,style: TextStyle(color: Colors.white),),
    ).show(context);
  }
}