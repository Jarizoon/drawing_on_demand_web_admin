import 'package:drawing_on_demand_web_admin/data/models/handover_item.dart';
import 'package:drawing_on_demand_web_admin/data/models/order.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:intl/intl.dart';

class Handovers {
  int? count;
  List<Handover> value;

  Handovers({this.count, required this.value});

  factory Handovers.fromJson(Map<String, dynamic> json) {
    return Handovers(
      count: json['@odata.count'],
      value: List<Handover>.from(
        json['value'].map(
          (x) => Handover.fromJson(x),
        ),
      ),
    );
  }
}

class Handover {
  Guid? id;
  Guid? orderId;
  String? name;
  String? phone;
  double? shipmentPrice;
  String? pickupAddress;
  String? receiveAddress;
  String? status;
  DateTime? estimatedDeliveryDate;
  DateTime? handOverDate;
  Order? order;
  List<HandoverItem>? handoverItems;

  Handover({this.id, this.orderId, this.name, this.phone, this.shipmentPrice, this.pickupAddress, this.receiveAddress, this.status, this.estimatedDeliveryDate, this.handOverDate, this.order, this.handoverItems});

  Handover.fromJson(Map<String, dynamic> json) {
    id = Guid(json['Id']);
    orderId = Guid(json['OrderId']);
    name = json['Name'];
    phone = json['Phone'];
    shipmentPrice = double.tryParse(json['ShipmentPrice'].toString());
    pickupAddress = json['PickupAddress'];
    receiveAddress = json['ReceiveAddress'];
    status = json['Status'];
    estimatedDeliveryDate = DateTime.parse(json['EstimatedDeliveryDate']);
    handOverDate = DateTime.parse(json['HandOverDate']);
    order = json['Order'] != null ? Order.fromJson(json['Order']) : null;
    handoverItems = json['HandOverItems'] != null
        ? List<HandoverItem>.from(
            json['HandOverItems'].map(
              (x) => HandoverItem.fromJson(x),
            ),
          )
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id.toString(),
      'orderId': orderId.toString(),
      'Name': name,
      'phone': phone,
      'ShipmentPrice': shipmentPrice,
      'PickupAddress': pickupAddress,
      'ReceiveAddress': receiveAddress,
      'Status': status,
      'EstimatedDeliveryDate': DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(estimatedDeliveryDate!),
      'HandOverDate': DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(handOverDate!),
      'Order': order,
      'HandoverItems': handoverItems
    };
  }
}
