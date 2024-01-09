import 'package:drawing_on_demand_web_admin/data/model/certificate_model.dart';

class AccountModel {
  String? imageSrc, email, name, phone, gender, address, bio, createdDate, lastModifiedDate, status, rank, role, spending, orders, earning;
  List<CertificateModel>? listCer;
  AccountModel({
    this.imageSrc,
    this.email,
    this.name,
    this.phone,
    this.gender,
    this.address,
    this.bio,
    this.createdDate,
    this.lastModifiedDate,
    this.status,
    this.rank,
    this.role,
    this.spending,
    this.orders,
    this.earning,
    this.listCer
  });
}