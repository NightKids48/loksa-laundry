// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lestari_laundry/domain/model/data/kilogram_product.dart/product_image_data.dart';

class KilogramDataAttribute {
  String productName;
  String productType;
  String productDescription;
  String productPrice;
  String minimumOrder;
  String createdAt;
  String updatedAt;
  String publishedAt;
  List productVariant;
  ProductImageData productImage;
  KilogramDataAttribute(
    this.productName,
    this.productType,
    this.productDescription,
    this.productPrice,
    this.minimumOrder,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.productVariant,
    this.productImage,
  );
}