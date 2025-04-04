import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app_flutter/presentation/manager/color_manager.dart';

class ShimmerItem extends StatelessWidget {
  final double height;
  final double width;
  final Color baseColor;
  final BorderRadius radius;
  final EdgeInsets padding;

  const ShimmerItem({
    this.height = 20,
    this.width = 20,
    this.baseColor = const Color(0xFFCCCCCC),
    this.radius = const BorderRadius.all(Radius.circular(8)),
    this.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: ColorManager.gray,
        period: const Duration(milliseconds: 1000),
        child: Container(
          width: width,
          height: height,
          constraints: BoxConstraints(maxHeight: height, maxWidth: width),
          decoration: BoxDecoration(borderRadius: radius, color: Colors.white),
        ),
      ),
    );
  }
}
