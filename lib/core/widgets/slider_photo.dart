// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../config/locale/app_localizations.dart';
import '../../injection_container.dart';
import '../utils/extension.dart';

// ignore: must_be_immutable
class SliderPhotoScreen extends StatelessWidget {
  final List images;
  final int imageIndex;
  bool isNetwork;
  SliderPhotoScreen({
    super.key,
    required this.images,
    required this.imageIndex,
    required this.isNetwork,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.text('imagePreview'),
        ),
        elevation: 4,
      ),
      body: Container(
        color: colors.backGround,
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: isNetwork
                  ? NetworkImage(images[index])
                  : AssetImage(images[index]),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              heroAttributes: PhotoViewHeroAttributes(tag: index),
            );
          },
          itemCount: images.length,
          loadingBuilder: (context, event) => Center(
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded /
                      (event.expectedTotalBytes ?? 1),
            ).appLoading,
          ),
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          pageController: PageController(initialPage: imageIndex),
          onPageChanged: (v) {},
        ),
      ),
    );
  }

  // getPath(index) {
  //   switch (path) {
  //     case ImgPath.file:
  //       return images[index].file;
  //     case ImgPath.mediaPath:
  //       return images[index].mediaPath;
  //     case ImgPath.noKey:
  //       return images[index];
  //   }
  // }
}
