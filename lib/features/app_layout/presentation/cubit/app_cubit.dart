import 'package:e_commerce_route/features/wishlist_screen/presentation/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home_screen/presentation/home_screen.dart';
import '../../../products_screen/presentation/products_screen.dart';
import '../../../profile_screen/presentation/profile_tab.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  int currentIndex = 0;
  List<Widget> tabs = [
    HomeScreen(),
    ProductsScreen(),
    WishListScreen(),
    const ProfileScreen(),
  ];
  void changeBottomNavBarIndex(int selectedIndex) {
    emit(AppInitialState());
    currentIndex = selectedIndex ;
    emit(ChangeBottomNavBarIndexState());
  }
}