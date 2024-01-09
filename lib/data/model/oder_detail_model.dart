import 'package:drawing_on_demand_web_admin/data/model/artwork_model.dart';

class OrderDetailModel{
  final ArtworkModel? artwork;
  final String? price, quantity, fee;
  OrderDetailModel({
    this.artwork,
    this.fee,
    this.price,
    this.quantity
  });
}