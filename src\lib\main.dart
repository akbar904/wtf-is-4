
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/text_cubit.dart';
import 'screens/home_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Text Toggle App',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: BlocProvider(
				create: (context) => TextCubit(),
				child: HomeScreen(),
			),
		);
	}
}
