import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
        home: Home()
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my first app'),
        centerTitle: true,
        backgroundColor: Colors.red[600],

      ),
      body:
      Row(
        children: [
          Expanded(
              flex: 3,
              child: Image.asset('assets/space-2.jpg')
          ),
          Expanded(
            flex: 3,
            child: Container(
                padding: EdgeInsets.all(30.0),
                color: Colors.cyan,
                child: Text('1'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.pinkAccent,
              child: Text('2'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.amber,
              child: Text('3'),
            ),
          )
        ],
      ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     Row(
      //       children: [
      //         Text('hello'),
      //         Text('world'),
      //       ],
      //     ),
      //     Container(
      //         padding: EdgeInsets.all(30.0),
      //         color: Colors.pinkAccent,
      //         child: Text('two')
      //     ),
      //     Container(
      //       padding: EdgeInsets.all(40.0),
      //       color: Colors.amber,
      //       child: Text('three'),
      //     ),
      //     Container(
      //       padding: EdgeInsets.all(20.0),
      //       color: Colors.cyan,
      //       child: Text('one')
      //     )
      //   ],
      // )


      //Row
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text('hello world'),
      //     FlatButton(
      //         onPressed: () {},
      //         color: Colors.amber,
      //         child: Text('click me')
      //     ),
      //     Container(
      //       color: Colors.cyan,
      //       padding: EdgeInsets.all(30.0),
      //       child: Text('inside container'),
      //     )
      //   ],
      // )


      // Padding(
      //   padding: EdgeInsets.all(90.0),
      //   child: Text('hello'),
      // )
      // Container(
      //   // padding: EdgeInsets.all(20.0),
      //   // padding: EdgeInsets.symmetric(30.0, 10.0),
      //   padding: EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
      //   margin: EdgeInsets.all(30.0),
      //   color: Colors.grey[400],
      //   child: Text('hello'),
      // )


      // Center(
      //   child: IconButton(
      //     onPressed: () {
      //       print('you clicked me');
      //     },
      //     icon: Icon(Icons.alternate_email),
      //     color: Colors.amber,
      //   )
      //
      //   // child: RaisedButton.icon(
      //   //     onPressed: (){},
      //   //     icon: Icon(Icons.mail),
      //   //     label: Text('mail me'),
      //   //     color: Colors.amber,
      //   // )
      //
      //   // child: FlatButton(
      //   //     onPressed: () {
      //   //       print('you clicked me');
      //   //     },
      //   //     child: Text('click me'),
      //   //     color: Colors.lightBlue
      //   // )
      //
      //   // child: RaisedButton(
      //   //   onPressed: () {
      //   //   },
      //   //   child: Text('click me'),
      //   //   color: Colors.lightBlue
      //   // )
      //
      //   // child: Icon(
      //   //   Icons.airport_shuttle,
      //   //   color: Colors.lightBlue,
      //   //   size: 50.0,
      //   // ),
      //


      //
      //   // child: Image.asset('assets/space-1.jpg')
      //   // Image(
      //   //   image: AssetImage('assets/space-3.jpg'),
      //   //   // image: NetworkImage('https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-8/myapp/assets/space-2.jpg')
      //   // )
      //
      //   // Text('hello ninjas!',
      //   //     style: TextStyle(
      //   //       fontSize: 20.0,
      //   //       fontWeight: FontWeight.bold,
      //   //       letterSpacing: 2.0,
      //   //       color: Colors.grey[600],
      //   //       fontFamily: 'IndieFlower',
      //   //     )),
      // ),
      // floatingActionButton: FloatingActionButton(
      // onPressed: ()
      // {},
      // child: Text('click'),
      // backgroundColor: Colors.red[600],
      // ),
    );
  }
}
