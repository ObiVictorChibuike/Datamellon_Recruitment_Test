import 'package:flutter/material.dart';

class Constants{
  static final List<PopupMenuItem> popUp = [
    PopupMenuItem(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(height: 20,),
        Text("Year", style: TextStyle(color: Colors.black, fontSize: 16)),
        Divider()
      ],
    ),),
    PopupMenuItem(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(height: 10,),
        Text("Date", style: TextStyle(color: Colors.black, fontSize: 16)),
        Divider()
      ],
    ),),
  ];
}