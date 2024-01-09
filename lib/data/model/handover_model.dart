import 'package:drawing_on_demand_web_admin/data/model/handover_item_model.dart';

class HandoverModel{
  final List<HandoverItemModel>? listItems;
  final String? name, phone, pickupAddress, receiveAddress, shipmentPrice, status;
  HandoverModel({
    this.listItems,
    this.name,
    this.phone,
    this.pickupAddress,
    this.receiveAddress,
    this.shipmentPrice,
    this.status
  });
}