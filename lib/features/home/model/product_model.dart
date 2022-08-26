import 'package:json_annotation/json_annotation.dart';
part'product_model.g.dart';
@JsonSerializable(createToJson: false)
class ProductsModel  {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductsModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

 factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return _$ProductsModelFromJson(json);
  }

  Map<String, dynamic>? toJson() {
   
    return null;
  }
}
@JsonSerializable(createToJson: false)
class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

 factory Rating.fromJson(Map<String, dynamic> json) {
    return _$RatingFromJson(json);
  }

}
