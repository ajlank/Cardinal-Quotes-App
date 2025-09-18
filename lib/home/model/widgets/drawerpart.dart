import 'package:cardinal_quotes_app/main.dart';
import 'package:cardinal_quotes_app/utils/data/data_drawer_items.dart';
import 'package:flutter/material.dart';

class Drawerpart extends StatelessWidget {
  const Drawerpart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
        child: Drawer(
          width: 258,
          backgroundColor: const Color(0xFFF5E6CC),
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              SizedBox(
                height: 7,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                   GestureDetector(
                    onTap: () {
                    
                      Navigator.pop(context); 
                    },
                     child: Container(
                       
                        child: Image.asset('assets/drawer_items/top/Cancel.png')),
                   ),
                    SizedBox(width: 12,)
                  ],
                )),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      const Text(
                      "''Peace comes from within.\n   Do not seek it without''",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4A3A2A), // warm dark brown
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    const Text(
                      "Buddha",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A3A2A), // same brown for consistency
                      ),
                    ),
                    ],),
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  Row(
                      
                    children: [
                      SizedBox(
                        width: 2,
                      ),
                    Image.asset('assets/drawer_items/top/left_bird.png'),
                   SizedBox(
                    width: 20,
                    
                   ),
                      
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        child: Image.asset('assets/drawer_items/top/right_bird.png')),
                    )
                  ],)
                ],
              ),

             
             SizedBox(
              height: 600,
               child: SingleChildScrollView(
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:List.generate(drawerItems.length, (i){
                  var item=drawerItems[i];
                  return ListTile(
                    leading:Image(image: AssetImage(item.image)),
                    title: Text(item.title,style: TextStyle(color:Color(0xFF4A3A2A)),),
                   
                  );
                 }),),
               ),
             ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Log Out'),
                SizedBox(width: 10,),
                Image.asset('assets/drawer_items/bottom/log_out.png')
              ],
             )
            ],
          ),
        ),
      );
  }
}