import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Card Stack'),
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
      physics: PageScrollPhysics(),
      children: <Widget>[
        StoryCard(),
        StoryCard(),
        StoryCard(),
      ],
    ));
  }
}

class StoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
        height: 500.0,
        width: 350.0,
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
          image: AssetImage("assets/Background.png"),
          name: "asd",
        ));
  }
}

class DeveloperCard extends StatelessWidget {
  final String name;
  final AssetImage image;

  DeveloperCard({
    @required this.name,
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final diameter = constraints.minWidth - 84;

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
                        topRight:Radius.circular(8.0),
                        topLeft: Radius.circular(8.0), 
                        bottomLeft: Radius.zero, 
                        bottomRight: Radius.zero 
                      ),
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
                        width: 4,
                        color: Color.fromARGB(255, 255, 255, 255)
                      ),
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill, image: this.image))),
            )
          ],
        );
      },
    );
  }
}
