
import 'package:drawing_on_demand_web_admin/data/models/account_model.dart';
import 'package:drawing_on_demand_web_admin/data/models/artwork_model.dart';
import 'package:drawing_on_demand_web_admin/data/models/order_model.dart';
import 'package:drawing_on_demand_web_admin/data/models/register_model.dart';
import 'package:drawing_on_demand_web_admin/data/models/requirement_model.dart';




List artworkDemo = [
  ArtworkModel(
    image: "images/img1.jpg",
    title: "Tranh thủy mặc",
    price: 98765.toString(),
    category: "Tranh thủy mặc",
    status: "Active"
  ),
  ArtworkModel(
    image: "images/img2.jpg",
    title: "Tác phẩm trù tượng kinh điển",
    price: 98765.toString(),
    category: "Tranh trù tượng",
    status: "Active"
  ),
  ArtworkModel(
    image: "images/img3.jpg",
    title: "Sao chép tranh nghệ thuật nổi tiếng",
    price: 98765.toString(),
    category: "Tranh nghệ thuật",
    status: "Active"
  ),
  ArtworkModel(
    image: "images/img4.jpg",
    title: "Thiếu nữ bên hoa huệ",
    price: 98765.toString(),
    category: "Tranh chân dung",
    status: "Active"
  ),
  ArtworkModel(
    image: "images/img5.jpg",
    title: "Adman rời thiên đàn ",
    price: 98765.toString(),
    category: "Tranh tôn giáo",
    status: "Active"
  ),
  ArtworkModel(
    image: "images/img6.jpg",
    title: "Tranh Van Gogh",
    price: 98765.toString(),
    category: "Tranh chân dung",
    status: "Active"
  ),
];
List requirementDemo = [
  RequirementModel(
    title: "Vẽ một bức tranh ...",
    createdBy: "Tran Le Phuc Thien",
    category: "Tranh phong cảnh",
    budget: 999999.toString(),
    status: "Pending",
  ),
  RequirementModel(
    title: "Vẽ một bức tranh ...",
    createdBy: "Tran Le Phuc Thien",
    category: "Tranh phong cảnh",
    budget: 999999.toString(),
    status: "Pending",
  ),
  RequirementModel(
    title: "Vẽ một bức tranh ...",
    createdBy: "Tran Le Phuc Thien",
    category: "Tranh phong cảnh",
    budget: 999999.toString(),
    status: "Pending",
  ),
  RequirementModel(
    title: "Vẽ một bức tranh ...",
    createdBy: "Tran Le Phuc Thien",
    category: "Tranh phong cảnh",
    budget: 999999.toString(),
    status: "Pending",
  ),
  RequirementModel(
    title: "Vẽ một bức tranh ...",
    createdBy: "Tran Le Phuc Thien",
    category: "Tranh phong cảnh",
    budget: 999999.toString(),
    status: "Pending",
  ),
  RequirementModel(
    title: "Vẽ một bức tranh ...",
    createdBy: "Tran Le Phuc Thien",
    category: "Tranh phong cảnh",
    budget: 999999.toString(),
    status: "Pending",
  ),
  
];
List registerDemo = [
  RegisterModel(
    email: "tranthien13112001@gmail.com",
    name: "Tran Le Phuc Thien",
    phone: "0706778454",
    gender: "Male",
    address: "HCM city"
  ),
  RegisterModel(
    email: "manhdh.bmt@gmail.com",
    name: "Doan Huu Manh",
    phone: "0908334092",
    gender: "Male",
    address: "HCM city"
  ),
  RegisterModel(
    email: "locnqse150338@fpt.edu.vn",
    name: "Nguyen Quoc Loc",
    phone: "077304212",
    gender: "Male",
    address: "Tay Ninh"
  ),
  RegisterModel(
    email: "thientlpse150336@fpt.edu.vn",
    name: "Tran Le Phuc Thien",
    phone: "077304212",
    gender: "Male",
    address: "Can Tho City"
  ),
  RegisterModel(
    email: "nhuhttse150229@fpt.edu.vn",
    name: "Huynh Thi Truc Nhu",
    phone: "077304212",
    gender: "Female",
    address: "Ha Noi City"
  ),
];
List orderDemo = [
  OrderModel(
    dateTime: "2023-10-10",
    orderBy: "Lutfhi Chan",
    total: 2950000.toString(),
    status: "Finished",
  ),
  OrderModel(
    dateTime: "2023-10-10",
    orderBy: "Lutfhi Chan",
    total: 2950000.toString(),
    status: "Finished",
  ),
  OrderModel(
    dateTime: "2023-10-10",
    orderBy: "Lutfhi Chan",
    total: 2950000.toString(),
    status: "Finished",
  ),
  OrderModel(
    dateTime: "2023-10-10",
    orderBy: "Lutfhi Chan",
    total: 2950000.toString(),
    status: "Finished",
  ),
  OrderModel(
    dateTime: "2023-10-10",
    orderBy: "Lutfhi Chan",
    total: 2950000.toString(),
    status: "Finished",
  ),
  OrderModel(
    dateTime: "2023-10-10",
    orderBy: "Lutfhi Chan",
    total: 2950000.toString(),
    status: "Finished",
  ),
  OrderModel(
    dateTime: "2023-10-10",
    orderBy: "Lutfhi Chan",
    total: 2950000.toString(),
    status: "Finished",
  ),
  OrderModel(
    dateTime: "2023-10-10",
    orderBy: "Lutfhi Chan",
    total: 2950000.toString(),
    status: "Finished",
  ),
  OrderModel(
    dateTime: "2023-10-10",
    orderBy: "Lutfhi Chan",
    total: 2950000.toString(),
    status: "Finished",
  ),
  OrderModel(
    dateTime: "2023-10-10",
    orderBy: "Lutfhi Chan",
    total: 2950000.toString(),
    status: "Finished",
  ),
  OrderModel(
    dateTime: "2023-10-10",
    orderBy: "Lutfhi Chan",
    total: 2950000.toString(),
    status: "Finished",
  ),
  OrderModel(
    dateTime: "2023-10-10",
    orderBy: "Lutfhi Chan",
    total: 2950000.toString(),
    status: "Finished",
  ),
  
];
List accountDemo = [
  AccountModel(
    email: "nhuhttse150229@fpt.edu.vn",
    imageSrc: "",
    name: "Lutfhi Chan",
    phone: "0123456789",
    role: "Customer",
    status: "Active",
    orders: 0.toString(),
    spending: 280000.toString(),
    earning: 960000.toString(),
    rank: "Gold",
  ),
  AccountModel(
    email: "thientlpse150336@fpt.edu.vn",
    imageSrc: "icons/user.jpg",
    name: "Devi Carlos",
    phone: "0123456789",
    role: "Staff",
    status: "Active",
    orders: 4.toString(),
    spending: 5030000.toString(),
    earning: 740000.toString(),
    rank: "Diamond",
  ),
  AccountModel(
    email: "locnqse150338@fpt.edu.vn",
    imageSrc: "icons/user.jpg",
    name: "Danar Comel",
    phone: "0123456789",
    role: "Artist",
    status: "Active",
    orders: 1.toString(),
    spending: 840000.toString(),
    earning: 3200000.toString(),
    rank: "Copper",
  ),
  AccountModel(
    email: "locnqse150338@fpt.edu.vn",
    imageSrc: "icons/user.jpg",
    name: "Karin Lumina",
    phone: "0123456789",
    role: "Artist",
    status: "Active",
    orders: 2.toString(),
    spending: 1240000.toString(),
    earning: 1200000.toString(),
    rank: "Sliver",
  ),
  AccountModel(
    email: "locnqse150338@fpt.edu.vn",
    imageSrc: "icons/user.jpg",
    name: "Fandid Deadan",
    phone: "0123456789",
    role: "Artist",
    status: "Deactive",
    orders: 1.toString(),
    spending: 480000.toString(),
    earning: 200000.toString(),
    rank: "Copper",
  ),
  AccountModel(
    email: "locnqse150338@fpt.edu.vn",
    imageSrc: "icons/user.jpg",
    name: "Lutfhi Chan",
    phone: "0123456789",
    role: "Customer",
    status: "Active",
    orders: 0.toString(),
    spending: 580000.toString(),
    earning: 890000.toString(),
    rank: "Gold",
  ),
  AccountModel(
    email: "nhuhttse150229@fpt.edu.vn",
    imageSrc: "icons/user.jpg",
    name: "Lutfhi Chan",
    phone: "0123456789",
    role: "Customer",
    status: "Active",
    orders: 2.toString(),
    spending: 940000.toString(),
    earning: 580000.toString(),
    rank: "Gold",
  ),
  AccountModel(
    email: "nhuhttse150229@fpt.edu.vn",
    imageSrc: "icons/user.jpg",
    name: "Lutfhi Chan",
    phone: "0123456789",
    role: "Customer",
    status: "Active",
    orders: 4.toString(),
    spending: 7280000.toString(),
    earning: 200000.toString(),
    rank: "Gold",
  ),
  AccountModel(
    email: "manhdh.bmt@gmail.com",
    imageSrc: "icons/user.jpg",
    name: "Lutfhi Chan",
    phone: "0123456789",
    role: "Staff",
    status: "Deactive",
    orders: 0.toString(),
    spending: 0.toString(),
    earning: 0.toString(),
    rank: "Copper",
  ),
  AccountModel(
    email: "manhdh.bmt@gmail.com",
    imageSrc: "icons/user.jpg",
    name: "Lutfhi Chan",
    phone: "0123456789",
    role: "Admin",
    status: "Active",
    orders: 0.toString(),
    spending: 0.toString(),
    earning: 0.toString(),
    rank: "Diamond",
  ),
];