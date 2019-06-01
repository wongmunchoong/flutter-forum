import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Forum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Forum'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Background.png"), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: CardList()));
  }
}

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        StoryCard(
          image: NetworkImage("https://preview.redd.it/hmaajff9vl131.jpg?width=640&crop=smart&auto=webp&s=e3d2173d06b020b0191fa8583ab4d465ba6c9e20"),
          profileImage: NetworkImage("https://styles.redditmedia.com/t5_mg9yg/styles/profileIcon_okt08xsvkuy21.jpg?width=256&height=256&crop=256:256,smart&s=7115f8489eefdb8a9ae20cf7006b0e7f04f3b409"),
          name: "u/SanWhich",
          title: "That'll show her",
          category: "Article"),
        StoryCard(
          image: NetworkImage("https://i.redd.it/jn8k6jzw4j131.jpg"),
          profileImage: NetworkImage("https://styles.redditmedia.com/t5_ov2ac/styles/profileIcon_e2hfy5r2eex21.jpg?width=256&height=256&crop=256:256,smart&s=3f35d2f8c4c9da27cd3364bae175852625a95f77"),
          name: "u/YaSiN0704",
          title: "shit’s gonna be different now",
          category: "Article",),
        StoryCard(
          image: NetworkImage("https://preview.redd.it/ps64ci8cmi131.jpg?width=640&crop=smart&auto=webp&s=cec635d34efcf6ba8e1f87a18f979ce524e1ca47"),
          profileImage: NetworkImage("https://www.redditstatic.com/avatars/avatar_default_19_FFB000.png"),
          name: "u/fibonacci666",
          title: "wokeee",
          category: "Article",),
        StoryCard(
          image: NetworkImage("https://i.redd.it/ahzek8xm6l131.jpg"),
          profileImage: NetworkImage("https://www.redditstatic.com/avatars/avatar_default_11_A5A4A4.png"),
          name: "u/Been-Thr-Done-Tht",
          title: "Oh Yeah ..😁",
          category: "Article",),
      ],
    ));
  }
}

class StoryCard extends StatelessWidget {
    final String name;
  final String title;
  final String category;
  final NetworkImage image;
  final NetworkImage profileImage;

  StoryCard({
    @required this.name,
    @required this.title,
    @required this.category,
    @required this.image,
    @required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
        height: 500.0,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          // the box shawdow property allows for fine tuning as aposed to shadowColor
          boxShadow: [
            new BoxShadow(
                color: Color(0xFF2e2e2e),
                // offset, the X,Y coordinates to offset the shadow
                offset: new Offset(0.0, 8.0),
                // blurRadius, the higher the number the more smeared look
                blurRadius: 20.0,
                spreadRadius: 0.5)
          ],
        ),
        child: DeveloperCard(
          image: this.image,
          profileImage: this.profileImage,
          name: this.name,
          title:this.title,
          category: this.category,
        ));
  }
}

class DeveloperCard extends StatelessWidget {
  final String name;
  final String title;
  final String category;
  final NetworkImage image;
  final NetworkImage profileImage;

  DeveloperCard({
    @required this.name,
    @required this.title,
    @required this.category,
    @required this.image,
    @required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: <Widget>[
            new Positioned(
                left: 0.0,
                right: 0.0,
                top: 0.0,
                child: new Container(
                  width: 500.0,
                  height: 240.0,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero),
                      image: new DecorationImage(
                          fit: BoxFit.cover, image: this.image)),
                )),
            Positioned(
              left: 150.0,
              top: 205.0,
              child: new Container(
                  width: 64.0,
                  height: 64.0,
                  decoration: new BoxDecoration(
                      border: Border.all(
                          width: 4, color: Color.fromARGB(255, 255, 255, 255)),
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill, image: this.profileImage))),
            ),
            Positioned(
                left: 0.0,
                top: 280.0,
                child: new Container(
                  alignment: Alignment(0, 0),
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 40.0,
                  child: new Text(
                    "${this.name}   ·   5h   ·   ${this.category}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                )),
            Positioned(
                left: 0.0,
                top: 350.0,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: 100.0,
                  child: new Text(
                    "${this.title}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24.0),
                  ),
                )),
            Positioned(
                left: 0.0,
                bottom: 0.0,
                child: new Container(
                  padding: EdgeInsets.all(08.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(children: <Widget>[

                  Icon(Icons.thumbs_up_down, color: Colors.grey),
                  Text("    123",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.0),)
                      ],),
                      Row(),
                      Row(),
                   ],
                  ),
                )),
          ],
        );
      },
    );
  }
}
