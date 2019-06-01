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
        DeveloperCard(
          business: 'asdasd',
          image: '',
        ),
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
      // child: Text("This is where your content goes")
    );
  }
}

class DeveloperCard extends StatelessWidget {
  final String name;
  final String business;
  final AssetImage image;
  final Widget page;

  DeveloperCard({
    @required this.name,
    @required this.business,
    @required this.image,
    @required this.page,
  });

  @override
  Widget build(BuildContext context) {
    navigate() {
      final route = MaterialPageRoute(builder: (_) => this.page);
      Navigator.of(context).push(route);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final diameter = constraints.minWidth - 84;

        return Card(
          child: GestureDetector(
            onTap: () => navigate(),
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: this.name,
                    child: ClipOval(
                      child: Image(
                        fit: BoxFit.cover,
                        height: diameter,
                        width: diameter,
                        image: this.image,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    this.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    this.business,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
