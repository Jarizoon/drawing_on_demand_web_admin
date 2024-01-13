import 'package:drawing_on_demand_web_admin/data/models/account.dart';
import 'package:drawing_on_demand_web_admin/data/models/artwork.dart';
import 'package:drawing_on_demand_web_admin/data/models/requirement.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:intl/intl.dart';

class Proposals {
  int? count;
  List<Proposal> value;

  Proposals({this.count, required this.value});

  factory Proposals.fromJson(Map<String, dynamic> json) {
    return Proposals(
      count: json['@odata.count'],
      value: List<Proposal>.from(
        json['value'].map(
          (x) => Proposal.fromJson(x),
        ),
      ),
    );
  }
}

class Proposal {
  Guid? id;
  String? introduction;
  DateTime? createdDate;
  DateTime? lastModifiedDate;
  String? status;
  Guid? requirementId;
  Guid? createdBy;
  Guid? artworkId;
  Artwork? artwork;
  Requirement? requirement;
  Account? createdByNavigation;

  Proposal({this.id, this.introduction, this.createdDate, this.lastModifiedDate, this.status, this.requirementId, this.createdBy, this.artworkId, this.artwork, this.requirement, this.createdByNavigation});

  Proposal.fromJson(Map<String, dynamic> json) {
    id = Guid(json['Id']);
    introduction = json['Introduction'];
    createdDate = DateTime.parse(json['CreatedDate']);
    lastModifiedDate = DateTime.parse(json['LastModifiedDate']);
    status = json['Status'];
    artworkId = Guid(json['ArtworkId']);
    requirementId = Guid(json['RequirementId']);
    createdBy = Guid(json['CreatedBy']);
    artwork = json['Artwork'] != null ? Artwork.fromJson(json['Artwork']) : null;
    requirement = json['Requirement'] != null ? Requirement.fromJson(json['Requirement']) : null;
    createdByNavigation = json['CreatedByNavigation'] != null ? Account.fromJson(json['CreatedByNavigation']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id.toString(),
      'Introduction': introduction,
      'CreatedDate': DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(createdDate!),
      'LastModifiedDate': DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(lastModifiedDate!),
      'Status': status,
      'ArtworkId': artworkId.toString(),
      'RequirementId': requirementId.toString(),
      'CreateBy': createdBy.toString(),
    };
  }
}
