
import 'dart:convert';
import 'dart:io';

import 'package:block_network_tutorial/features/home/model/product_model.dart';
import 'package:block_network_tutorial/product/model/query/product_queries.dart';
import 'package:dio/dio.dart';
//https://fakestoreapi.com/products/categories
abstract class IHomeService {
  late final Dio dio;

  IHomeService(this.dio);
  
  Future<List<ProductsModel>?> fetchAllProducts({int count=5});
  Future<List<String>?> fetchAllCategories();
}
enum _HomeServicePath{
  products,categories
}

class HomeService extends IHomeService {
  HomeService(super.dio);
//
  @override
  Future<List<ProductsModel>?> fetchAllProducts({int count = 5}) async {
    final response= await dio.get('/${_HomeServicePath.products.name}',
    queryParameters:Map.fromEntries([ProductQueries.limit.toMapEntry('$count')])
    );
   if (response.statusCode==HttpStatus.ok) {
    final jsonBody=response.data;
     if (jsonBody is List) {
       return jsonBody.map((json) => ProductsModel.fromJson(json)).toList();
     }
   }
     
   
  }
  
  @override
  Future<List<String>?> fetchAllCategories() async {
     final response= await dio.get('/${_HomeServicePath.products.name}/${_HomeServicePath.categories.name}');

     if (response.statusCode==HttpStatus.ok) {
      final categoriesJson=response.data;
       if(categoriesJson is List<String>){
        return categoriesJson;
       }
       return null;
     }
  }
  
}