import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  final String assetPath;
  final String caption;
  final double height;

  const HeaderImageWidget({
    super.key,
    required this.assetPath,
    required this.caption,
    this.height = 220,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            assetPath,
            fit: BoxFit.cover,
            // Falls back gracefully if the image file is missing.
            errorBuilder: (_, __, ___) => Container(
              color: Colors.indigo.shade300,
              child: const Icon(Icons.directions_boat,
                  size: 64, color: Colors.white70),
            ),
          ),
          Positioned(
            left: 12,
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(caption,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}
