
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.walturn/widgets/text_display_widget.dart';

class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('TextDisplayWidget', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		testWidgets('displays initial text and icon', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextState(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				BlocProvider<TextCubit>(
					create: (_) => textCubit,
					child: MaterialApp(
						home: Scaffold(
							body: TextDisplayWidget(),
						),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('toggles to Dog with person icon when clicked', (WidgetTester tester) async {
			whenListen(
				textCubit,
				Stream.fromIterable([
					TextState(text: 'Cat', icon: Icons.access_time),
					TextState(text: 'Dog', icon: Icons.person),
				]),
				initialState: TextState(text: 'Cat', icon: Icons.access_time),
			);

			await tester.pumpWidget(
				BlocProvider<TextCubit>(
					create: (_) => textCubit,
					child: MaterialApp(
						home: Scaffold(
							body: TextDisplayWidget(),
						),
					),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pumpAndSettle();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
