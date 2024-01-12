import 'package:flutter/material.dart';
import 'package:motionminglee/features/service/user_service.dart';
class IconButtons{
  late BuildContext context;
  UserService userService = UserService();
  IconButton buildIconButton(Icon icon) {
    return IconButton(
      icon: icon,
      onPressed: () {

        //Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
      },
    );
  }

}

