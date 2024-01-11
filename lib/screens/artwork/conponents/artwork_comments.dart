// ignore_for_file: sized_box_for_whitespace

import 'package:drawing_on_demand_web_admin/data/apis/artwork_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/artwork.dart';
import 'package:drawing_on_demand_web_admin/data/models/artwork_review.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class ArtworkReviewsPage extends StatefulWidget {
  final String? artworkId;
  const ArtworkReviewsPage({Key? key, this.artworkId}) : super(key: key);
  @override
  State<ArtworkReviewsPage> createState() => _ArtworkReviewsPage();
}

class _ArtworkReviewsPage extends State<ArtworkReviewsPage> {
  late Future<Artwork?> artwork;
  @override
  void initState() {
    super.initState();
    artwork = getData();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
              future: artwork,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PaginatedDataTable(
      dataRowMaxHeight: 70,
      columnSpacing: 10,
      rowsPerPage: 5,
      columns: const [
      DataColumn(
          label: Text("Comments",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
    ], source: ArtworkCommentsData(list: snapshot.data!.artworkReviews));
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
                }
                );
    
  }

  Future<Artwork?> getData() async {
    try {
      return await ArtworkApi().getOne(
        widget.artworkId!,
        'artworkReviews(expand=createdByNavigation),',
      );
    } catch (error) {
      Fluttertoast.showToast(msg: 'Get artwork failed');
    }
    return null;
  }

}

class ArtworkCommentsData extends DataTableSource {
  final List<ArtworkReview>? list;
  ArtworkCommentsData({required this.list});
  @override
  DataRow? getRow(int index) {
    if (index >= list!.length) {
      return null;
    }
    final review = list![index];
    double star = 0;
    if(review.star != null || review.star != 0){
      star = review.star!.toDouble();
    }

    final f = DateFormat("yyyy-MM-dd  hh:mm");

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
            Container(width: 200, child: Text("${review.createdByNavigation!.name}", style: const TextStyle(fontSize: 20),)),
            const SizedBox(width: 20),
            Container(width: 200, child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: stars),),
            const SizedBox(width: 20),
            Container(width: 200, child: Text(f.format(review.createdDate!).toString()))
          ]),
          const SizedBox(height: 10),
          Container(width: 1200, child: Text("Comment: ${review.comment}", maxLines: 1, overflow: TextOverflow.ellipsis,))
        ],
      ))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list!.length;

  @override
  int get selectedRowCount => 0;
}
