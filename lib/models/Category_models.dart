import 'package:flutter/material.dart';

class CategoryModels {
  final String name;
  final String iconPath;
  final Color boxColor;
  CategoryModels(
      {required this.name, required this.iconPath, required this.boxColor});
   static  List<CategoryModels> getCategory(){
    List<CategoryModels>  category= [];
    category.add(CategoryModels(name: "salade", iconPath: 'assets/icons/plate.svg', boxColor:  Colors.green));
    
    category.add(CategoryModels(name: "cake", iconPath: 'assets/icons/pancakes.svg', boxColor: const Color(0xffC58BF2)));
    
    category.add(CategoryModels(name: "Pie", iconPath: 'assets/icons/pie.svg', boxColor: Colors.black45));

    category.add(CategoryModels(name: "Smothies", iconPath: 'assets/icons/salmon-nigiri.svg', boxColor: Colors.orange));
    return  category;

      }
}
