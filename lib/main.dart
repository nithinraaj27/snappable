import 'package:flutter/material.dart';
import 'package:snappable/snappable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _snappablekey = GlobalKey<SnappableState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
        title: Text("SNAPPABLE EFFECT",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          letterSpacing: 3,
          fontWeight: FontWeight.w800
        ),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Snappable(
            key: _snappablekey,
            snapOnTap: true,
            child: Container(
              alignment: Alignment.center,
              height: 350,
                width: 450,
              child: Image.asset("assets/thanos.jpg",fit: BoxFit.fill,),
            ),
          ),
          InkWell(
            onTap: (){
              SnappableState state = _snappablekey.currentState;
              if(state.isGone)
                {
                  state.reset();
                }
              else{
                state.snap();
              }
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Text(
                "SNAP",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w800
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

