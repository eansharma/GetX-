import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Tabs.dart';
import 'NewsListPage.dart';



void main(){
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tabspage(),

    );
  }
}
