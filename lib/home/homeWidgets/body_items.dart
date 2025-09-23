import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:cardinal_quotes_app/home/quotes/medicinenotes/views/to_dos.dart';
import 'package:cardinal_quotes_app/home/model/body_items_model.dart';
import 'package:cardinal_quotes_app/home/quotes/views/top_quotes_view.dart';
import 'package:cardinal_quotes_app/utils/appRoutes/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyItems extends StatelessWidget {
  const BodyItems({super.key, required this.bodyItem});
  final BodyItemsModel? bodyItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
       context.read<BottomNavNotifier>().setId(bodyItem!.id);

       if(context.read<BottomNavNotifier>().getId==1 ||context.read<BottomNavNotifier>().getId==3 || context.read<BottomNavNotifier>().getId==4 || context.read<BottomNavNotifier>().getId==5 || context.read<BottomNavNotifier>().getId==7 || context.read<BottomNavNotifier>().getId==8){
         context.read<BottomNavNotifier>().setSoundCategoryAndTitle(bodyItem!.category,bodyItem!.title);
         Navigator.of(context).pushNamed(allSoundsRoute);
         
       }else if(context.read<BottomNavNotifier>().getId==2){
         context.read<BottomNavNotifier>().setVisualCategoryAndTitle(bodyItem!.category,bodyItem!.title);
        Navigator.of(context).pushNamed(wallpaperRoute);
       }else if(context.read<BottomNavNotifier>().getId==5 || context.read<BottomNavNotifier>().getId==6 || context.read<BottomNavNotifier>().getId==8){
        Navigator.of(context).pushNamed(meditationRoute);
       }else if(context.read<BottomNavNotifier>().getId==9 || context.read<BottomNavNotifier>().getId==15){
        context.read<BottomNavNotifier>().setQuotesCategoryAndTitle(bodyItem!.category, bodyItem!.title);
        Navigator.of(context).push(PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          reverseTransitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => const QuotesView(),
        ));
       }else if(context.read<BottomNavNotifier>().getId==11){

      Navigator.of(context).pushNamed(sacredJournalsRoute);

       }else if(context.read<BottomNavNotifier>().getId==10){
        Navigator.of(context).pushNamed(soulCheckInRoute);
       }else if(context.read<BottomNavNotifier>().getId==12){
         Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        reverseTransitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (_, __, ___) => const ToDos(),
      ));
       }else if(context.read<BottomNavNotifier>().getId==14){
            Navigator.of(context).pushNamed(saveRoute);
       }else if(context.read<BottomNavNotifier>().getId==13){
        context.read<BottomNavNotifier>().setVisualCategoryAndTitle(bodyItem!.category,bodyItem!.title);
        Navigator.of(context).pushNamed(memorialRoute);
       }else if(context.read<BottomNavNotifier>().getId==15){
        Navigator.of(context).pushNamed(saveRoute);
       }
      
      },
      child:Padding(
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
