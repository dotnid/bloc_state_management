import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent2 { to_amber, to_ligth_blue }

class ColorBloc2 extends Bloc<ColorEvent2, Color> {
  Color _color = Colors.amber;

  @override
  Color get initialState => Colors.amber;

  @override
  Stream<Color> mapEventToState(ColorEvent2 event2) async* {
    _color = (event2 == ColorEvent2.to_amber) ? Colors.amber : Colors.lightBlue;
    yield _color;
  }
}
