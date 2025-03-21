import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/remote/failures.dart';
import '../../domain/entities/add_remove_wishList_entity.dart';
import '../../domain/entities/wishList_entity.dart';
import '../../domain/use-cases/add_to_wishlist_use_case.dart';
import '../../domain/use-cases/get_wishlist_use_case.dart';
import '../../domain/use-cases/remove_from_wishlist_use_case.dart';

part 'wish_list_state.dart';

@injectable
class WishListScreenCubit extends Cubit<WishListState> {

  GetWishlistUseCase getWishlistUseCase;
  AddToWishlistUseCase addToWishlistUseCase;

  RemoveFromWishlistUseCase removeFromWishlistUseCase;
  WishListScreenCubit({required this.addToWishlistUseCase, required this.removeFromWishlistUseCase, required this.getWishlistUseCase}) : super(WishListInitial());

  static WishListScreenCubit get(context) => BlocProvider.of(context);

  List<DataEntity> wishList = [];
  void getWishList() async {
    emit(GetWishListLoadingState());
    var either = await getWishlistUseCase.invoke();
    either.fold((l) {
      emit(GetWishListErrorState(failures: l));
    }, (response) {
      wishList = response.data!;
      emit(GetWishListSuccessState(wishListResponseEntity: response));
    });
  }

  void addToWishList(String productId) async {
    emit(AddRemoveWishListLoadingState());
    var either = await addToWishlistUseCase.invoke(productId);
    either.fold((l) {
      emit(AddRemoveWishListErrorState(failures: l));
    }, (response) {
      getWishList();
      emit(AddRemoveWishListSuccessState(addToWishListResponseEntity: response));
    });
  }

  void removeFromWishList(String productId) async {
    emit(AddRemoveWishListLoadingState());
    var either = await removeFromWishlistUseCase.invoke(productId);
    either.fold((l) {
      emit(AddRemoveWishListErrorState(failures: l));
    }, (response) {
      getWishList();
      emit(AddRemoveWishListSuccessState(addToWishListResponseEntity: response));
    });
  }
}
