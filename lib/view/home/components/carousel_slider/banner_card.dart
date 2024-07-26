import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_ecomerce/const.dart';
import 'package:shimmer/shimmer.dart';

class BannerCard extends StatelessWidget {
  final String imageUrl;

  const BannerCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: CachedNetworkImage(
          imageUrl: '$baseUrl$imageUrl',
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey.shade300,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.grey,),
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                ),
              ),
            ),
          ),
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
