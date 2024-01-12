import 'package:flutter/material.dart';

class AppBarContents{
  Container appbarBuildContainer() {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.orange.shade600,
                Colors.orange.shade800,
                Colors.orange.shade800,
                Colors.orange.shade800,
                Colors.orange.shade600,
                Colors.orange.shade400
              ]
          )
      ),
    );
  }
}