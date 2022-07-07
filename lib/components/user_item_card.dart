import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_suitmedia_mobile_assessment/theme/theme.dart';

class UserItemCard extends StatelessWidget {
  const UserItemCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onTapped,
  }) : super(key: key);

  final String imagePath;
  final VoidCallback onTapped;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
        color: Colors.white,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: imagePath,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 24,
                foregroundImage: imageProvider,
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const CircleAvatar(
                radius: 24,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTheme.h3),
                const SizedBox(height: 4),
                Text(subtitle, style: AppTheme.subtitle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
