// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/helpers/remote/dio_helper.dart' as _i259;
import '../features/auth/data/remote_data_source/auth_remote_data_source.dart'
    as _i370;
import '../features/auth/data/remote_data_source/auth_remote_data_source_impl.dart'
    as _i103;
import '../features/auth/data/repo/auth_repository_impl.dart' as _i401;
import '../features/auth/domain/repo/auth_repository.dart' as _i981;
import '../features/auth/domain/use_case/login_use_case.dart' as _i876;
import '../features/auth/domain/use_case/signup_use_case.dart' as _i855;
import '../features/auth/presentation/screens/sign_in/cubit/sign_in_cubit.dart'
    as _i203;
import '../features/auth/presentation/screens/sign_up/cubit/sign_up_cubit.dart'
    as _i134;
import '../features/cart/data/remote_data_source/cart_remote_data_source.dart'
    as _i1038;
import '../features/cart/data/remote_data_source/cart_remote_data_source_impl.dart'
    as _i143;
import '../features/cart/data/repository/cart_repository_impl.dart' as _i322;
import '../features/cart/domain/repository/cart_repository.dart' as _i491;
import '../features/cart/domain/use_cases/delete_item_in_cart_use_case.dart'
    as _i559;
import '../features/cart/domain/use_cases/get_cart_use_case.dart' as _i1030;
import '../features/cart/domain/use_cases/update_count_in_cart_use_case.dart'
    as _i274;
import '../features/cart/presentation/cubit/cart_screen_cubit.dart' as _i901;
import '../features/home_screen/data/remote_data_source/home_remote_data_source.dart'
    as _i1036;
import '../features/home_screen/data/remote_data_source/home_remote_data_source_impl.dart'
    as _i485;
import '../features/home_screen/data/repo/home_repository_impl.dart' as _i264;
import '../features/home_screen/domain/repo/home_repository.dart' as _i299;
import '../features/home_screen/domain/use_case/get_all_brands_use_case.dart'
    as _i749;
import '../features/home_screen/domain/use_case/get_all_categories_use_case.dart'
    as _i350;
import '../features/home_screen/presentation/cubit/home_tab_cubit.dart'
    as _i247;
import '../features/product_details/data/remote_data_source/product_details_remote_data_source.dart'
    as _i144;
import '../features/product_details/data/remote_data_source/product_details_remote_data_source_impl.dart'
    as _i761;
import '../features/product_details/data/repo/product_details_repository_impl.dart'
    as _i658;
import '../features/product_details/domain/repo/product_details_repository.dart'
    as _i636;
import '../features/product_details/domain/use_cases/product_details_use_case.dart'
    as _i487;
import '../features/product_details/presentation/cubit/product_details_cubit.dart'
    as _i666;
import '../features/products_screen/data/remote_data_source/products_remote_data_source.dart'
    as _i998;
import '../features/products_screen/data/remote_data_source/products_remote_data_source_impl.dart'
    as _i195;
import '../features/products_screen/data/repo/products_repository_impl.dart'
    as _i258;
import '../features/products_screen/domain/repo/products_repository.dart'
    as _i255;
import '../features/products_screen/domain/use_cases/add_to_cart_use_case.dart'
    as _i678;
import '../features/products_screen/domain/use_cases/add_to_cart_use_case.dart';
import '../features/products_screen/domain/use_cases/get_all_products_use_case.dart'
    as _i107;
import '../features/products_screen/domain/use_cases/get_all_products_use_case.dart';
import '../features/products_screen/presentation/cubit/product_screen_cubit.dart';
import '../features/wishlist_screen/data/remote_data_source/wishlist_remote_data_source.dart'
    as _i715;
import '../features/wishlist_screen/data/remote_data_source/wishlist_remote_data_source_impl.dart'
    as _i485;
import '../features/wishlist_screen/data/repo/wishlist_repository_impl.dart'
    as _i571;
import '../features/wishlist_screen/domain/repo/wishlist_repository.dart'
    as _i794;
import '../features/wishlist_screen/domain/use-cases/add_to_wishlist_use_case.dart'
    as _i634;
import '../features/wishlist_screen/domain/use-cases/add_to_wishlist_use_case.dart';
import '../features/wishlist_screen/domain/use-cases/get_wishlist_use_case.dart'
    as _i552;
import '../features/wishlist_screen/domain/use-cases/get_wishlist_use_case.dart';
import '../features/wishlist_screen/domain/use-cases/remove_from_wishlist_use_case.dart'
    as _i952;
