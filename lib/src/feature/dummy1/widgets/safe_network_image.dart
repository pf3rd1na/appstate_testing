import 'package:flutter/material.dart';

class SafeNetworkImage extends StatelessWidget {
  const SafeNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.fit,
  });

  final String? url;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    // if (url == null || url!.isEmpty) {
    //   return Image.asset(
    //     'assets/images/default.jpg',
    //     width: width,
    //     fit: fit,
    //   );
    // }
    return Image.network(
      url!,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/images/default.jpg',
          width: width,
          fit: fit,
        );
      },
    );
  }
}
