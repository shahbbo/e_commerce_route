import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/product_entity.dart';
import '../../../../core/helpers/remote/failures.dart';
import '../repo/products_repository.dart';

@injectable
class GetAllProductUseCase{
  ProductsRepository productsRepository;
  GetAllProductUseCase({required this.productsRepository});

  Future<Either<Failures,ProductREntity>> invoke(){
    return productsRepository.getAllProducts();
  }
}