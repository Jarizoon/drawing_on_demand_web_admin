import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/data/models/proposal.dart';
import 'package:drawing_on_demand_web_admin/data/models/size.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:intl/intl.dart';

import 'category.dart';
import 'material.dart';
import 'surface.dart';

class Requirements {
  int? count;
  List<Requirement> value;

  Requirements({this.count, required this.value});

  factory Requirements.fromJson(Map<String, dynamic> json) {
    return Requirements(
      count: json['@odata.count'],
      value: List<Requirement>.from(
        json['value'].map(
          (x) => Requirement.fromJson(x),
        ),
      ),
    );
  }
}

class Requirement {
  Guid? id;
  String? title;
  String? description;
  String? image;
  int? pieces;
  double? budget;
  DateTime? createdDate;
  DateTime? lastModifiedDate;
  String? status;
  Guid? categoryId;
  Guid? surfaceId;
  Guid? materialId;
  Guid? createdBy;
  Category? category;
  Surface? surface;
  Material? material;
  Account? createdByNavigation;
  List<Proposal>? proposals;
  List<Size>? sizes;

  Requirement({this.id, this.title, this.description, this.image, this.pieces, this.budget, this.createdDate, this.lastModifiedDate, this.status, this.categoryId, this.surfaceId, this.materialId, this.createdBy, this.category, this.surface, this.material, this.createdByNavigation, this.proposals});

  Requirement.fromJson(Map<String, dynamic> json) {
    id = Guid(json['Id']);
    title = json['Title'];
    description = json['Description'];
    image = json['Image'];
    pieces = json['Pieces'];
    budget = double.tryParse(json['Budget'].toString());
    createdDate = DateTime.parse(json['CreatedDate']);
    lastModifiedDate = json['LastModifiedDate'] != null ? DateTime.parse(json['LastModifiedDate']) : null;
    status = json['Status'];
    categoryId = Guid(json['CategoryId']);
    surfaceId = Guid(json['SurfaceId']);
    materialId = Guid(json['MaterialId']);
    createdBy = Guid(json['CreatedBy']);
    category = json['Category'] != null ? Category.fromJson(json['Category']) : null;
    surface = json['Surface'] != null ? Surface.fromJson(json['Surface']) : null;
    material = json['Material'] != null ? Material.fromJson(json['Material']) : null;
    createdByNavigation = json['CreatedByNavigation'] != null ? Account.fromJson(json['CreatedByNavigation']) : null;
    proposals = json['Proposals'] != null ? List<Proposal>.from(json['Proposals'].map((x) => Proposal.fromJson(x))): null;
    sizes = json['Sizes'] != null ? List<Size>.from(json['Sizes'].map((x) => Size.fromJson(x))): null;
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id.toString(),
      'Title': title,
      'Description': description,
      'Image': image,
      'Pieces': pieces,
      'Budget': budget,
      'CreatedDate': DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(createdDate!),
      'LastModifiedDate': lastModifiedDate != null ? DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(lastModifiedDate!) : null,
      'Status': status,
      'CategoryId': categoryId.toString(),
      'SurfaceId': surfaceId.toString(),
      'MaterialId': materialId.toString(),
      'CreatedBy': createdBy.toString(),
      'Proposals': proposals,
      'Sizes': sizes
    };
  }
}
