import 'package:code_dev_reach/Features/Home/main_blog_widgets/blog.list.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Post Feed'),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_active,
                color: Colors.black,
              ),
            ),
          ],
          bottom: TabOfBlogsWidget(),
          backgroundColor: Colors.white54,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            children: [
              TitleBarWidget(),
              Expanded(
                child: TabBarView(children: [
                  HomeBlogList(categoryType: 'Tech'),
                  Center(
                    child: Text('Quant'),
                  ),
                  Center(
                    child: Text('Flutter'),
                  ),
                  Center(
                    child: Text('Android'),
                  ),
                  Center(
                    child: Text('Java'),
                  ),
                  Center(
                    child: Text('Golang'),
                  ),
                  Center(
                    child: Text('Web 3D'),
                  ),
                  Center(
                    child: Text('Block Chain'),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget TabOfBlogsWidget() {
  //list of tabs
  return TabBar(
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      unselectedLabelStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
      indicatorColor: Colors.black,
      labelColor: Colors.black,
      tabs: [
        Tab(
          text: 'Technology',
        ),
        Tab(
          text: 'Quantum',
        ),
        Tab(text: 'Flutter'),
        Tab(
          text: 'Android',
        ),
        Tab(
          text: 'Java',
        ),
        Tab(
          text: 'Golang',
        ),
        Tab(
          text: 'Web & 3D',
        ),
        Tab(
          text: 'BlockChain',
        )
      ]);
}

Widget TitleBarWidget() {
  return //titlebar
      Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Title(
          color: Colors.black,
          child: Text(
            'Category Blogs',
            style: TextStyle(fontSize: 18),
          )),
      TextButton(
        onPressed: () {},
        child: Text(
          'See All',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}
