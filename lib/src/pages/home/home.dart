import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fastmiam/src/data/controllers/home_page_controller.dart';
import 'package:fastmiam/src/utils/utils.dart';
import 'package:fastmiam/src/widgets/hotlist_item_widget.dart';
import 'package:fastmiam/src/widgets/restau_list_item_widget.dart';
import 'package:fastmiam/src/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fastmiam/src/widgets/top_bar.dart';
import 'package:get/get.dart';
import 'package:rate/rate.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>().controller;
    return Scaffold(
      backgroundColor: ColorResources.secondaryColor,
      body: Stack(clipBehavior: Clip.antiAlias, children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: Get.height * 1.55,
            child: Stack(
              children: [
                Positioned(
                  top: Get.height * .10,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorResources.secondaryColor.withAlpha(180),
                    ),
                    padding: EdgeInsets.fromLTRB(
                        0, 5.dynamicHeight(), 0, 72.dynamicHeight()),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: Get.height * .36,
                        viewportFraction: 0.78,
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(seconds: 3),
                        autoPlayInterval: const Duration(seconds: 10),
                        onPageChanged: ((index, reason) =>
                            Get.find<HomePageController>().index = index),
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      ),
                      carouselController: controller,
                      items: List.generate(5, (index) {
                        return HotListItemWidget(index: index);
                      }),
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * .49,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          15.dynamicRadius(),
                        ),
                        topRight: Radius.circular(
                          15.dynamicRadius(),
                        ),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsetsDirectional.only(
                          start: 10.dynamicWidth(), end: 10.dynamicWidth()),
                      margin: EdgeInsets.only(
                        top: 105.dynamicHeight(),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: Obx(() {
                                final position =
                                    HomePageController.to.indexValue;
                                return Container(
                                  margin: EdgeInsets.only(
                                      bottom: 15.dynamicHeight(),
                                      top: 10.dynamicHeight()),
                                  child: DotsIndicator(
                                    decorator: DotsDecorator(
                                        color: ColorResources.paraColor
                                            .withAlpha(150),
                                        activeShape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.dynamicRadius())),
                                        activeSize: Size.square(13.0)),
                                    position: position,
                                    dotsCount: 5,
                                  ),
                                );
                              })),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(
                                top: 48.dynamicHeight(),
                                left: 15.dynamicWidth(),
                                right: 15.dynamicWidth()),
                            decoration: BoxDecoration(
                                color: ColorResources.paraColor.withAlpha(24),
                                borderRadius:
                                    BorderRadius.circular(20.dynamicRadius())),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Heading(
                                      text: 'Pres de chez vous',
                                      size: 24.dynamicFontSize(),
                                    ),
                                    NormalText(
                                      text: 'voir plus',
                                      size: 16.dynamicFontSize(),
                                      color: ColorResources.mainColor,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: ColorResources.mainColor,
                                  thickness: 1.3,
                                  indent: Get.width * .045,
                                  endIndent: Get.width * .20,
                                ),
                                Container(
                                  height: 480.dynamicHeight(),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 3,
                                      itemBuilder: (context, index) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.dynamicHeight(),
                                              horizontal: 10.dynamicWidth()),
                                          child: const RestauListItemWidget())),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * .44,
                  left: 0,
                  right: Get.width * 0.25,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.dynamicHeight(),
                          horizontal: 25.dynamicWidth(),
                        ),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(offset: Offset(1, -1), blurRadius: 2.5)
                          ],
                          color: ColorResources.secondaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.dynamicRadius()),
                            bottomRight: Radius.circular(
                              15.dynamicRadius(),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Heading(
                                      text: 'Doner',
                                      size: 32.dynamicFontSize(),
                                    ),
                                    NormalText(
                                      text: '4.5',
                                      size: 14.dynamicFontSize(),
                                    ),
                                  ],
                                ),
                                Rate(
                                  allowHalf: true,
                                  readOnly: true,
                                  color: Colors.white.withAlpha(220),
                                  iconSize: 20,
                                  initialValue: 4.5,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15.dynamicWidth()),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Heading(
                                    family: 'Inspiration',
                                    text: 'La Playa',
                                    size: 28.dynamicFontSize(),
                                  ),
                                  NormalText(
                                    text: '7/10',
                                    size: 12.dynamicFontSize(),
                                  ),
                                  SizedBox(width: 25.dynamicWidth()),
                                  ImageIcon(
                                    AssetImage('assets/images/distance.png'),
                                    size: 16,
                                    color: ColorResources.paraColor,
                                  ),
                                  NormalText(
                                    text: '1km',
                                    size: 14.dynamicFontSize(),
                                  ),
                                  Icon(
                                    Icons.comment_rounded,
                                    color: ColorResources.paraColor,
                                    size: 16,
                                  ),
                                  NormalText(
                                    text: '275',
                                    size: 14.dynamicFontSize(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
              padding: EdgeInsets.only(
                top: 15.dynamicHeight(),
              ),
              color: ColorResources.secondaryColor,
              child: const TopBAr()),
        ),
      ]),
    );
  }
}
