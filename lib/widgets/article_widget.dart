import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_assistant/core/models/article_model.dart';
import 'package:personal_assistant/global/app_color.dart';
import 'package:personal_assistant/global/screen_size.dart';
import 'package:provider/provider.dart';

class ArticleWidget extends StatefulWidget {
  @override
  _ArticleWidgetState createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) * 0.47,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: coolGray
      ),
      child: Consumer<NewsModel>(
        builder: (context, newsModel, child) {
          if(newsModel.randomArticle == null) {
            return Center(
                child: Container(
                    child: CircularProgressIndicator(),
                  height: 40, width: 40,
                )
            );
          }

          return Stack(
            children: [
              Container(
                height: 80,
                width: width(context) * 0.47,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: newsModel.randomArticle.urlToImage,
                    placeholder: (context, asset) => Image(
                      image: AssetImage(
                          'assets/placeholders/placeholder.png'
                      ),
                      fit: BoxFit.fill,
                    ),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                          )
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 180,
                width: width(context) * 0.47,
                color: Color.fromRGBO(6, 9, 16, 0.8),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 4, right: 4
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50, width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: CachedNetworkImage(
                            imageUrl: newsModel.randomArticle.urlToImage,
                            placeholder: (context, asset) => Image(
                              image: AssetImage(
                                'assets/placeholders/placeholder.png'
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
                      ),
                      SizedBox(width: 5,),
                      Flexible(
                        flex: 1,
                        child: Text(
                          newsModel.randomArticle.title.length < 70 ?
                          "${newsModel.randomArticle.title}" :
                          "${newsModel.randomArticle.title.substring(0, 70)}...",
                          style: TextStyle(
                            color: appWhite
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
