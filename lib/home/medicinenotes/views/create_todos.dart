import 'package:cardinal_quotes_app/home/medicinenotes/widgets/todo_tile.dart';
import 'package:flutter/material.dart';

class CreateTodos extends StatelessWidget {
  const CreateTodos({super.key});

  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 246, 236, 197),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color(0xFF4A3A2A),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'New To-dos',
                    style: TextStyle(
                      color: Color(0xFF4A3A2A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Next',
                    style: TextStyle(
                      color: Color(0xFF4A3A2A),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: wid * .80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 91, 60, 50),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/body_grid_items/items/uis_calender.png',
                            ),
                            Text(
                              'New To-dos',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Image.asset(
                              'assets/body_grid_items/items/mdi_clock.png',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 16),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 60,
                      width: wid * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 0.5),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Repeat',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 91, 60, 50),
                                  ),
                                ),
                                Text(
                                  'Everyday >',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 91, 60, 50),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'End Repeat',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 91, 60, 50),
                                  ),
                                ),
                                Text(
                                  'After 1 Month >',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 91, 60, 50),
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 181, 25, 14),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Image.asset('assets/sleep_sounds/right_arrow.png'),
                  ),
                  SizedBox(width: 12),
                  Text('To-dos', style: TextStyle(color: Colors.white)),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    TodoTile(
                      wid: wid,
                      leftImg: "assets/body_grid_items/items/circle_check.png",
                      title: "Viglimate",
                      leadingText: 'Everyday, 3 times a day',
                      shouldRed: false,
                    ),

                    TodoTile(
                      wid: wid,
                      leftImg: "assets/body_grid_items/items/box_check.png",
                      title: "Viglimate",
                      leadingText: '2 days of interval, 3 times a day',
                      shouldRed: false,
                    ),
                  Hero(
                      tag: 'wow11',
                      child: Material(
                        type: MaterialType.transparency,
                        child: TodoTile(
                          wid: wid,
                          leftImg:
                              "assets/body_grid_items/items/circle_check.png",
                          title: "Viglimate",
                          leadingText: 'Everyday, 1 times a day overdue',
                          shouldRed: true,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
