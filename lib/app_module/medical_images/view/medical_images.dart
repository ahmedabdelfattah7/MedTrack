import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/app_module/medical_images/controller/medical_images_controller.dart';
import 'package:medtrack/core/Themes/theme_controller.dart';
import 'package:medtrack/core/utils/color_manger.dart';
import 'package:medtrack/core/widgets/fallback.dart';
import 'package:medtrack/routes/routes_constants.dart';
import 'package:shimmer/shimmer.dart';

class MedicalImages extends StatelessWidget {
  MedicalImages({Key? key}) : super(key: key);
  MedicalImagesController medicalImagesController =
      Get.put(MedicalImagesController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MedicalImagesController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title:  Text('This is Your Medical images',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        body: Obx(
          () => ConditionalBuilder(
            condition: medicalImagesController.medicalImagesList.isNotEmpty,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing:15,
                  ),
                  itemCount: medicalImagesController.medicalImagesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final imageUrl = medicalImagesController
                        .medicalImagesList[index].imageUrl;
                    final imageItem =
                        medicalImagesController.medicalImagesList[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(RouteNames.medicalImagesLargeScale,
                            arguments: imageItem);
                      },
                      child: Expanded(
                        child: Stack(
                          children: [
                            Container(
                              height: 300,
                              width: 500,
                              decoration: BoxDecoration(
                                color: Get.find<ThemeController>().isDarkMode
                                    ? AppColors.mainDark
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: CachedNetworkImage(
                                imageUrl: imageUrl,
                                fit: BoxFit.cover,
                                height: double.infinity,
                                width: double.infinity,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                ),
                                onPressed: () async {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Please Confirm'),
                                          content: const Text(
                                              'Are you sure you want to delete?'),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop(false);
                                                },
                                                child: const Text('Cancel')),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red, // Set the background color to red
                                                ),
                                                onPressed: () async{
                                                  Navigator.of(context).pop(true);
                                                  await medicalImagesController.deleteImage(imageItem.id);
                                                },
                                                child: const Text('Confirm')),
                                          ],
                                        );
                                      });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                    );
                  },
                ),
              );
            },
            fallback: (context) => Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      height: 220,
                      width: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white10,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.pickAndUploadImage();
          },
          backgroundColor: AppColors.primaryColor,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(Icons.image),
        ),
      );
    });
  }
}
