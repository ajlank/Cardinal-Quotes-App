import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:cardinal_quotes_app/home/save/widgets/action_item.dart';
import 'package:cardinal_quotes_app/home/quotes/save_backends/model/save_post_response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({super.key, required this.quote});
final List<Quote>quote;
  @override
  Widget build(BuildContext context) {
        final bottomNav = Provider.of<BottomNavNotifier>(context, listen: true);
    final quotes=quote;
     return SingleChildScrollView(
      child: Column(
        children:List.generate(quotes.length, (i){
           var qt=quotes[i];

           return Column(children: [
            ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child:(qt.isText==0)? Image.network(
              qt.quote,
              width: double.infinity,
              fit: BoxFit.cover,
            ):Text(qt.quote),
          ),
          const SizedBox(height: 12),
          const SizedBox(height: 6),
          Row(
            children: List.generate(qt.keywords.length, (i){
              var keyword=qt.keywords[i];
              return Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text("#$keyword", style: TextStyle(color: Colors.white)),
              );
            })
          ),
          Row(
            children: [
              ActionItem(iconPath:'assets/sleep_sounds/eye.png', label: qt.viewCount.toString()),
                 ActionItem(iconPath:'assets/sleep_sounds/share.png', label:'Share'),
                ActionItem(iconPath:'assets/sleep_sounds/download.png', label:'Download'),
              ActionItem(iconPath:'assets/sleep_sounds/save.png', label:'Remove'),
          
            ],
          ),
           ],);
        })
      ),
    );
  }
}