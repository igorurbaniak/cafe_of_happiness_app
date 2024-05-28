import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DishesShimmerLoading extends StatelessWidget {
  const DishesShimmerLoading({Key? key}) : super(key: key);

  Widget _buildShimmerPlaceholder({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: Row(
            children: [
              _buildShimmerPlaceholder(width: 80.0, height: 30.0),
            ],
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildShimmerPlaceholder(width: double.infinity, height: 20.0),
                      const SizedBox(height: 5),
                      _buildShimmerPlaceholder(width: double.infinity, height: 30.0),
                      const SizedBox(height: 5),
                      _buildShimmerPlaceholder(width: double.infinity, height: 40.0),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                _buildShimmerPlaceholder(width: 100.0, height: 100.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}