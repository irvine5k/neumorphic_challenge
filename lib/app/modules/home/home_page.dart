import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F2F4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildTop(context),
          buildGridButtons(),
          buildLogoutButton()
        ],
      ),
    );
  }

  Container buildTop(BuildContext context) {
    return Container(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Color.lerp(
                          Colors.white,
                          Colors.black,
                          .1,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  NeuContainer(
                    child: Container(
                      width: 40,
                      height: 40,
                      child: Icon(Icons.menu),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              buildSearch(),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Color.lerp(
                      Colors.white,
                      Colors.black,
                      .1,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      suffixIcon: Icon(Icons.search, color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }

  Column buildSearch() {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hi, Zain,',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "What would you like to have, we're offering some services.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            );
  }

  Expanded buildGridButtons() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
          ),
          itemCount: 4,
          itemBuilder: (context, _) => Center(
            child: NeuContainer(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Icon(Icons.extension),
                      Text('Option')
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLogoutButton() {
    return Container(
      margin: EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: 20,
      ),
      child: NeuContainer(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.exit_to_app),
              SizedBox(width: 5),
              Text('Logout'),
            ],
          ),
        ),
      ),
    );
  }
}

class NeuContainer extends StatefulWidget {
  NeuContainer({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _NeuContainerState createState() => _NeuContainerState();
}

class _NeuContainerState extends State<NeuContainer> {
  bool isPressed = false;

  void onPressedDown(PointerDownEvent _) => setState(() {
        isPressed = true;
      });

  void onPressedUp(PointerUpEvent _) => setState(() {
        isPressed = false;
      });

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: onPressedDown,
      onPointerUp: onPressedUp,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF1F2F4),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.lerp(
                Colors.blueGrey.shade100,
                Colors.white,
                .57,
              ),
              Color(0xffF1F2F4),
              Color(0xffF1F2F4),
              Color.lerp(
                Colors.white,
                Colors.black,
                .01,
              ),
            ],
            stops: [
              .1,
              .3,
              .7,
              1,
            ],
          ),
          boxShadow: isPressed
              ? null
              : [
                  BoxShadow(
                    color: Color.lerp(
                      Colors.blueGrey.shade100,
                      Colors.white,
                      .3,
                    ),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(4, 2),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: -Offset(1, 1),
                  ),
                  BoxShadow(
                    color: Color.lerp(
                      Colors.white,
                      Colors.black,
                      .02,
                    ),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: -Offset(4, 2),
                  ),
                ],
        ),
        child: widget.child ??
            Container(
              width: 50,
              height: 50,
            ),
      ),
    );
  }
}
