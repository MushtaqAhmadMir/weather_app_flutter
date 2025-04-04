import 'package:flutter/material.dart';
import 'package:weather_app_flutter/presentation/widgets/shimmer_item.dart';

class ShimmerUI extends StatelessWidget {
  const ShimmerUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ShimmerItem(
            width: double.infinity,
            height: 480,
            padding: const EdgeInsets.all(20.0),
            radius: BorderRadius.circular(20),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              ShimmerItem(
                width: 120,
                height: 120,
                padding: const EdgeInsets.all(20.0),
                radius: BorderRadius.circular(20),
              ),
              SizedBox(width: 20),
              ShimmerItem(
                width: 120,
                height: 120,
                padding: const EdgeInsets.all(20.0),
                radius: BorderRadius.circular(20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
