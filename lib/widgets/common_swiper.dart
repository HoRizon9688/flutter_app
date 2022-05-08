import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages, import_of_legacy_library_into_null_safe
// import 'package:flutter_swiper/flutter_swiper.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

const List<String> defaultImages = [
  'static/images/Picsart_22-05-07_23-24-29-451.jpg',
  'static/images/Picsart_22-05-07_23-25-11-573.jpg',
  'static/images/Picsart_22-05-07_23-33-24-083.jpg',
  'https://img-blog.csdnimg.cn/img_convert/7c5b94dba308d3ac52e18271feef033b.png',
];

var imageWidth = 540;
var imageHeight = 972;

class CommonSwiper extends StatelessWidget {
  final List<String> images;

  const CommonSwiper({Key? key, this.images = defaultImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * imageWidth / imageHeight,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return CommonImage(
            images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        pagination: const SwiperPagination(),
      ),
    );
  }
}
