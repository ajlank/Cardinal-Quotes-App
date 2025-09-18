import 'package:cardinal_quotes_app/home/model/app_bar_item_model.dart';
import 'package:flutter/material.dart';

class ItemBuilder extends StatelessWidget {
  const ItemBuilder({super.key,required this.items});
  final AppBarItemModel? items;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        width: 130,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFF5E6CC),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image.asset(
                items!.image,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Text(
                items!.title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
