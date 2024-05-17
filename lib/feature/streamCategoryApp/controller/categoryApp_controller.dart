import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/feature/streamCategoryApp/screen/home_page.dart';
import 'package:food_app/model/cart_model.dart';

import '../../../model/itemApp_model.dart';
import '../repository/categoryApp_repository.dart';

final streamCategoryAppController =StateNotifierProvider((ref) => CategoryAppController(streamCategoryApp: ref.watch(streamCategoryAppRepository)));

 final streamDataProvider=StreamProvider((ref) => ref.watch(streamCategoryAppController.notifier).appCategory());

 final streamItemsProvider = StreamProvider.autoDispose.family((ref,String categoryId) => ref.watch(streamCategoryAppController.notifier).appItems(categoryId: categoryId));

 final streamToppingsProvider = StreamProvider.autoDispose.family((ref,String categoryId) => ref.watch(streamCategoryAppController.notifier).toppings(categoryId: categoryId));

  final streamCartProvider=StreamProvider((ref) => ref.watch(streamCategoryAppController.notifier).cartItems());

  final streamItemFav=StreamProvider((ref) => ref.watch(streamCategoryAppController.notifier).itemFav());

  final deleteController=Provider((ref) => CategoryAppController(streamCategoryApp: ref.watch(streamCategoryAppRepository)));

   // final carouselProvider = StateProvider((ref) => ref.watch(streamCategoryAppController.notifier).carooooosel());


class CategoryAppController extends StateNotifier{

  final StreamCategoryApp _streamCategoryApp;

  CategoryAppController({required StreamCategoryApp streamCategoryApp}):_streamCategoryApp=streamCategoryApp,super(null);

 Stream appCategory(){
   return _streamCategoryApp.streamCategory();
  }
 Stream itemFav(){
   return _streamCategoryApp.streamFav();
  }
  deleteFav(String id,index){
  _streamCategoryApp.deleteFav(id,index);
  }


  Stream appItems({required String categoryId}){
    print("controller ----------------------- ${categoryId}");
   return _streamCategoryApp.streamItem(categoryId);
  }
  Stream toppings({required String categoryId}){
  return _streamCategoryApp.streamToppings(categoryId);
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

  //  Stream carooooosel(){
  // return _streamCategoryApp.caroselSlider();
  // }

}