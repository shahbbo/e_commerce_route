import 'package:e_commerce_route/features/app_layout/presentation/cubit/app_cubit.dart';
import 'package:e_commerce_route/features/auth/presentation/screens/sign_up/cubit/sign_up_cubit.dart';
import 'package:e_commerce_route/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:e_commerce_route/features/wishlist_screen/presentation/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/my_bloc_observer.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/routes_manager/routes.dart';
import 'core/helpers/local/cache_helper.dart';
import 'di/di.dart';
import 'features/auth/presentation/screens/sign_in/cubit/sign_in_cubit.dart';
import 'features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'features/home_screen/presentation/cubit/home_tab_cubit.dart';
import 'features/products_screen/presentation/cubit/product_screen_cubit.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  configureDependencies();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => getIt<SignInCubit>()),
        BlocProvider(create: (context) => getIt<SignUpCubit>()),
        BlocProvider(create: (context) => getIt<HomeScreenCubit>()..getAllCategoriesAndBrands() , lazy: false),
        BlocProvider(create: (context) => getIt<ProductScreenCubit>()..getAllProducts()..getWishList(), lazy: false),
        BlocProvider(create: (context) => getIt<CartScreenCubit>()..getCart(), lazy: false),
        BlocProvider(create: (context) => getIt<WishListScreenCubit>()..getWishList(), lazy: false),
        BlocProvider(create: (context) => getIt<ProductDetailsCubit>()),
      ],
      child: MainApp()));
}

class MainApp extends StatelessWidget {
   const MainApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashScreenRoute,
      ),
    );
  }
}
