import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personal_assistant/global/app_color.dart';
import 'package:personal_assistant/global/screen_size.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:personal_assistant/core/models/quote_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MotivationWidget extends StatefulWidget {
  @override
  _MotivationWidgetState createState() => _MotivationWidgetState();
}

class _MotivationWidgetState extends State<MotivationWidget> {

  Future<Quote> quote;
  Future<QuoteImage> image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quote = fetchQuote();
    image = fetchImage();
  }

  Future<Quote> fetchQuote() async {
    final response = await http.get('https://favqs.com/api/qotd');

    if (response.statusCode == 200) {
      return Quote.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Quote');
    }
  }
  
  Future<QuoteImage> fetchImage() async {
    final response = await http
        .get('https://api.unsplash.com/photos/random/?client_id=7yiEOPneY5ChQiMkFYtjw0f1epLNof25wqalAu5WKL4');

    if (response.statusCode == 200) {
      return QuoteImage.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) * 0.47,
      height: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: coolGray2
      ),
      child: Stack(
        children: [
          FutureBuilder<QuoteImage>(
            future: image,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container(
                  width: width(context),
                  height: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/placeholders/placeholder.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
              }
              return Container(
                width: width(context) * 0.47,
                height: 180,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: snapshot.data.imageUrl,
                    placeholder: (context, asset) => Image(
                      image: AssetImage(
                        'assets/placeholders/placeholder.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Container(
            height: 180,
            width: width(context) * 0.47,
            color: Color.fromRGBO(6, 9, 16, 0.5),
          ),
          FutureBuilder<Quote>(
            future: quote,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: 180,
                  width: width(context) * 0.47,
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          snapshot.data.quoteText,
                        style: TextStyle(
                          color: appWhite,
                          fontSize: 15,
                          wordSpacing: 1.0
                        ),
                      ),
                      Text(
                        '~ ' + snapshot.data.quoteAuthor,
                        style: TextStyle(
                          color: appWhite
                        ),
                      )
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
