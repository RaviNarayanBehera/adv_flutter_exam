import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider_page.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuoteProvider homeProviderTrue =
    Provider.of<QuoteProvider>(context, listen: true);
    QuoteProvider homeProviderFalse =
    Provider.of<QuoteProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Liked Quotes'),
        ),
        body: FutureBuilder(
          future: homeProviderTrue.fromMap(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: homeProviderTrue.liked.length,
                itemBuilder: (context, index) {
                  final quotes = homeProviderTrue.liked[index]
                      .split('-')
                      .sublist(0, 1)
                      .join('-');
                  final author = homeProviderTrue.liked[index]
                      .split('-')
                      .sublist(1, 2)
                      .join('-');
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Text(quotes, style: TextStyle(
                              color: Colors.white),),
                          Align(alignment: Alignment.bottomRight,child: Text('-'+author, style: TextStyle(color: Colors.white))),
                          Align(alignment: Alignment.bottomRight,
                            child: GestureDetector(onTap: () {
                              homeProviderFalse.delete(index);
                            },child: Icon(Icons.delete,color: Colors.white,)),
                          )
                      ],
                    ),
                  ),)
                  ,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.hasError.toString()));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
