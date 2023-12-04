import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_flutter/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);
  bool toggleMealFavoriteStatus(Meal meal) {
    // check meal is favorite
    final mealIsFavorite = state.contains(meal);

    // remove favorite, if false then (where => false) to remove
    // if have to remove, if not to add :V
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
    // state = [];
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier());
