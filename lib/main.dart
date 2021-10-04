import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        backgroundColor: const Color.fromRGBO(32, 30, 33, 1),
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double leftMargin = 150;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      leftMargin = 320;
    }
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 30, 33, 1),
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(32, 30, 33, 1),
          title: Container(
            margin: EdgeInsets.only(top: 8, left: leftMargin),
            child: const Text(
              'Home',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w100, // light
                  color: Color.fromRGBO(227, 225, 228, 1)),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/upload_icon.png'),
              iconSize: 30,
              color: Colors.grey,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
              iconSize: 30,
              color: Colors.grey,
            ),
          ]),
      body: Stack(children: [SingleChildScrollView(

        child: Column(children: [
          Container(
            color: const Color.fromRGBO(23, 21, 24, 1),
            height: 15,
          ),
          _relatedSongsList(context),
          Container(
            color: const Color.fromRGBO(23, 21, 24, 1),
            height: 15,
          ),
          _chartSongsList(context),
          Container(
            color: const Color.fromRGBO(23, 21, 24, 1),
            height: 15,
          ),
          _uploadContainer(context),
        ]),
      ),  _player(context)]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromRGBO(17, 17, 17, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/bolt.png', width: 30, height: 30),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/menu.png', width: 30, height: 30),
            label: '',
          ),
        ],
        iconSize: 35,
        showSelectedLabels: false,
      ),
    );
  }
}

Widget _player(BuildContext context) {
  double width1 = 90;
  double width2 = 80;
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    width1 = 250;
    width2 = 260;
  }
  return Positioned(top: 545,width: 500, child: Container(
      color: const Color.fromRGBO(54, 54, 62, 1),
      width: double.maxFinite,
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow, color: Colors.white)),
          Container(width: width1),
          Column(
            children: const [
              Text(
                'rain w/ t1de (s&r)',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'sindye',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w100),
              ),
            ],
          ),
          Container(width: width2),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite, color: Colors.white)),
        ],
      )));
}

Widget _relatedSongsList(BuildContext context) {
  String title = 'More of what you like';
  String description = 'Suggestions based on what you\'ve liked or played';
  var songsImages = [
    'assets/1_1.jpg',
    'assets/1_2.jpg',
    'assets/1_3.jpg',
    'assets/1_4.jpg'
  ];
  var songsTitles = [
    'Your Pink Hair (...',
    'Digital Love (Fea...',
    'reach you + tide...',
    'Sony Ericsson'
  ];
  String songTheme = 'Related tracks';
  return _songsList(
      context, title, description, songsImages, songsTitles, songTheme);
}

Widget _chartSongsList(BuildContext context) {
  String title = 'Charts: Top 50';
  String description = 'The most played tracks on SoundCloud this week';
  var songsImages = [
    'assets/2_1.jpg',
    'assets/2_1.jpg',
    'assets/2_2.jpg',
    'assets/2_3.jpg'
  ];
  var songsTitles = [
    'All music genres',
    'Global Beats',
    'Hip Hop & Rap',
    'Electronic'
  ];
  String songTheme = 'Top 50';
  return _songsList(
      context, title, description, songsImages, songsTitles, songTheme);
}

Widget _songsList(BuildContext context, String title, String description,
    songsImages, songsTitles, String songTheme) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: Column(children: [
      Container(
          margin: const EdgeInsets.only(left: 20),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w100),
              ))),
      Container(
          margin: const EdgeInsets.only(left: 20, top: 5),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                description,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w100),
              ))),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: <Widget>[
          _songContainer(context, songsImages[0], songsTitles[0], songTheme),
          _songContainer(context, songsImages[1], songsTitles[1], songTheme),
          _songContainer(context, songsImages[2], songsTitles[2], songTheme),
          _songContainer(context, songsImages[3], songsTitles[3], songTheme),
        ]),
      ),
      Container(
        margin: const EdgeInsets.only(top: 20.0),
        color: const Color.fromRGBO(32, 30, 33, 1),
      ),
    ]),
  );
}

Widget _uploadContainer(BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 65),
      child: Column(children: [
        Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'The Upload',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w100),
                ))),
        Container(
            margin: const EdgeInsets.only(left: 20, top: 5),
            child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Newly posted tracks. Just for you',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w100),
                ))),
        Container(
            margin: const EdgeInsets.all(20),
            child: Image.asset('assets/upload.jpg')),
        Container(
            margin: const EdgeInsets.only(left: 20),
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/avatar.jpg', width: 25, height: 25),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Based on your listening history',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w100),
                      )))
            ]))
      ]));
}

Widget _songContainer(
    BuildContext context, String imageLink, title, description) {
  double width = 1;
  double height = 1;
  var screenSize = MediaQuery.of(context).size;
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    width = 0.5;
    height = 2;
  }
  return Column(children: [
    Container(
      margin: const EdgeInsets.all(15),
      width: screenSize.width * 0.35 * width,
      height: screenSize.height * 0.18 * height,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(imageLink))),
    ),
    Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w100),
        )),
    Container(
        margin: const EdgeInsets.only(top: 7, right: 35),
        child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              description,
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.w100),
            ))),
  ]);
}
