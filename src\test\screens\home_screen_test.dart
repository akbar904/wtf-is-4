
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:text_toggle_app/cubits/text_cubit.dart';
import 'package:text_toggle_app/screens/home_screen.dart';
import 'package:text_toggle_app/widgets/text_display_widget.dart';

class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		testWidgets('should display initial text and icon', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>(
						create: (_) => textCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('should display updated text and icon after tap', (WidgetTester tester) async {
			whenListen(
				textCubit,
				Stream.fromIterable([
					TextState(text: 'Cat', icon: Icons.access_time),
					TextState(text: 'Dog', icon: Icons.person),
				]),
				initialState: TextState(text: 'Cat', icon: Icons.access_time),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>(
						create: (_) => textCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);

			await tester.tap(find.byType(TextDisplayWidget));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
