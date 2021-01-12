
class Quote {
  final String quoteText;
  final String quoteData;
  final String quoteAuthor;
  Quote({this.quoteAuthor, this.quoteData, this.quoteText});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quoteText: json['quote']['body'],
      quoteData: json['quote_date'],
      quoteAuthor: json['quote']['author']
    );
  }
}

class QuoteImage {
  final String imageUrl;
  QuoteImage({this.imageUrl});

  factory QuoteImage.fromJson(Map<String, dynamic> json) {
    return QuoteImage(
      imageUrl: json['urls']['raw']
    );
  }
}