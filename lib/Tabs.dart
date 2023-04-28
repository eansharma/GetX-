import 'package:flutter/material.dart';
import 'package:getx/NewsListPage.dart';
import 'package:getx/rest.dart';



class Tabspage extends StatefulWidget {
  const Tabspage({Key? key}) : super(key: key);

  @override
  State<Tabspage> createState() => _TabspageState();
}

class _TabspageState extends State<Tabspage> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("This is post and get methods"),

            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text("Get Api"),
                ),
                Tab(
                  child: Text("Post Api"),
                )
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(children: [
                  HomePage(),
                  RestaurantPage(),

                ]),
              )
            ],
          ),




        )

    );
  }
}

