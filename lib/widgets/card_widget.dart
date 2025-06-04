import 'package:flutter/material.dart';

import '../models/item.dart';

class CardWidget extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const CardWidget({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 111,
        margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colors.primary,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  item.description,
                  style: TextStyle(fontSize: 16, color: Colors.white60),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
