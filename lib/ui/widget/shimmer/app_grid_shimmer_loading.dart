import 'package:flutter/material.dart';
import 'package:newware_final_project/ui/widget/shimmer/app_shimmer.dart';

class AppGridShimmerLoading extends StatelessWidget {
  const AppGridShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 3.45,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 8,
      itemBuilder: (BuildContext ctx, index) {
        return const AppShimmer();
      },
    );
  }
}
