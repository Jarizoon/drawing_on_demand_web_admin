// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

import 'package:carousel_slider/carousel_slider.dart';
import 'package:drawing_on_demand_web_admin/data/apis/artwork_api.dart';
import 'package:drawing_on_demand_web_admin/data/models/artwork.dart';
import 'package:drawing_on_demand_web_admin/layout/app_layout.dart';
import 'package:drawing_on_demand_web_admin/screens/artwork/conponents/artwork_comments.dart';
import 'package:drawing_on_demand_web_admin/screens/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ArtworkDetailPage extends StatefulWidget {
  static dynamic state;
  final String? id;
  const ArtworkDetailPage({Key? key, this.id}) : super(key: key);
  @override
  State<ArtworkDetailPage> createState() => _ArtworkDetailPageState();
  static void refresh() {
    state.refresh();
  }
}

class _ArtworkDetailPageState extends State<ArtworkDetailPage> {
  late Future<Artwork?> artwork;
  @override
  void initState() {
    super.initState();
    ArtworkDetailPage.state = this;
    artwork = getData();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: FutureBuilder(
              future: artwork,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<String> images = [emptyImage];
                  String size = "Flexible";
                  double star = 0;
                  String status = snapshot.data!.status!;
                  if (snapshot.data!.arts!.isNotEmpty) {
                    images.remove(emptyImage);
                    for (var i = 0; i < snapshot.data!.arts!.length; i++) {
                      images.add(snapshot.data!.arts![i].image.toString());
                    }
                  }
                  if (snapshot.data!.sizes!.isNotEmpty) {
                    size = "${snapshot.data!.sizes!.first.width} x ${snapshot.data!.sizes!.first.height}";
                  }
                  if (snapshot.data!.artworkReviews!.isNotEmpty) {
                    int plus = 0;
                    for (var i = 0; i < snapshot.data!.artworkReviews!.length; i++) {
                      plus = plus + snapshot.data!.artworkReviews![i].star!.toInt();
                    }
                    star = plus / snapshot.data!.artworkReviews!.length;
                  }
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.only(top: 18, left: 18),
                          height: 70,
                          decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(40)),
                          child: const Text('Artwork Detail', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: kWhite)),
                        ),
                        Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Container(
                              padding: const EdgeInsets.only(left: 5),
                              decoration: const BoxDecoration(color: kWhite, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 150,
                                                    width: 150,
                                                    decoration: BoxDecoration(boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.shade500,
                                                        offset: const Offset(4, 4),
                                                        blurRadius: 15,
                                                        spreadRadius: 1,
                                                      )
                                                    ], color: kWhite, borderRadius: BorderRadius.circular(10)),
                                                    child: CarouselSlider(
                                                        items: images.map((e) {
                                                          return Container(
                                                            margin: const EdgeInsets.all(10),
                                                            width: 140,
                                                            height: 140,
                                                            child: Image(image: NetworkImage(e)),
                                                          );
                                                        }).toList(),
                                                        options: CarouselOptions(
                                                          height: 140,
                                                        )),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Visibility(
                                                      visible: !status.contains("Deactive"),
                                                      child: Center(
                                                        child: TextButton(
                                                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                                                          child: const Text("Deactivate", style: TextStyle(color: kWhite)),
                                                          onPressed: () async {
                                                            await updateStatus(snapshot.data!.id.toString(), "$status|Deactive");
                                                            ArtworkDetailPage.refresh();
                                                          },
                                                        ),
                                                      )),
                                                  Visibility( 
                                                      visible: status.contains("Deactive"),
                                                      child: Center(
                                                        child: TextButton(
                                                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
                                                          child: const Text("Activate", style: TextStyle(color: kWhite)),
                                                          onPressed: () async {
                                                            await updateStatus(snapshot.data!.id.toString(), status.replaceAll('|Deactive', ''));
                                                            ArtworkDetailPage.refresh();
                                                          },
                                                        ),
                                                      ))
                                                ],
                                              ),
                                              const SizedBox(width: 30),
                                              Container(
                                                width: 1000,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("${snapshot.data!.title}", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          width: 200,
                                                          child: Text("Price: ${snapshot.data!.price}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                        ),
                                                        const SizedBox(width: 20),
                                                        Text("Category: ${snapshot.data!.category!.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(width: 200, child: Text("Pieces: ${snapshot.data!.pieces}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                                                        const SizedBox(width: 20),
                                                        Text("Surface: ${snapshot.data!.surface!.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(width: 200, child: Text("In Stock: ${snapshot.data!.inStock}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                                                        const SizedBox(width: 20),
                                                        Text("Material: ${snapshot.data!.material!.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(width: 200, child: Text("Size: $size", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                                                        const SizedBox(width: 20),
                                                        Text("Rating: $star", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          width: 220,
                                                          child: Text("Status: $status", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                        ),
                                                        const Text("Artist: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                        Text("${snapshot.data!.createdByNavigation!.name}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text("Decription: ${snapshot.data!.description}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
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
                                            decoration: BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade500,
                                                offset: const Offset(4, 4),
                                                blurRadius: 15,
                                                spreadRadius: 1,
                                              )
                                            ], color: kWhite, borderRadius: BorderRadius.circular(10)),
                                            child: ArtworkReviewsPage(artworkId: snapshot.data!.id.toString()))
                                      ],
                                    )),
                              ),
                            )),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
              }),
        ),
      ),
    );
  }

  Future<Artwork?> getData() async {
    try {
      return await ArtworkApi().getOne(
        widget.id!,
        'arts,category,material,surface,createdByNavigation,sizes,artworkReviews',
      );
    } catch (error) {
      Fluttertoast.showToast(msg: 'Get artwork failed');
    }
    return null;
  }

  Future<void> updateStatus(String artworkId, String status) async {
    try {
      return await ArtworkApi().patchOne(artworkId, {'Status': status});
    } catch (error) {
      Fluttertoast.showToast(msg: 'Update artwork status failed');
    }
  } 
  void refresh() {
    setState(() {
      artwork = getData();
    });
  }
}
