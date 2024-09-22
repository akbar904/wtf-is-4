
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/text_model.dart';

class TextCubit extends Cubit<TextState> {
	TextCubit() : super(TextState(text: 'Cat', icon: Icons.access_time));

	void toggleText() {
		if (state.text == 'Cat') {
			emit(TextState(text: 'Dog', icon: Icons.person));
		} else {
			emit(TextState(text: 'Cat', icon: Icons.access_time));
		}
	}
}

class TextState {
	final String text;
	final IconData icon;

	TextState({required this.text, required this.icon});
}
