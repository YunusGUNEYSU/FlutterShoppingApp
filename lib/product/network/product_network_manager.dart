import 'package:block_network_tutorial/product/constant/app_constant.dart';
import 'package:dio/dio.dart';

class ProductNetworkManager  {

  var service=Dio(BaseOptions(baseUrl: ApplicationConstant.instance.baseUrl));
  
}