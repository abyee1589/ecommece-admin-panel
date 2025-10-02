import 'package:ab_ecommerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MediaFolderDropdown extends StatelessWidget {
  const MediaFolderDropdown({super.key, this.onchanged});
  final void Function(MediaCategory?)? onchanged;

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Obx(
      () => SizedBox(
        width: 140,
        child: DropdownButtonFormField(
          isExpanded: false,
          initialValue: controller.selectedPath.value,
          items: MediaCategory.values.map((category) => DropdownMenuItem(
            value: category,
            child: Text(category.name.capitalize.toString()))).toList(),
          onChanged: onchanged,
        ),
      ),
    );
  }
}