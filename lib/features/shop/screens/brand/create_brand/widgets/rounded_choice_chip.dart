import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ab_ecommerce_admin_panel/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';

class AbChoiceChip extends StatelessWidget {
  const AbChoiceChip({super.key, required this.text, required this.selected, this.onSelected});
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent), 
      child: ChoiceChip(
        avatar: AbHelperFunctions.getColor(text) != null
          ? AbCircularContainer(width: 50, height: 50, backgroundColor: AbHelperFunctions.getColor(text)!)
          : null,
        selected: selected,
        onSelected: onSelected,
        checkmarkColor: Colors.white,
        color: WidgetStateProperty.resolveWith((states) {
          if (AbHelperFunctions.getColor(text) != null) {
            return AbHelperFunctions.getColor(text)!;
          }
          if (states.contains(WidgetState.selected)) {
            return AbColors.primary;
          }
          return Colors.grey.shade200; // default background when unselected
        }),
        labelStyle: TextStyle(color: selected ? Colors.white : null),
        shape: AbHelperFunctions.getColor(text) != null ? const CircleBorder() : null,
        label: AbHelperFunctions.getColor(text) == null ? Text(text) : const SizedBox(),
        padding: AbHelperFunctions.getColor(text) != null ? const EdgeInsets.all(0) : null,
        labelPadding: AbHelperFunctions.getColor(text) != null ? const EdgeInsets.all(0) : null,
      )
    );
  }
}