import 'package:drawing_on_demand_web_admin/data/models/handover.dart';
import 'package:drawing_on_demand_web_admin/data/models/order_detail.dart';
import 'package:flutter_guid/flutter_guid.dart';

class HandoverItems {
  int? count;
  List<HandoverItem> value;

  HandoverItems({this.count, required this.value});

  factory HandoverItems.fromJson(Map<String, dynamic> json) {
    return HandoverItems(
      count: json['@odata.count'],
      value: List<HandoverItem>.from(
        json['value'].map(
          (x) => HandoverItem.fromJson(x),
        ),
      ),
    );
  }
}

class HandoverItem {
  Guid? id;
  String? handoverId;
  Guid? orderDetailId;
  Handover? handover;
  OrderDetail? orderDetail;

  HandoverItem({
    this.id,
    this.handoverId,
    this.orderDetailId,
    this.handover,
    this.orderDetail
  });

  HandoverItem.fromJson(Map<String, dynamic> json) {
    id = Guid(json['Id']);
    handoverId = json['HandOverId'];
    orderDetailId = Guid(json['OrderDetailId']);
    handover = json['Handover'] != null ? Handover.fromJson(json['Handover']) : null;
    orderDetail = json['OrderDetail'] != null ? OrderDetail.fromJson(json['OrderDetail']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id.toString(),
      'HandOverId': handoverId,
      'OrderDetailId': orderDetailId.toString(),
      'Handover': handover,
      'OrderDetail': orderDetail
    };
  }
}
