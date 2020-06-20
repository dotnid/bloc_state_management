import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_bloc2.dart';

class thePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc2>(
        builder: (context) => ColorBloc2(),
        child: secondPage(),
      ),
    );
  }
}

class secondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc2 bloc2 = BlocProvider.of<ColorBloc2>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {
              bloc2.dispatch(ColorEvent2.to_amber);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {
              bloc2.dispatch(ColorEvent2.to_ligth_blue);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            backgroundColor: Colors.green,
          ),
        ],
      ),
      appBar: AppBar(title: Text("Second page"),),
      body: Center(
        child: BlocBuilder<ColorBloc2, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            width: 100,
            height: 100,
            color: currentColor,
            duration: Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
