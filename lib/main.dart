import 'package:bookfriendly_main/data/banner_item.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/post.dart';

void main() {
  runApp(MyApp());
}

final List<BannerItem> banners = [
  BannerItem(
      title: "읽어양득\n시즌 10 모집중",
      duration: "2022.01.01-08",
      image: "assets/img/b1.png"
  ),
  BannerItem(
      title: "[속보] 정한결 아직까지 독후감 한 편도\n작성하지 않아",
      duration: "2022.01.11-20",
      image: "assets/img/b1.png"
  ),
  BannerItem(
      title: "오늘의 저녁은\n무엇이 좋을까요?",
      duration: "2023.11.01-08",
      image: "assets/img/b1.png"
  ),
  BannerItem(
      title: "이미지가 이것밖에 없어서 우선은\n이것만 사용해봅니다.",
      duration: "2022.01.01-08",
      image: "assets/img/b1.png"
  ),
  BannerItem(
      title: "신나는 Flutter 개발\nDart는 최고의 언어야!",
      duration: "2022.01.01-08",
      image: "assets/img/b1.png"
  ),
];

final List<Post> posts = [

];

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        )
      ),
      home: MyHomePage(
          title: '읽어양득',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIdx = 0;
  int carouselPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0xFFB07A4D),
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(widget.title, style: TextStyle(color: Color(0xFF6F4A32))),
        centerTitle: false,
        elevation: 0,
        shadowColor: null,
      ),
      body: Container(child: getPage()),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF6F4A32),
        unselectedItemColor: Color(0xFF222222),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "검색",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: "글쓰기",
          ),BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "소통",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: "내 책장",
          ),
        ],
        currentIndex: selectedIdx,
        type: BottomNavigationBarType.fixed,
        onTap: (idx) => {
          setState(() => {
            selectedIdx = idx
          })
        },
      ),
    );
  }

  Widget getPage() {
    if(selectedIdx == 0) {
      return getScrollPage();
    } else {
      return Container();
    }
  }

  Widget getScrollPage() {
    return DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              snap: false,
              floating: false,
              expandedHeight: 200,
              flexibleSpace: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      viewportFraction: 1,
                      initialPage: 0,
                      onPageChanged: (idx, reason) {
                        setState(() {
                          carouselPage = idx;
                        });
                      }
                    ),
                    items: banners.map((banner) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(banner.image),
                                    fit: BoxFit.cover
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 37),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Container(height: 40,),
                                          Text(banner.title,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              height: 1.44,
                                            ),),
                                          Container(height: 46,),
                                          Text(banner.duration,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                height: 1.36,
                                              )
                                          )
                                        ],
                                      )
                                  ),
                                ],
                              )
                          );
                        },);
                    }).toList(),
                  ),
                  Positioned(
                    child: Container(
                      child: Text("${carouselPage + 1} / ${banners.length}",
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.2,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          )),
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 14),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(
                            226, 226, 226, 0.5),
                        borderRadius: BorderRadius.circular(
                            24),
                      ),
                    ),
                    bottom: 20,
                    right: 20,
                  ),
                ]
              )
            ),
            SliverAppBar(
              pinned: true,
              flexibleSpace: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TabBar(
                    labelColor: Color(0xFFB07A4D),
                    unselectedLabelColor: Color(0xFF222222),
                    indicatorColor: Color(0xFFB07A4D),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    isScrollable: true,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.3,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: <Widget>[
                      Tab(
                        text: 'New',
                      ),
                      Tab(
                        text: 'Best',
                      ),
                    ],
              )),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 22, left: 22, top: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/img/profile.png'),
                            Container(width: 7,),
                            Text("블랙밀크티", style: TextStyle(
                              color: Color(0xFF7B543D),
                              fontSize: 11,
                              height: 1.38,
                              fontWeight: FontWeight.w600,
                            ),)
                          ],
                        ),
                        Container(height: 10,),
                        Container(
                          height: 303,
                          width: double.infinity,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: Image.asset('assets/img/post_photo.png'),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: Image.asset('assets/img/post_photo.png'),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: Image.asset('assets/img/post_photo.png'),
                              ),
                            ],
                          ),
                        ),
                        Container(height: 12,),
                        Text("알랭 드 보통", style: TextStyle(
                          fontSize: 12,
                          height: 1.33,
                          color: Color(0xFF222222),
                          fontWeight: FontWeight.w600
                        ),),
                        Container(height: 5,),
                        Text("처음 이 책을 집어 들었을 땐, 개인적인 불안감을 다스리는 방법에 대해\n"
                            "다루는 심리학 책일 거라고 생각했다. 그러나 원제는 'Status\n"
                            "Anxiety'로, 여기서의 불안은 '지위로 인한 불안'이었다. 저자가 ...",
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.33,
                            color: Color(0xFF222222),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
    );
  }

  Widget getMainPage() {
    return Container(
      child: ListView.builder(
              itemBuilder: (ctx, idx) {
                  if (idx == 0) {
                    return CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        viewportFraction: 1,
                      ),
                      items: banners.map((banner) {
                        int idx = banners.indexOf(banner);
                        int length = banners.length;

                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(banner.image),
                                      fit: BoxFit.cover
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 37),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Container(height: 40,),
                                            Text(banner.title,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                height: 1.44,
                                              ),),
                                            Container(height: 46,),
                                            Text(banner.duration,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.36,
                                                )
                                            )
                                          ],
                                        )
                                    ),
                                    Positioned(
                                      child: Container(
                                        child: Text("${idx + 1} / $length",
                                            style: TextStyle(
                                              fontSize: 12,
                                              height: 1.2,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            )),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 14),
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                              226, 226, 226, 0.5),
                                          borderRadius: BorderRadius.circular(
                                              24),
                                        ),
                                      ),
                                      bottom: 20,
                                      right: 20,
                                    )
                                  ],
                                )
                            );
                          },
                        );
                      }).toList(),
                    );
                  }
                  return Container();
                },
                itemCount: 1,
              )
            );
    }
}
