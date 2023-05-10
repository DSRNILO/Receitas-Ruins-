import 'package:flutter/material.dart';

import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../models/models.dart';
import 'explore_screen.dart';

class RecipesScreen extends StatelessWidget {
  //1
  final exploreService = MockFooderlichService();
  RecipesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    //2
    return FutureBuilder(
      //3
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        //4
        if (snapshot.connectionState == ConnectionState.done) {
          return RecipesGridView(recipes: snapshot.data ?? []);
        } else {
          //6
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
