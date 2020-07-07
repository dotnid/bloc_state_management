import 'package:blockstatemanagement/second_page.dart';
import 'package:flutter/material.dart';
import 'package:blockstatemanagement/color_bloc.dart';
//DODOT NANDA TRIHANGGORO
void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_amber);
              },
              backgroundColor: Colors.amber,
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_ligth_blue);
              },
              backgroundColor: Colors.lightBlue,
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              heroTag: "btn3",
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return thePage();
                    }));
              },
              child: Icon(Icons.skip_next),
              backgroundColor: Colors.green,
            ),
          ],
        ),
        appBar: AppBar(
          title: Text("Stream Controller & Stream Builder"),
        ),
        body: Center(
            child: StreamBuilder(
          stream: bloc.stateStream,
          initialData: Colors.amber,
          builder: (context, snapshot) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 100,
              height: 100,
              color: snapshot.data,
            );
          },
        )),
      ),
    );
  }
}
