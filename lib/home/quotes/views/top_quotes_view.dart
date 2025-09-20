import 'package:cardinal_quotes_app/home/quotes/widgets/details_top_quotes.dart';
import 'package:cardinal_quotes_app/home/sleepsounds/widgets/top_header.dart';
import 'package:cardinal_quotes_app/utils/data/data_top_quites.dart';
import 'package:flutter/material.dart';

class TopQuotesView extends StatelessWidget {
  const TopQuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 25, 14),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
             TopHeader(),
              SizedBox(
                height: 13,
              ),
              Expanded(
                child: ListView.builder(itemCount: topQuotes.length,
                itemBuilder: (context, i) {
                  var item=topQuotes[i];
                  return DetailsTopQuotes(item: item);
                },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}