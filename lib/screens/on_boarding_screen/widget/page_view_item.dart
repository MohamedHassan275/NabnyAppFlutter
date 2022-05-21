
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({required this.title});

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title!,
          style: TextStyle(
            fontSize: 15,
            color: const Color(0xff2f2e41),
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
