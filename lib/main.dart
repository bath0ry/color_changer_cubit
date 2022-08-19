import 'package:cubit_study/color_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<ColorCubit>(
          create: (BuildContext context) => ColorCubit(),
        ),
      ], child: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color Changer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<ColorCubit, Color>(listener: (context, state) {
              if (state == Colors.purple) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(milliseconds: 500),
                  content: Text('Cor é roxa'),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(milliseconds: 500),
                  content: Text('Cor é preta'),
                ));
              }
            }, builder: (context, state) {
              return GestureDetector(
                onTap: () => context.read<ColorCubit>().switchColor(),
                child: Column(
                  children: [
                    IconButton(
                        alignment: Alignment.topCenter,
                        onPressed: () {
                          context.read<ColorCubit>().switchColor();
                        },
                        icon: Icon(Icons.colorize)),
                    Container(
                      color: state,
                      width: 200,
                      height: 200,
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
