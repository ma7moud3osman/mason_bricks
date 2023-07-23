// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../incidents_screen/widgets/gallery_widget.dart';
// import '../resources/color_manager.dart';
//
// class CustomCarouselSliderWidget extends StatefulWidget {
//   final List<String> images;
//   const CustomCarouselSliderWidget({Key? key,required this.images}) : super(key: key);
//
//   @override
//   State<CustomCarouselSliderWidget> createState() => _CustomCarouselSliderWidgetState();
// }
//
// class _CustomCarouselSliderWidgetState extends State<CustomCarouselSliderWidget> {
//   int _current = 0;
//   final CarouselController _controller = CarouselController();
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       CarouselSlider(
//         items: List.generate(widget.images.length, (index) {
//           return GalleryWidget(
//             image: widget.images[index],
//             images: widget.images,
//           );
//         }),
//         carouselController: _controller,
//         options: CarouselOptions(
//           autoPlay: true,
//           // enlargeCenterPage: true,
//           viewportFraction: 1,
//           // aspectRatio: 2.0,
//           onPageChanged: (index, reason) {
//             setState(
//                   () {
//                 _current = index;
//               },
//             );
//           },
//         ),
//       ),
//       Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: List.generate(
//           widget.images.length,
//               (index) => AnimatedOpacity(
//             duration: const Duration(seconds: 1),
//             opacity: _current == index ? 0.9 : 0.3,
//             child: Container(
//               width: 8.w,
//               height: 8.h,
//               margin:
//               EdgeInsets.symmetric(vertical: 8.h, horizontal: 2.w),
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: ColorManager.primary,
//               ),
//             ),
//           ),
//         ),
//       ),
//     ],);
//   }
// }
