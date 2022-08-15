import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<Color> {
  ColorCubit() : super(Colors.black);

  void switchColor() =>
      emit(state == Colors.black ? Colors.purple : Colors.black);
}
