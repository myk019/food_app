import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/feature/streamCategoryApp/screen/home_page.dart';
import 'package:food_app/model/cart_model.dart';

import '../../../model/itemApp_model.dart';
import '../repository/categoryApp_repository.dart';

final streamCategoryAppController =StateNotifierProvider((ref) => CategoryAppController(streamCategoryApp: ref.watch(streamCategoryAppRepository)));

 final streamDataProvider=StreamProvider((ref) => ref.watch(streamCategoryAppController.notifier).appCategory());

 final streamItemsProvider = StreamProvider.autoDispose.family((ref,String categoryId) => ref.watch(streamCategoryAppController.notifier).appItems(categoryId: categoryId));

  final streamCartProvider=StreamProvider((ref) => ref.watch(streamCategoryAppController.notifier).cartItems());

class CategoryAppController extends StateNotifier{
  final StreamCategoryApp _streamCategoryApp;

  CategoryAppController({required StreamCategoryApp streamCategoryApp}):_streamCategoryApp=streamCategoryApp,super(null);

 Stream appCategory(){
   return _streamCategoryApp.streamCategory();
  }

  // Stream favItem(List fav){
  //  return _streamCategoryApp.favItemsRep();
  // }


  Stream appItems({required String categoryId}){
    print("controller ----------------------- ${categoryId}");
   return _streamCategoryApp.streamItem(categoryId);
  }

  addingCartItem({required CartModel cartList}){
   print("second");
   print(cartList.toMap());
   return _streamCategoryApp.addCartFunc(cartList: cartList);
  }


  Stream cartItems(){
   return _streamCategoryApp.cartItem();
  }

  deleteTheProduct(List cart){
   _streamCategoryApp.deleteProduct(cart);
  }

}