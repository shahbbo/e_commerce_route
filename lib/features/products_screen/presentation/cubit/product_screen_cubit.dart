

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../wishlist_screen/domain/entities/wishList_entity.dart';
import '../../../wishlist_screen/domain/use-cases/add_to_wishlist_use_case.dart';
import '../../../wishlist_screen/domain/use-cases/get_wishlist_use_case.dart';
import '../../../wishlist_screen/domain/use-cases/remove_from_wishlist_use_case.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/use_cases/add_to_cart_use_case.dart';
import '../../domain/use_cases/get_all_products_use_case.dart';
import 'product_screen_states.dart';


@injectable
class ProductScreenCubit extends Cubit<ProductScreenStates> {
  GetAllProductUseCase getAllProductUseCase;
  AddToCartUseCase addToCartUseCase;


  GetWishlistUseCase getWishlistUseCase;

  AddToWishlistUseCase addToWishlistUseCase;

  RemoveFromWishlistUseCase removeFromWishlistUseCase;
  ProductScreenCubit({
    required this.getAllProductUseCase,
    required this.addToCartUseCase,
    required this.addToWishlistUseCase,
    required this.removeFromWishlistUseCase,
    required this.getWishlistUseCase
  }) : super(ProductInitialState());

  List<ProductEntity>? productsList = [];
  int numOfCartItems = 0;

  static ProductScreenCubit get(context) => BlocProvider.of(context);

  void getAllProducts() async {
    emit(ProductLoadingState());
    var either = await getAllProductUseCase.invoke();
    either.fold((l) {
      emit(ProductErrorState(failures: l));
    }, (response) {
      productsList = response.data;
      emit(ProductSuccessState(productResponseEntity: response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold((l) {
      emit(AddToCartErrorState(failures: l));
    }, (response) {
      emit(AddToCartSuccessState(addToCartResponseEntity: response));
    });
  }

  List<DataEntity> wishListDataEntity = [];
  void getWishList() async {
    emit(WishListLoadingState());
    var either = await getWishlistUseCase.invoke();
    either.fold((l) {
      emit(WishListErrorState(failures: l));
    }, (response) {
      wishListDataEntity = response.data!;
      emit(WishListSuccessState(wishListResponseEntity: response));
    });
  }

  bool isWishListed = false;
  bool isProductInWishList(String productId) {
    return wishListDataEntity.any((product) => product.id == productId);
  }

  void addToWishList(String productId) async {
    emit(AddWishListLoadingState());
    var either = await addToWishlistUseCase.invoke(productId);
    either.fold((l) {
      emit(AddWishListErrorState(failures: l));
    }, (response) {
      getWishList();
      emit(AddWishListSuccessState(addToWishListResponseEntity: response));
    });
  }

  void removeFromWishList(String productId) async {
    emit(AddWishListLoadingState());
    var either = await removeFromWishlistUseCase.invoke(productId);
    either.fold((l) {
      emit(AddWishListErrorState(failures: l));
    }, (response) {
      getWishList();
      emit(AddWishListSuccessState(addToWishListResponseEntity: response));
    });
  }
}
