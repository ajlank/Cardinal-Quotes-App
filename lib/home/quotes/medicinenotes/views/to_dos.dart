import 'package:cardinal_quotes_app/home/quotes/medicinenotes/views/create_todos.dart';
import 'package:cardinal_quotes_app/home/quotes/medicinenotes/widgets/todo_tile.dart';
import 'package:flutter/material.dart';

class ToDos extends StatelessWidget {
  const ToDos({super.key});

  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset('assets/body_grid_items/items/left_bird.png'),
          Image.asset('assets/body_grid_items/items/right_bird.png'),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Hero(
              tag: 'wow11',
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: Duration(
                        milliseconds: 900,
                      ), 
                      pageBuilder: (_, __, ___) => CreateTodos(),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(255, 241, 233, 172),
                  child: Image.asset(
                    'assets/body_grid_items/addPhoto.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
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
                      title: "Napa",
                      leadingText: 'Everyday At 4:00 Pm',
                      shouldRed: false,
                    ),

                    TodoTile(
                      wid: wid,
                      leftImg: "assets/body_grid_items/items/box_check.png",
                      title: "Viglimate",
                      leadingText: 'Everyday At 4:00 Pm',
                      shouldRed: false,
                    ),
                    TodoTile(
                      wid: wid,
                      leftImg: "assets/body_grid_items/items/circle_check.png",
                      title: "Napa",
                      leadingText: 'Everyday At 4:00 Pm Overdue',
                      shouldRed: true,
                    ),
                    TodoTile(
                      wid: wid,
                      leftImg: "assets/body_grid_items/items/circle_check.png",
                      title: "Napa",
                      leadingText: 'Everyday At 6:00 Pm',
                      shouldRed: false,
                    ),
                    TodoTile(
                      wid: wid,
                      leftImg: "assets/body_grid_items/items/box_check.png",
                      title: "Viglimate",
                      leadingText: 'Everyday At 4:00 Pm',
                      shouldRed: false,
                    ),
                    TodoTile(
                      wid: wid,
                      leftImg: "assets/body_grid_items/items/circle_check.png",
                      title: "Napa",
                      leadingText: 'Everyday At 4:00 Pm Overdue',
                      shouldRed: true,
                    ),
                    TodoTile(
                      wid: wid,
                      leftImg: "assets/body_grid_items/items/circle_check.png",
                      title: "Napa",
                      leadingText: 'Everyday At 6:00 Pm',
                      shouldRed: false,
                    ),
                    TodoTile(
                      wid: wid,
                      leftImg: "assets/body_grid_items/items/box_check.png",
                      title: "Viglimate",
                      leadingText: 'Everyday At 4:00 Pm',
                      shouldRed: false,
                    ),
                    TodoTile(
                      wid: wid,
                      leftImg: "assets/body_grid_items/items/circle_check.png",
                      title: "Napa",
                      leadingText: 'Everyday At 4:00 Pm Overdue',
                      shouldRed: true,
                    ),
                    TodoTile(
                      wid: wid,
                      leftImg: "assets/body_grid_items/items/circle_check.png",
                      title: "Napa",
                      leadingText: 'Everyday At 6:00 Pm',
                      shouldRed: false,
                    ),
                    TodoTile(
                      wid: wid,
                      leftImg: "assets/body_grid_items/items/box_check.png",
                      title: "Viglimate",
                      leadingText: 'Everyday At 4:00 Pm',
                      shouldRed: false,
                    ),
                    TodoTile(
                      wid: wid,
                      leftImg: "assets/body_grid_items/items/circle_check.png",
                      title: "Napa",
                      leadingText: 'Everyday At 4:00 Pm Overdue',
                      shouldRed: true,
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
