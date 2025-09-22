import 'package:cardinal_quotes_app/home/controller/bottom_nav_notifier.dart';
import 'package:cardinal_quotes_app/home/quotes/widgets/details_top_quotes.dart';
import 'package:cardinal_quotes_app/home/rest_api_all_quotes/hooks/fetch/fetch_quotes_by_category.dart';
import 'package:cardinal_quotes_app/home/sleepsounds/widgets/top_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class QuotesView extends HookWidget {
  const QuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final result = fetchQuotesByCategory(
      context.read<BottomNavNotifier>().getQuotesCategory,
    );
    if (result.isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (result.error != null) {
      return Center(child: Text("Error: ${result.error}"));
    }

    if (result.quotes.isEmpty || result.quotes.first.data.isEmpty) {
      return const Center(child: Text("No sounds found"));
    }
    final quotesItem = result.quotes.first.data;
  
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 25, 14),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
             TopHeader(headerTitle:context.read<BottomNavNotifier>().getQuotesViewTitle),
              SizedBox(
                height: 13,
              ),
              Expanded(
                child: ListView.builder(itemCount: quotesItem.length,
                itemBuilder: (context, i) {
                  
                  var item=quotesItem[i];
                  
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