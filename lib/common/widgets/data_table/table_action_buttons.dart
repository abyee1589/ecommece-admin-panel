import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AbTableActionButtons extends StatelessWidget {
  const AbTableActionButtons({
    super.key, 
    this.view = false, 
    this.edit = true, 
    this.delete = true, 
    this.onViwPressed, 
    this.onEditPressed, 
    this.onDeletePressed
  });
  
  final bool view;
  final bool edit;
  final bool delete;
  final VoidCallback? onViwPressed;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(view)
          IconButton(
            onPressed: onViwPressed, 
            icon: const Icon(Iconsax.pen_add, color: AbColors.darkGrey)
          ),
        if(edit)
          IconButton(
            onPressed: onEditPressed, 
            icon: const Icon(Iconsax.eye, color: AbColors.primary)
          ),
        if(delete)
          IconButton(
            onPressed: onDeletePressed, 
            icon: const Icon(Iconsax.trash, color: AbColors.error)
          )
      ],
    );
  }
}