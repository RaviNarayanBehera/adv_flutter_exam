import 'dart:collection';

class QuotesModel {
  late int total, skip, limit;
  late List<Quotes> quotes;

  QuotesModel(
      {required this.total,
      required this.skip,
      required this.limit,
      required this.quotes});

  factory QuotesModel.fromJson(Map m1) {
    return QuotesModel(
        total: m1['total'],
        skip: m1['skip'],
        limit: m1['limit'],
        quotes: (m1['quotes'] as List).map((e) => Quotes.fromJson(e)).toList());
  }
}

class Quotes {
  late int id;
  late String quote, author;

  Quotes({required this.id, required this.quote, required this.author});

  factory Quotes.fromJson(Map m1) {
    return Quotes(id: m1['id'], quote: m1['quote'], author: m1['author']);
  }
}
