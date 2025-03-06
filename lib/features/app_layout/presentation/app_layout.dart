import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import 'cubit/app_states.dart';
import 'cubit/app_cubit.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  List<String> tabsIcons = [
    IconsAssets.home,
    IconsAssets.products,
    IconsAssets.withList,
    IconsAssets.profile,
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          extendBody: false,
          body: cubit.tabs[cubit.currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: PopScope(
                canPop: cubit.currentIndex != 0 ? false : true,
                onPopInvoked: (result) {
                  if (cubit.currentIndex != 0) {
                    cubit.changeBottomNavBarIndex(0);
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  onTap: (value) => cubit.changeBottomNavBarIndex(value),
                  backgroundColor: ColorManager.primary,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: ColorManager.primary,
                  unselectedItemColor: ColorManager.white,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: List.generate(
                    tabsIcons.length,
                    (index) => CustomBottomNavBarItem(tabsIcons[index]),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;

  CustomBottomNavBarItem(
    this.iconPath,
  ) : super(
          label: '',
          icon: ImageIcon(
            AssetImage(iconPath),
            color: ColorManager.white,
          ),
          activeIcon: CircleAvatar(
            backgroundColor: ColorManager.white,
            child: ImageIcon(
              AssetImage(iconPath),
              color: ColorManager.primary,
            ),
          ),
        );
}
