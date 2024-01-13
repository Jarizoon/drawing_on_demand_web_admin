import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:intl/intl.dart';

class Certificates {
  int? count;
  List<Certificate> value;

  Certificates({this.count, required this.value});

  factory Certificates.fromJson(Map<String, dynamic> json) {
    return Certificates(
      count: json['@odata.count'],
      value: List<Certificate>.from(
        json['value'].map(
          (x) => Certificate.fromJson(x),
        ),
      ),
    );
  }
}

class Certificate { 
  Guid? id;
  Guid? accountId;
  String? name;
  String? image;
  String? description;
  DateTime? achievedDate;
  Account? account;
  

  Certificate({
    this.id,
    this.accountId,
    this.name,
    this.image,
    this.description,
    this.achievedDate,
    this.account,
  });

  Certificate.fromJson(Map<String, dynamic> json) {
    id = Guid(json['Id']);
    accountId = Guid(json['AccountId']);
    name = json['Name'];
    image = json['Image'];
    description = json['Description'];
    achievedDate = DateTime.parse(json['AchievedDate']);
    account = json['Account'] != null ? Account.fromJson(json['Account']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id.toString(),
      'AccountId': accountId.toString(),
      'Name': name,
      'Image': image,
      'Description': description,
      'EndDate': DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(achievedDate!),
      'Account': account,
    };
  }
}
