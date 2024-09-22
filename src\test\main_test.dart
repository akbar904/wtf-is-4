
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:text_toggle_app/main.dart';

void main() {
	group('Main App Initialization', () {
		testWidgets('App initializes and shows HomeScreen', (WidgetTester tester) async {
			// Build our app and trigger a frame.
			await tester.pumpWidget(MyApp());

			// Verify that HomeScreen is displayed.
			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});
}
