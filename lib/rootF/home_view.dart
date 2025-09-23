import 'package:cardinal_quotes_app/auth/views/authentication_view.dart';
import 'package:cardinal_quotes_app/home/audios/sleepsounds/views/all_sounds_view.dart';
import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:cardinal_quotes_app/home/homeWidgets/bottom_nav_wid.dart';
import 'package:cardinal_quotes_app/home/homeWidgets/bottom_nav_wid/home_view_wid.dart';
import 'package:cardinal_quotes_app/home/quotes/views/top_quotes_view.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

 final List<Widget>views=[
  HomeViewWid(),
  AllSoundsView(),
  QuotesView(),
  QuotesView(),
 ];
  @override
  Widget build(BuildContext context) {
     String? accessToken=GetStorage().read('accessToken');
     if(accessToken==null){
      return AuthenticationView();
     }
    return Stack(
      children: [
        Scaffold(
         
          bottomNavigationBar: BottomNavWid(),
          

          backgroundColor: const Color.fromARGB(255, 181, 25, 14),
          body: SafeArea(
            child: views[context.watch<BottomNavNotifier>().currentIndex]
          ),
        ),

        (context.watch<BottomNavNotifier>().isClosed == false)
            ? SizedBox.shrink()
            : Positioned(
                right: 10,
                bottom: 70,
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                  child: Container(
                    width: 170,
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 241, 233, 172),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<BottomNavNotifier>().setIsClosed(
                                  false,
                                );
                              },
                              child: Image.asset(
                                'assets/drawer_items/top/Cancel.png',
                                height: 18,
                                width: 18,
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Notifications",
                                style: TextStyle(
                                  color: Color(0xFF4A3A2A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Transform.scale(
                                scale: 0.6,
                                child: Switch(
                                  activeTrackColor: Color(0xFF4A3A2A),
                                  value: context
                                      .watch<BottomNavNotifier>()
                                      .switchOn,
                                  onChanged: (v) {
                                    context
                                        .read<BottomNavNotifier>()
                                        .toggleTurnedOn();
                                    context
                                        .read<BottomNavNotifier>()
                                        .toggleSwitch();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}

