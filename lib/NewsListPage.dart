import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/Controller.dart';


import 'modales/NewsModelas.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final NewsController newsController = Get.put(NewsController());

  void toggleLike(Articles article) {
    article.isLiked = !article.isLiked;
    newsController.NewsDetailsList.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("News List App"),
      //
      // ),
      body: Obx(() {
        return ListView.builder(
          itemCount: newsController.NewsDetailsList.length,
          itemBuilder: (context, index) {
            Articles article =
            newsController.NewsDetailsList[index] as Articles;

            return Card(
              elevation: 8.0,
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side: BorderSide(color: Colors.black26, width: 5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        side: BorderSide(
                          color: Colors.black12,
                          width: 5,
                        ),
                      ),
                    child: GestureDetector(
                      onDoubleTap: ()
                      {

                          toggleLike(article);

                      },
                     child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                       child: SizedBox(
                         height: MediaQuery.of(context).size.height*0.4,
                         width: MediaQuery.of(context).size.width,
                         child: Image.network(
                             "${article.urlToImage}",
                           fit: BoxFit.fill,
                         ),
                       ),
                     ),
                    ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(
                            article.isLiked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: article.isLiked?Colors.red: Colors.black,
                          ),
                          onPressed: () {
                            toggleLike(article);
                          },
                        ),
                        Text(
                          article.isLiked ? "Liked" : "Not Liked",
                          style: TextStyle(
                            color:
                            article.isLiked ? Colors.red : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      const  Text(
                          "Title :",
                          style: TextStyle(color: Colors.red),
                        ),
                        Expanded(
                          child: Text(
                            ' ${article.title}',
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                   const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Author: ${article.author}'),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Description: ${article.description}'),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Url: ${article.url}'),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('PublishedAt: ${article.publishedAt}'),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Content: ${article.content}'),
                      ],
                    ),

                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
