import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String releasedYear;
  final String imageUrl;
  final VoidCallback onTap;
  final String heroTag;

  const MovieCard(
      {super.key,
      required this.title,
      required this.releasedYear,
      required this.imageUrl,
      required this.onTap, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: MediaQuery.of(context).size.height / 2.5,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    width: MediaQuery.of(context).size.width,
                    imageUrl: imageUrl,
                    fit: BoxFit.fill,
                  )),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  color: Colors.black.withOpacity(0.8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "($releasedYear)",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
