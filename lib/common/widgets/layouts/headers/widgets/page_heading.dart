import 'package:flutter/material.dart';

class AbPageHeading extends StatelessWidget {
  const AbPageHeading({super.key, required this.heading, this.rightSideWidget});
  final String heading;
  final Widget? rightSideWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(heading, style: Theme.of(context).textTheme.headlineLarge),
        rightSideWidget ?? const SizedBox()
      ],
    );
  }
}