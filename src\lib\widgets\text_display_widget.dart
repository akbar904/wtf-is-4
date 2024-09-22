
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.walturn/cubits/text_cubit.dart';

class TextDisplayWidget extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return BlocBuilder<TextCubit, TextState>(
			builder: (context, state) {
				return GestureDetector(
					onTap: () => context.read<TextCubit>().toggleText(),
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Text(state.text),
							SizedBox(width: 8),
							Icon(state.icon),
						],
					),
				);
			},
		);
	}
}
