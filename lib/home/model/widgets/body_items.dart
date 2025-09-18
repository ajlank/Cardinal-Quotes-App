import 'package:cardinal_quotes_app/home/model/body_items_model.dart';
import 'package:flutter/material.dart';

class BodyItems extends StatelessWidget {
  const BodyItems({super.key, required this.bodyItem});
  final BodyItemsModel? bodyItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(bodyItem!.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Color.fromARGB(255, 241, 233, 172),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(bodyItem!.image),
              SizedBox(height: 5),
              Text(
                bodyItem!.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF4A3A2A),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
