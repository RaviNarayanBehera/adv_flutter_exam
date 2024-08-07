import 'package:adv_flutter_exam/modal/modal_page.dart';
import 'package:adv_flutter_exam/provider/provider_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuoteProvider homeProviderTrue =
        Provider.of<QuoteProvider>(context, listen: true);
    QuoteProvider homeProviderFalse =
        Provider.of<QuoteProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('QuotesApp',style: TextStyle(color: Colors.black),),
      ),
      body: FutureBuilder(
        future: homeProviderTrue.fromMap(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: homeProviderTrue.quotesModel!.quotes.length,
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            color: Colors.black
                              ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    homeProviderTrue
                                        .quotesModel!.quotes[index].quote,style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '- ' +
                                          homeProviderTrue.quotesModel!
                                              .quotes[index].author,style: const TextStyle(color: Colors.white),
                                    )),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      onPressed: () {
                                        homeProviderFalse.addFav(
                                            homeProviderTrue.quotesModel!
                                                .quotes[index].quote,
                                            homeProviderTrue.quotesModel!
                                                .quotes[index].author);
                                      },
                                      icon: const Icon(Icons.favorite_border,color: Colors.white,)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.hasError.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).pushNamed('/likePage');
      },child: const Icon(Icons.menu,color: Colors.black,size: 30,),backgroundColor: Colors.white,),
    );
  }
}
