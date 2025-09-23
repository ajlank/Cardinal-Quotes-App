import 'package:cardinal_quotes_app/utils/appRoutes/constants/constant.dart';
import 'package:cardinal_quotes_app/utils/data/data_drawer_items.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Drawerpart extends StatelessWidget {
  const Drawerpart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Drawer(
        width: 258,
        backgroundColor: const Color(0xFFF5E6CC),
        child: Column(
          children: [
             Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "''Peace comes from within.\n   Do not seek it without''",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF4A3A2A),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Buddha",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A3A2A),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    
                    const SizedBox(width: 2),
                    Image.asset('assets/drawer_items/top/left_bird.png'),
                    const SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.asset('assets/drawer_items/top/right_bird.png'),
                    )
                  ],
                ),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(height: 25),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/drawer_items/top/Cancel.png'),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  const SizedBox(height: 7),
                 
    
                  ...List.generate(drawerItems.length, (i) {
                    var item = drawerItems[i];
                    return ListTile(
                      leading: Image(image: AssetImage(item.image)),
                      title: Text(
                        item.title,
                        style: const TextStyle(color: Color(0xFF4A3A2A)),
                      ),
                    );
                  }),
              
                  const SizedBox(height: 20),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          GetStorage().remove('accessToken');
                          Navigator.of(context).pushNamedAndRemoveUntil(signUpRoute, (_)=>false);
                        },
                        child: const Text('Log Out')),
                      const SizedBox(width: 10),
                      Image.asset('assets/drawer_items/bottom/log_out.png'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
