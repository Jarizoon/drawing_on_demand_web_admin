import 'package:drawing_on_demand_web_admin/app_routes/named_routes.dart';
import 'package:drawing_on_demand_web_admin/data/models/artwork.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class ArtworkInfo extends StatelessWidget {
  const ArtworkInfo({Key? key, required this.aw, required this.imageSize}) : super(key: key);
  final Artwork? aw;
  final double imageSize;
  @override
  Widget build(BuildContext context) {
    String? image = emptyImage;
    if (aw!.arts!.isNotEmpty) {
      image = aw!.arts!.first.image;
    }
    return InkWell(
        onTap: () => context.goNamed(ArtworkDetailRoute.name, pathParameters: {'artwork_id': aw!.id.toString()}),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(6),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(border: Border.all(width: 1.0, color: blackColor)),
                      width: 100,
                      height: 100,
                      child: Image(
                        image: NetworkImage(image!),
                        fit: BoxFit.contain,
                      ))),
              const SizedBox(width: 20),
              Expanded(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Title: ${aw!.title!}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 5),
                      Text("Caterogy: ${aw!.category!.name!}", style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 5),
                      Text(
                        aw!.description!,
                        style: const TextStyle(color: blackColor, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
