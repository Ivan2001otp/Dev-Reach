import 'package:code_dev_reach/Features/Profile/Model/model.saved.post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Constant/file.url.dart';

class ProfileSubWidget {
  Widget saved_post_widget(SavedPostModel model) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Card(
        color: Colors.grey[200],
        child: Padding(
          padding: EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 4),
          child: Column(
            children: [
              Row(
                //category of post and its subcategory
                children: [
                  _categoryWidget(model.mainCategory),
                  SizedBox(
                    width: 4,
                  ),
                  _categoryWidget(model.subCategory),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: EdgeInsets.only(left: 1, right: 1),
                child: Row(
                  //post title
                  children: [
                    Expanded(
                      child: Text(
                        model.mainTitle,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      //autors image
                      _authorsPicWidget(model.authorImgUrl),
                      //auttorsname
                      Text(
                        model.authorName.length > 10
                            ? model.authorName.substring(0, 9)
                            : model.authorName,
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.donut_large,
                        color: const Color.fromARGB(31, 43, 33, 33),
                      ),
                      SizedBox(
                        width: 10,
                      ),

                      Text('Aug 12, 2002'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.save_as,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String dateFormatter(DateTime? dateTime) {
    if (dateTime != null) {
      String dateFormatter = DateFormat("yyyy-MM-dd").format(dateTime);
      return dateFormatter;
    }
    return "";
  }

  Widget _authorsPicWidget(String imgUrl) {
    return Card(
      elevation: 0.0,
      child: Image.network(
        Constant.onlineImg,
        width: 40,
        height: 40,
        errorBuilder: (context, error, stackTrace) {
          return _circularWidgetForProfilePage(Constant.imgJpeg3);
        },
        loadingBuilder: (context, child, loadingProgress) =>
            _circularWidgetForProfilePage(Constant.imgJpeg1),
      ),
    );
  }

  Widget _categoryWidget(String categoryName) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Text(
            categoryName,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

Widget _circularWidgetForProfilePage(String imgUrl) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(6),
    child: Image.asset(
      Constant.imgJpeg1,
      fit: BoxFit.cover,
      width: 40,
      height: 40,
    ),
  );
}
