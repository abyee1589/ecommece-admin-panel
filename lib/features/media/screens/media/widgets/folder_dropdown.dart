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
        child: DropdownButtonFormField<MediaCategory>(
        isExpanded: false,
        initialValue: controller.selectedPath.value,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
          ),
        ),
        items: MediaCategory.values
            .map((category) => DropdownMenuItem(
                  value: category,
                  child: Text(category.name.capitalize.toString()),
                ))
            .toList(),
        onChanged: onchanged,
      )
    ));
  }
}