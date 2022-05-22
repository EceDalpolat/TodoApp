import 'package:untitled/repositories/repository.dart';

import '../models/category.dart';

class CategoryService{
  Repository? _repository;
  CategoryService(){
    _repository= Repository();
  }
  saveCategory(Category category) async{
    return await _repository?.insetData('categories', category.categoryMapp());

  }
  updateCategory(Category category) async{
    return await _repository?.updateData('categories', category.categoryMapp());

  }
   readCategories() async{
    return await _repository?.readData('categories');
   }
   readCategoryById(categoryId)async {
     return await _repository?.readDataById('categories',categoryId);
   }
   deleteCategory(categoryId)async{
     return await _repository?.deleteData('categories', categoryId);
   }
}