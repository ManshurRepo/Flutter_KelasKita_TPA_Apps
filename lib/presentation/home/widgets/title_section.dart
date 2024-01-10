import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cbt_tpa_app/core/constants/colors.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAllTap;

  const TitleSection(
      {super.key, required this.title, required this.onSeeAllTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          InkWell(
            onTap: onSeeAllTap,
            child: const Text(
              'See all',
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
