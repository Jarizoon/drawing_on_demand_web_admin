import 'package:drawing_on_demand_web_admin/data/data.dart';
import 'package:flutter/material.dart';

class ArtworkComments extends StatelessWidget {
  const ArtworkComments({Key? key, required this.artworkId}) : super(key: key);
  final String artworkId;
  @override
  Widget build(BuildContext context) {
    return 
    PaginatedDataTable(
      dataRowMaxHeight: 70,
      columnSpacing: 10,
      rowsPerPage: 5,
      columns: const [
      DataColumn(
          label: Text("Comments",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
    ], source: ArtworkCommentData());
  }
}

class ArtworkCommentData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
      artworkCommentsDemo.length,
      (index) => {
            "createBy": artworkCommentsDemo[index].id,
            "star": artworkCommentsDemo[index].star,
            "createDate": artworkCommentsDemo[index].createdDate,
            "comment": artworkCommentsDemo[index].comment,
          });
  @override
  DataRow? getRow(int index) {
    double star = 0;
    if(_data[index]['star'] != null){
      star = _data[index]['star'];
    }
    List<Widget> stars = [];
    stars.add(const Text("Rate: "));
    for(int i = 0; i < star; i++ ){
      var sta = const Icon(Icons.star, color: Colors.amber, size: 20);
      stars.add(sta);
      var box = const SizedBox(width: 5);
      stars.add(box);
    }
    for(int i = 0; i < 5 - star; i++ ){
      var sta = const Icon(Icons.star, color: Colors.grey, size: 20);
      stars.add(sta);
      var box = const SizedBox(width: 5);
      stars.add(box);
    }
    return DataRow(cells: [
      DataCell(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(width: 200, child: Text("${_data[index]['createBy']}", style: const TextStyle(fontSize: 20),)),
            const SizedBox(width: 20),
            Container(width: 200, child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: stars),),
            const SizedBox(width: 20),
            Container(width: 200, child: Text("${_data[index]['createDate']}"))
          ]),
          const SizedBox(height: 10),
          Container(width: 1200, child: Text("Comment: ${_data[index]['comment']}", maxLines: 1, overflow: TextOverflow.ellipsis,))
        ],
      ))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
