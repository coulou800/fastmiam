import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fastmiam/src/data/controllers/home_page_controller.dart';
import 'package:fastmiam/src/utils/utils.dart';
import 'package:fastmiam/src/widgets/hotlist_item_widget.dart';
import 'package:fastmiam/src/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fastmiam/src/widgets/top_bar.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>().controller;
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: Get.height * .10,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.fromLTRB(
                0, 5.dynamicHeight(), 0, 72.dynamicHeight()),
            color: ColorResources.secondaryColor.withAlpha(180),
            child: CarouselSlider(
              options: CarouselOptions(
                height: Get.height * .36,
                viewportFraction: 0.78,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 3),
                autoPlayInterval: const Duration(seconds: 10),
                onPageChanged: ((index, reason) =>
                    Get.find<HomePageController>().index = index.obs),
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
          top: 0,
          left: 0,
          right: 0,
          child: Container(
              padding: EdgeInsets.only(
                top: 15,
              ),
              color: ColorResources.secondaryColor,
              child: TopBAr()),
        ),
        Positioned(
          top: Get.height * .49,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  25.dynamicRadius(),
                ),
                topRight: Radius.circular(
                  25.dynamicRadius(),
                ),
              ),
            ),
            child: Container(
              padding: EdgeInsetsDirectional.only(
                start: 25.dynamicWidth(),
              ),
              margin: EdgeInsets.only(
                top: 178.dynamicHeight(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Heading(
                    text: 'Top restau du coin',
                    size: 24.dynamicFontSize(),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: Get.height * .6,
            left: 0,
            right: 0,
            child: Container(
              child: DotsIndicator(
                position: Get.find<HomePageController>().index.toDouble(),
                dotsCount: 5,
              ),
            )),
        Positioned(
          top: Get.height * .44,
          left: 0,
          right: Get.width * 0.25,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 15.dynamicHeight(),
              horizontal: 25.dynamicWidth(),
            ),
            decoration: BoxDecoration(
              boxShadow: const [BoxShadow(offset: Offset(1, 2))],
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
                Padding(
                  padding: EdgeInsets.only(left: 15.dynamicWidth()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
      ]),
    );
  }
}
