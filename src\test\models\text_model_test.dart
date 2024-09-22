
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:text_toggle_app/models/text_model.dart';

void main() {
	group('TextModel', () {
		test('should correctly instantiate with given text and icon', () {
			// Arrange
			const text = 'Cat';
			const icon = Icons.access_time;

			// Act
			final textModel = TextModel(text: text, icon: icon);

			// Assert
			expect(textModel.text, text);
			expect(textModel.icon, icon);
		});

		test('should serialize to JSON correctly', () {
			// Arrange
			const text = 'Cat';
			const icon = Icons.access_time;
			final textModel = TextModel(text: text, icon: icon);
			final json = {
				'text': text,
				'icon': icon.codePoint,
			};

			// Act
			final result = textModel.toJson();

			// Assert
			expect(result, json);
		});

		test('should deserialize from JSON correctly', () {
			// Arrange
			const text = 'Cat';
			const icon = Icons.access_time;
			final json = {
				'text': text,
				'icon': icon.codePoint,
			};

			// Act
			final result = TextModel.fromJson(json);

			// Assert
			expect(result.text, text);
			expect(result.icon, icon);
		});
	});
}

class TextModel {
	final String text;
	final IconData icon;

	TextModel({required this.text, required this.icon});

	Map<String, dynamic> toJson() {
		return {
			'text': text,
			'icon': icon.codePoint,
		};
	}

	factory TextModel.fromJson(Map<String, dynamic> json) {
		return TextModel(
			text: json['text'],
			icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
		);
	}
}
