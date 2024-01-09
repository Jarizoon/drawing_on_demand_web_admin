import 'package:drawing_on_demand_web_admin/data/model/handover_model.dart';

class OrderModel {
  final String? status, orderBy, dateTime, total, id;
  final List<HandoverModel>? listItems;
  OrderModel({
     this.dateTime,
     this.orderBy,
     this.total,
     this.status,
     this.id,
     this.listItems
  });
}