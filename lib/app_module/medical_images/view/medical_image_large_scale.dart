import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

class MedicalImagesWithLargeScaleView extends StatelessWidget {
  const MedicalImagesWithLargeScaleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  item = Get.arguments;
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ZoomOverlay(
              modalBarrierColor: Colors.black12, // Optional
              minScale: 0.5, // Optional
              maxScale: 3.0, // Optional
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 500),
              twoTouchOnly: false,
              onScaleStart: () {},
              onScaleStop: () {},
              child: CachedNetworkImage(
                imageUrl: item.imageUrl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
