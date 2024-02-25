import 'package:code_dev_reach/Features/Home/Util/dummyData.dart';
import 'package:flutter/material.dart';

import '../../../Constant/file.url.dart';
import '../Model/Post.dart';

class HomeBlogList extends StatefulWidget {
  final String categoryType;

  HomeBlogList({required this.categoryType});

  @override
  State<HomeBlogList> createState() => _HomeBlogListState();
}

Future<List<BlogPost>> fetchList() async {
  Future.delayed(Duration(seconds: 6), () {});

  return await Technology().l1;
}

class _HomeBlogListState extends State<HomeBlogList> {
  late Stream<List<BlogPost>> blogPostStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blogPostStream = Stream.fromFuture(fetchList()).asBroadcastStream();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    blogPostStream.listen(null);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: StreamBuilder(
          stream: blogPostStream,
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              return Center(
                child: Text(snapShot.error.toString()),
              );
            }
            if (snapShot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }
            if (snapShot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: snapShot.data!.length,
                  itemBuilder: (context, index) {
                    BlogPost bp1 = snapShot.data![index];

                    return blogCardView(bp1, context);
                  });
            }
            return Center(
              child: Text("Something went wrong"),
            );
          }),
    );
  }
}

Widget blogCardView(BlogPost blogPost, BuildContext context) {
  return SizedBox(
    height: null,
    width: MediaQuery.of(context).size.width,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.deepPurple,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2, top: 2, bottom: 2),
            child: Expanded(
              flex: 1,
              // fit: FlexFit.loose,
              child: _thumbnailPicWidget(Constant.homeIcon),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: EdgeInsets.only(top: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Title(
                      color: Colors.white,
                      child: Text('Technology'),
                    ),
                  ),
                ),
                blogTitleWidget(blogPost.blogPostName),
                Padding(
                  padding: const EdgeInsets.only(right: 2, top: 1),
                  child: Card(
                    margin: EdgeInsets.only(bottom: 4),
                    color: Colors.transparent,
                    child: otherPostOptions(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget otherPostOptions() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.ios_share_outlined,
          color: Colors.black,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.save_rounded,
          color: Colors.black,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.add_reaction,
          color: Colors.orange,
        ),
      ),
    ],
  );
}

Widget _thumbnailPicWidget(String imgUrl) {
  return Card(
    elevation: 0.0,
    child: Image.network(
      Constant.onlineImg,
      width: 140,
      height: 140,
      errorBuilder: (context, error, stackTrace) {
        return _circularWidgetForProfilePage(Constant.imgJpeg3);
      },
      loadingBuilder: (context, child, loadingProgress) =>
          _circularWidgetForProfilePage(Constant.imgJpeg1),
    ),
  );
}

Widget _circularWidgetForProfilePage(String imgUrl) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Image.asset(
      Constant.imgJpeg1,
      fit: BoxFit.cover,
      width: 140,
      height: 140,
    ),
  );
}

Widget blogTitleWidget(String blogTitle) {
  return Row(
    children: [
      Expanded(
        child: Text(
          blogTitle.substring(0),
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
    ],
  );
}
