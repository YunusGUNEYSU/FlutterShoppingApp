import 'package:block_network_tutorial/features/home/model/product_model.dart';
import 'package:flutter/material.dart';

import '../padding/page_padding.dart';
import '../utility/image/project_network_image.dart';
class ProductCard extends StatelessWidget {
  final ProductsModel? model;
  const ProductCard({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   if (model==null)  return const SizedBox.shrink();
             
            return Padding(
              padding: const PagePadding.all(),
              child: Card(
                child: ListTile(
                  contentPadding: const PagePadding.all(),
                  title: SizedBox(height:MediaQuery.of(context).size.height*0.6,
                    child: ProjectNetworkImage.network(src: model?.image)),
                  subtitle: Text(model!.description.toString(),style:Theme.of(context).textTheme.subtitle1 ,),
                ),
              ),
            );
  }
}