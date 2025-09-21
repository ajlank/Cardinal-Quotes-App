import 'package:flutter/material.dart';

class SoulCheckinView extends StatelessWidget {
  const SoulCheckinView({super.key});

  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 181, 25, 14),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Container(
                height: 180,
                         
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 241, 233, 172),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.close,color:Color.fromARGB(255, 181, 25, 14),))
                      ],
                                        ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('How Are You Feeling Today?',style: TextStyle(color:Color.fromARGB(255, 123, 33, 27),fontWeight: FontWeight.w400),)
                    ],
                  ),
                    SizedBox(height: 6),
                    Column(
                      children: [
                        Row(children: [
                          Row(children: [
                             Image.asset("assets/body_grid_items/items/formkit_happy.png", width: 50, height: 50),
                            
                             Text('Awesome')
                              ],
                            ),
                              Row(children: [
                             Image.asset("assets/body_grid_items/items/good.png", width: 50, height: 50),
                            
                             Text('Good')
                              ],
                            ),
                           Row(children: [
                             Image.asset("assets/body_grid_items/items/line.png", width: 50, height: 50),
                            
                             Text('Neutral')
                              ],
                            )
                        ],
                                          ),
                                            Row(children: [
                      Row(children: [
                         Image.asset("assets/body_grid_items/items/bad.png", width: 50, height: 50),
                        
                         Text('Bad')
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                          Row(children: [
                         Image.asset("assets/body_grid_items/items/terrible.png", width: 50, height: 50),
                        
                         Text('Terrible')
                          ],
                        ),
                       Row(children: [
                         Image.asset("assets/body_grid_items/items/wave.png", width: 50, height: 50),
                        
                         Text('Others')
                          ],
                        )
                    ],
                  ),
                      ],
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
