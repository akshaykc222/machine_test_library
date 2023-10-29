import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class DashBoardCard extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  const DashBoardCard(
      {super.key,
      required this.image,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                image,
                width: 15,
                height: 15,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 15, color: Colors.black.withOpacity(0.37)),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              content,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
