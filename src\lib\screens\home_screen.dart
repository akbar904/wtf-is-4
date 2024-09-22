
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_toggle_app/cubits/text_cubit.dart';
import 'package:text_toggle_app/widgets/text_display_widget.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Text Toggle App'),
			),
			body: Center(
				child: BlocBuilder<TextCubit, TextState>(
					builder: (context, state) {
						return GestureDetector(
							onTap: () => context.read<TextCubit>().toggleText(),
							child: TextDisplayWidget(
								text: state.text,
								icon: state.icon,
							),
						);
					},
				),
			),
		);
	}
}
