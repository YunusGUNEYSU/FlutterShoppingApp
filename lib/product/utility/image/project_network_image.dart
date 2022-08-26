import 'package:block_network_tutorial/product/constant/app_constant.dart';
import 'package:block_network_tutorial/product/mixin/image_mixin.dart';
import 'package:flutter/material.dart';

class ProjectNetworkImage extends Image with ImageMixin{
  ProjectNetworkImage.network({Key? key, String? src}) : 
  super.network(src??ApplicationConstant.instance.dummyImage,key: key);
  
}