import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Screens/about_screen.dart';
import 'Screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late TabController tabController;
  TextEditingController searchController=TextEditingController();


    @override
    void initState() {
      super.initState();
      tabController = TabController(length: 2, vsync: this);
    }

    @override
    void dispose() {
        tabController.dispose();
        searchController.dispose();
      // TODO: implement dispose
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(

        appBar: AppBar(
          title: Container(height: 40,child: TextField(controller: searchController,decoration: const InputDecoration(hintText: 'Search....',prefixIcon:Icon(Icons.search,color: Colors.lightBlue,),hintStyle: TextStyle(color: Colors.black),filled:true,fillColor:Colors.white,contentPadding:EdgeInsets.symmetric(vertical: 10),border: OutlineInputBorder(borderSide:BorderSide(color: Colors.red),borderRadius: BorderRadius.all(Radius.circular(10)))),),),
           bottom: TabBar( controller: tabController,tabs: const [Tab(icon:Icon(Icons.home),),Tab(icon: Icon(Icons.settings),),]),

      ),

      body: Padding(padding: const EdgeInsets.all(16.0),

      child:TabBarView(controller: tabController, children:const [ AboutScreen(), HomeScreen()],),


      ),
      );
    }


}