import '../features/wishlist_screen/domain/use-cases/remove_from_wishlist_use_case.dart';
import '../features/wishlist_screen/presentation/cubit/wish_list_cubit.dart';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i259.DioHelper>(() => _i259.DioHelper());
    gh.factory<ProductScreenCubit>(() => ProductScreenCubit(
          getAllProductUseCase: gh<GetAllProductUseCase>(),
          addToCartUseCase: gh<AddToCartUseCase>(),
          addToWishlistUseCase: gh<AddToWishlistUseCase>(),
          removeFromWishlistUseCase: gh<RemoveFromWishlistUseCase>(),
          getWishlistUseCase: gh<GetWishlistUseCase>(),
        ));
    gh.factory<_i1036.HomeRemoteDataSource>(() =>
        _i485.HomeRemoteDataSourceImpl(apiManager: gh<_i259.DioHelper>()));
    gh.factory<_i370.AuthRemoteDataSource>(() =>
        _i103.AuthRemoteDataSourceImpl(apiManager: gh<_i259.DioHelper>()));
    gh.factory<_i299.HomeRepository>(() => _i264.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i1036.HomeRemoteDataSource>()));
    gh.factory<_i715.WishlistRemoteDataSource>(() =>
        _i485.WishlistRemoteDataSourceImpl(apiManager: gh<_i259.DioHelper>()));
    gh.factory<_i998.ProductsRemoteDataSource>(() =>
        _i195.ProductsRemoteDataSourceImpl(apiManager: gh<_i259.DioHelper>()));
    gh.factory<_i144.ProductDetailsRemoteDataSource>(() =>
        _i761.ProductDetailsRemoteDataSourceImpl(
            apiManager: gh<_i259.DioHelper>()));
    gh.factory<_i1038.CartRemoteDataSource>(() =>
        _i143.CartRemoteDataSourceImpl(apiManager: gh<_i259.DioHelper>()));
    gh.factory<WishListScreenCubit>(() => WishListScreenCubit(
          addToWishlistUseCase: gh<AddToWishlistUseCase>(),
          removeFromWishlistUseCase: gh<RemoveFromWishlistUseCase>(),
          getWishlistUseCase: gh<GetWishlistUseCase>(),
        ));
    gh.factory<_i749.GetAllBrandsUseCase>(() =>
        _i749.GetAllBrandsUseCase(homeRepository: gh<_i299.HomeRepository>()));
    gh.factory<_i350.GetAllCategoriesUseCase>(() =>
        _i350.GetAllCategoriesUseCase(
            homeRepository: gh<_i299.HomeRepository>()));
    gh.factory<_i981.AuthRepository>(() => _i401.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i370.AuthRemoteDataSource>()));
    gh.factory<_i794.WishlistRepository>(() => _i571.WishListRepositoryImpl(
        wishlistRemoteDataSource: gh<_i715.WishlistRemoteDataSource>()));
    gh.factory<_i255.ProductsRepository>(() => _i258.ProductsRepositoryImpl(
        productsRemoteDataSource: gh<_i998.ProductsRemoteDataSource>()));
    gh.factory<_i491.CartRepository>(() => _i322.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i1038.CartRemoteDataSource>()));
    gh.factory<_i636.ProductDetailsRepository>(() =>
        _i658.ProductDetailsRepositoryImpl(
            productDetailsRemoteDataSource:
                gh<_i144.ProductDetailsRemoteDataSource>()));
    gh.factory<_i634.AddToWishlistUseCase>(
        () => _i634.AddToWishlistUseCase(gh<_i794.WishlistRepository>()));
    gh.factory<_i552.GetWishlistUseCase>(
        () => _i552.GetWishlistUseCase(gh<_i794.WishlistRepository>()));
    gh.factory<_i952.RemoveFromWishlistUseCase>(
        () => _i952.RemoveFromWishlistUseCase(gh<_i794.WishlistRepository>()));
    gh.factory<_i876.SignInUseCase>(
        () => _i876.SignInUseCase(authRepository: gh<_i981.AuthRepository>()));
    gh.factory<_i855.SignUpUseCase>(
        () => _i855.SignUpUseCase(authRepository: gh<_i981.AuthRepository>()));
    gh.factory<_i247.HomeScreenCubit>(() => _i247.HomeScreenCubit(
          getAllCategoriesUseCase: gh<_i350.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i749.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i487.ProductDetailsUseCase>(() =>
        _i487.ProductDetailsUseCase(gh<_i636.ProductDetailsRepository>()));
    gh.factory<_i134.SignUpCubit>(
        () => _i134.SignUpCubit(registerUseCase: gh<_i855.SignUpUseCase>()));
    gh.factory<_i559.DeleteItemInCartUseCase>(() =>
        _i559.DeleteItemInCartUseCase(
            cartRepository: gh<_i491.CartRepository>()));
    gh.factory<_i1030.GetCartUseCase>(() =>
        _i1030.GetCartUseCase(cartRepository: gh<_i491.CartRepository>()));
    gh.factory<_i274.UpdateCountInCartUseCase>(() =>
        _i274.UpdateCountInCartUseCase(
            cartRepository: gh<_i491.CartRepository>()));
    gh.factory<_i901.CartScreenCubit>(() => _i901.CartScreenCubit(
          getCartUseCase: gh<_i1030.GetCartUseCase>(),
          deleteItemInCartUseCase: gh<_i559.DeleteItemInCartUseCase>(),
          updateCountInCartUseCase: gh<_i274.UpdateCountInCartUseCase>(),
        ));
    gh.factory<_i678.AddToCartUseCase>(() => _i678.AddToCartUseCase(
        productsRepository: gh<_i255.ProductsRepository>()));
    gh.factory<_i107.GetAllProductUseCase>(() => _i107.GetAllProductUseCase(
        productsRepository: gh<_i255.ProductsRepository>()));
    gh.factory<_i203.SignInCubit>(
        () => _i203.SignInCubit(signInUseCase: gh<_i876.SignInUseCase>()));
    gh.factory<_i666.ProductDetailsCubit>(() => _i666.ProductDetailsCubit(
        productDetailsUseCase: gh<_i487.ProductDetailsUseCase>()));
    return this;
  }
}
