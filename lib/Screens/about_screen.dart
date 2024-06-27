import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Model/RecipeModel.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //RecipeModel recipeModel = RecipeModel("recipeimg", "title", 433);

    return Scaffold(

       body: ListView(
         reverse: true,
         children: [
           Column(
             children: [
               myCard( RecipeModel("recipeimg", "escrovitch", 32.0)),
               myCard(RecipeModel("bammyimg", "curry shrimp",20.0)),
               myCard(RecipeModel("currygoat","currygoat",90.0)),
               myCard(RecipeModel("currychicken","currychicken",90.0)),
             ],
           ),

         ],

     ),

    );

  }
SingleChildScrollView singleChildScrollView(){
    return SingleChildScrollView(
      child: Column(
        children: [
          myCard(RecipeModel("recipeimg", "po", 32.0)),
          myCard(RecipeModel("bammyimg", "der",20.0)),
          myCard(RecipeModel("currygoat","lo",90.0)),
          myCard(RecipeModel("currychicken","re",90.0)),

        ],
      ),
    );
}
  Column myCard(final RecipeModel recipemodel) {

    return Column(

      children: [
        Card(
          elevation: 50,
          shadowColor: Colors.black,
          color: Colors.greenAccent[100],
          child: SizedBox(
            width: 600,
            height: 200,
            child: Padding(padding: const EdgeInsets.all(20.0),
            child: Column(
            children: [

              CircleAvatar(backgroundColor: Colors.green,radius: 80,child: const CircleAvatar(backgroundImage: NetworkImage("re" ),radius: 100,),)],

            ),),
          ),
        ),
        const Divider(

          thickness: 1,
          height: 10,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
 }
}


