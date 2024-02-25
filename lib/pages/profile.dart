import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_dev_reach/Constant/file.url.dart';
import 'package:code_dev_reach/Features/Profile/Model/model.saved.post.dart';
import 'package:code_dev_reach/Features/Profile/Widgets/profile.save.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../widgets/line.separator.dart';

import 'dart:convert';

//firebase imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late DatabaseReference _databaseReference;
  late CollectionReference profileUsers;
  // late TabController _userTabController;
  SavedPostModel model = SavedPostModel(
      mainCategory: "Games",
      mainTitle: "Please play this game its very good",
      subCategory: "RPG",
      postedDate: DateTime.now(),
      authorImgUrl: Constant.imgJpeg1,
      authorName: "Eminemy");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CollectionReference profileUsers =
        FirebaseFirestore.instance.collection('profile_users');

    _databaseReference = FirebaseDatabase.instance.ref("profiles");
    print(_databaseReference.path);

    // _userTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _userTabController.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference profileUsers =
        FirebaseFirestore.instance.collection('profile_users');

    double width_ = MediaQuery.of(context).size.width;
    double height_ = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: IconButton(
              onPressed: () {
                print("clicked on settings");
              },
              icon: Icon(
                Icons.settings,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white60,
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.center,
                child: separatorUIWidget(context, width_ * 0.95,
                    height_ * 0.005, Color.fromARGB(255, 228, 227, 227), 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: Constant.onlineImg,
                        imageBuilder: (context, imageProvider) {
                          return CircleAvatar(
                            backgroundImage: imageProvider,
                            radius: Constant.profilePicRadius,
                          );
                        },
                        fit: BoxFit.fill,
                        progressIndicatorBuilder: (context, url, progress) {
                          return circularWidget(Constant.imgJpeg1, 44.0);
                        },
                        errorWidget: (context, url, error) =>
                            circularWidget(Constant.imgJpeg1, 44.0),
                      ),
                      goodNameAndUserNameWidget(context),
                    ],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          width: 2.0,
                          style: BorderStyle.solid,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      Map<String, dynamic> map = {
                        "mainCategory": model.mainCategory,
                        "mainTitle": model.mainTitle,
                        "subCategory": model.subCategory,
                        "postedDate": '${model.postedDate}',
                        "authorImgUrl": model.authorImgUrl,
                        "authorName": model.authorName
                      };
                      /*
                       
                        profileUsers
                            .doc(DateTime.now()
                                .millisecondsSinceEpoch
                                .toString())
                            .set(map)
                            .whenComplete(
                                () => print('log - successfully added!'))
                            .onError((error, stackTrace) {
                          print('log error while uploading user - $error');
                          print(
                              'log stackTrace while uploading user - $stackTrace');
                        });
                        */
                      String uid =
                          "${model.authorName}${DateTime.now().millisecondsSinceEpoch}";

                      try {
                        // await _databaseReference.child(uid).set(map).then(
                        //   (value) {
                        //     print('log -> success added.');
                        //   },
                        // );
                        await FirebaseFirestore.instance
                            .collection('PROFILES')
                            .doc(uid)
                            .set(map)
                            .then((value) => print("success response"));
                      } catch (e, st) {
                        print("log -> error $e");
                        print("log -> stackTrace $st");
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.mode_edit,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Edit',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.center,
                child: separatorUIWidget(context, width_ * 0.95,
                    height_ * 0.005, Color.fromARGB(255, 228, 227, 227), 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: userPostAnalyticsWidget("122", "200", "250"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.center,
                child: separatorUIWidget(context, width_ * 0.95,
                    height_ * 0.005, Color.fromARGB(255, 228, 227, 227), 20),
              ),
            ),
            Expanded(
              // height: height_ * 0.53,
              // width: width_ * 0.90,
              child: Padding(
                padding: EdgeInsets.only(top: 4),
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Scaffold(
                    appBar: AppBar(
                      toolbarHeight: 0.0,
                      centerTitle: false,
                      bottom: TabBar(
                        tabAlignment: TabAlignment.fill,
                        unselectedLabelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                        indicatorColor: Colors.black,
                        labelColor: Colors.black,
                        // isScrollable: true,
                        tabs: [
                          Tab(
                            text: 'SAVED',
                          ),
                          Tab(
                            text: 'BONUSES',
                          ),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        SavedPostWidget(),
                        Center(
                          child: Text("Saved bonuses page"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget goodNameAndUserNameWidget(BuildContext context) {
  return Column(
    children: [
      Text(
        'John Snow',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),
      ),
      TextButton(
        onPressed: () {
          print("pressed");
        },
        child: Text(
          '@i_know_anything',
          style: TextStyle(
            color: Colors.grey[90],
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      )
    ],
  );
}

Widget userPostAnalyticsWidget(String reads, String posts, String shares) {
  return Padding(
    padding: EdgeInsets.only(top: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        analyticUiItem(reads, "Reads"),
        analyticUiItem(posts, "Posts"),
        analyticUiItem(shares, "Shares"),
      ],
    ),
  );
}

Widget analyticUiItem(String figures, String label) {
  return Column(
    children: [
      Text(
        figures,
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        label,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 153, 152, 152)),
      )
    ],
  );
}
