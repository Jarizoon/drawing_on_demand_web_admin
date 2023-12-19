// ignore_for_file: sized_box_for_whitespace

import 'package:carousel_slider/carousel_slider.dart';
import 'package:drawing_on_demand_web_admin/app_routes.dart';
import 'package:drawing_on_demand_web_admin/data/data.dart';
import 'package:drawing_on_demand_web_admin/data/models/artwork_model.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/artwork/conponents/artwork_comments.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/certificates.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';

class ArtworkDetail extends StatefulWidget {
  const ArtworkDetail({Key? key}) : super(key: key);
  @override
  State<ArtworkDetail> createState() => _ArtworkDetailState();
}

class _ArtworkDetailState extends State<ArtworkDetail> {
  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    ArtworkModel artwork = artworkDemo[0];
    // List<AssetImage> list = [];
    // artwork.image!.forEach((e){
    //   var assetImage = AssetImage(e);
    //   list.add(assetImage);
    // });
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(top: 18, left: 18),
                  height: 70,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text('Artwork Detail',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: kWhite)),
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      padding: const EdgeInsets.only(left: 5),
                      decoration: const BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Scrollbar(
                        controller: controller,
                        child: SingleChildScrollView(
                            controller: controller,
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade500,
                                                offset: const Offset(4, 4),
                                                blurRadius: 15,
                                                spreadRadius: 1,
                                              )
                                            ],
                                            color: kWhite,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: CarouselSlider(
                                            items: artwork.image!.map((e) {
                                              return Container(
                                                margin:
                                                    const EdgeInsets.all(10),
                                                width: 140,
                                                height: 140,
                                                child:
                                                    Image(image: AssetImage(e)),
                                              );
                                            }).toList(),
                                            options: CarouselOptions(
                                              height: 140,
                                            )),
                                      ),
                                      const SizedBox(width: 30),
                                      Container(
                                        width: 1000,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("${artwork.title}",
                                                style: const TextStyle(
                                                    fontSize: 28,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            const SizedBox(height: 10),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 200,
                                                  child: Text(
                                                      "Price: ${artwork.price}",
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ),
                                                const SizedBox(width: 20),
                                                Text(
                                                    "Category: ${artwork.category}",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: 200,
                                                    child: Text(
                                                        "Pieces: ${artwork.pieces}",
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500))),
                                                const SizedBox(width: 20),
                                                Text(
                                                    "Surface: ${artwork.surface}",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: 200,
                                                    child: Text(
                                                        "In Stock: ${artwork.inStock}",
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500))),
                                                const SizedBox(width: 20),
                                                Text(
                                                    "Material: ${artwork.material}",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: 220,
                                                    child: Text(
                                                        "Rating: ${artwork.rating}",
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500))),
                                                const Text("Artist: ",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator
                                                        .pushNamedAndRemoveUntil(
                                                            context,
                                                            AppRoute
                                                                .artworkDetail,
                                                            (route) => false);
                                                  },
                                                  child: Text(
                                                      "${artwork.createdBy}",
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                "Decription: ${artwork.description}",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 1200,
                                  height: 500,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade500,
                                            offset: const Offset(4, 4),
                                            blurRadius: 15,
                                            spreadRadius: 1,
                                          )
                                        ],
                                        color: kWhite,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const ArtworkComments(artworkId: "acbd")
                                    )
                              ],
                            )),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
