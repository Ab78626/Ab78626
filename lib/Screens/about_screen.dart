import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Model/RecipeModel.dart';

class AboutScreen extends StatelessWidget {
    const AboutScreen({super.key,});

  @override
  Widget build(BuildContext context) {

    //RecipeModel recipeModel = RecipeModel("recipeimg", "title", 433);

    return Scaffold(

       body: ListView(
         reverse: true,
         children: [
           Column(
             children: [
               myCard(RecipeModel("recipeimg", "escrovitch", 32.0)),
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
  Column myCard(RecipeModel recipemodel) {
    return Column(

      children: [
        Card(
          color: CupertinoColors.systemBackground,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: const SizedBox(
              width:140, // Set the desired width
              height: 90, // Set the desired height
              //child: CircleAvatar(
                child: Icon(Icons.emoji_food_beverage,size: 60.0,),
             // ),
            ),
            title: Text(
              recipemodel.Recipetitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              recipemodel.RecipeImage,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            trailing: const Icon(Icons.cached_rounded),
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

