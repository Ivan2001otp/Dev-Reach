import 'package:code_dev_reach/Constant/file.url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/line.separator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
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
                  CircleAvatar(
                    foregroundImage: AssetImage(Constant.imgJpeg1),
                    backgroundImage: AssetImage(Constant.onlineImg),
                    onBackgroundImageError: (exception, stackTrace) {
                      print("stackTrace-> $stackTrace");
                      print("exception->$exception");
                    },
                    radius: 40,
                  ),
                  goodNameAndUserNameWidget(context),
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
                      onPressed: () {},
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
                      ))
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
            )
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
