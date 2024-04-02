import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/itemApp_model.dart';
import '../repository/categoryApp_repository.dart';

final streamCategoryAppController =StateNotifierProvider((ref) => CategoryAppController(streamCategoryApp: ref.watch(streamCategoryAppRepository)));

 final streamDataProvider=StreamProvider((ref) => ref.watch(streamCategoryAppController.notifier).appCategory());

 final streamItemsProvider = StreamProvider.autoDispose.family((ref,String categoryId) => ref.watch(streamCategoryAppController.notifier).appItems(categoryId: categoryId));



class CategoryAppController extends StateNotifier{
  final StreamCategoryApp _streamCategoryApp;

  CategoryAppController({required StreamCategoryApp streamCategoryApp}):_streamCategoryApp=streamCategoryApp,super(null);

 Stream appCategory(){
   return _streamCategoryApp.streamCategory();
  }


  Stream appItems({required String categoryId}){
   return _streamCategoryApp.streamItem(categoryId);
  }

}