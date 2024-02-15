import 'package:code_dev_reach/Constant/file.url.dart';
import 'package:code_dev_reach/Features/Profile/Model/model.saved.post.dart';
import 'package:code_dev_reach/Features/Profile/Widgets/profile.subwidget.dart';
import 'package:flutter/material.dart';

class SavedPostWidget extends StatefulWidget {
  const SavedPostWidget({
    super.key,
  });
  State<SavedPostWidget> createState() => _savedPostState();
}

class _savedPostState extends State<SavedPostWidget> {
  List<SavedPostModel> savePosts = [
    SavedPostModel(
        mainCategory: "Sports",
        mainTitle: "If you are playing very well then you have to see this..",
        subCategory: "Gymming",
        postedDate: DateTime.now(),
        authorImgUrl: Constant.imgJpeg2,
        authorName: "Desmond"),
    SavedPostModel(
        mainCategory: "Sports",
        mainTitle: "If you are playing very well then you have to see this..",
        subCategory: "Gymming",
        postedDate: DateTime.now(),
        authorImgUrl: Constant.imgJpeg2,
        authorName: "Desmond"),
    SavedPostModel(
        mainCategory: "Sports",
        mainTitle: "If you are playing very well then you have to see this..",
        subCategory: "Gymming",
        postedDate: DateTime.now(),
        authorImgUrl: Constant.imgJpeg2,
        authorName: "Desmond"),
    SavedPostModel(
        mainCategory: "Sports",
        mainTitle: "If you are playing very well then you have to see this..",
        subCategory: "Gymming",
        postedDate: DateTime.now(),
        authorImgUrl: Constant.imgJpeg2,
        authorName: "Desmond"),
    SavedPostModel(
        mainCategory: "Sports",
        mainTitle: "If you are playing very well then you have to see this..",
        subCategory: "Gymming",
        postedDate: DateTime.now(),
        authorImgUrl: Constant.imgJpeg2,
        authorName: "Desmond"),
    SavedPostModel(
        mainCategory: "Sports",
        mainTitle: "If you are playing very well then you have to see this..",
        subCategory: "Gymming",
        postedDate: DateTime.now(),
        authorImgUrl: Constant.imgJpeg2,
        authorName: "Desmond"),
    SavedPostModel(
        mainCategory: "Sports",
        mainTitle: "If you are playing very well then you have to see this..",
        subCategory: "Gymming",
        postedDate: DateTime.now(),
        authorImgUrl: Constant.imgJpeg2,
        authorName: "Desmond"),
  ];
  final ProfileSubWidget profileSubWidget = ProfileSubWidget();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scrollbar(
      interactive: true,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 7,
          itemBuilder: (context, index) {
            return profileSubWidget.saved_post_widget(savePosts[index]);
          }),
    );
  }
}
