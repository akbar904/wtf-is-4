
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_toggle_app/cubits/text_cubit.dart';

// Mocking TextCubit for testing
class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('TextCubit', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = TextCubit();
		});

		tearDown(() {
			textCubit.close();
		});

		test('initial state is TextState with text "Cat" and clock icon', () {
			expect(textCubit.state.text, 'Cat');
			expect(textCubit.state.icon, Icons.access_time);
		});

		blocTest<TextCubit, TextState>(
			'emits [TextState(text: "Dog", icon: Icons.person)] when toggleText is called',
			build: () => textCubit,
			act: (cubit) => cubit.toggleText(),
			expect: () => [
				isA<TextState>().having((state) => state.text, 'text', 'Dog')
					.having((state) => state.icon, 'icon', Icons.person),
			],
		);

		blocTest<TextCubit, TextState>(
			'emits [TextState(text: "Cat", icon: Icons.access_time)] when toggleText is called twice',
			build: () => textCubit,
			act: (cubit) {
				cubit.toggleText();
				cubit.toggleText();
			},
			expect: () => [
				isA<TextState>().having((state) => state.text, 'text', 'Dog')
					.having((state) => state.icon, 'icon', Icons.person),
				isA<TextState>().having((state) => state.text, 'text', 'Cat')
					.having((state) => state.icon, 'icon', Icons.access_time),
			],
		);
	});
}
