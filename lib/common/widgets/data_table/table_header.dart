import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AbTableHeader extends StatelessWidget {
  const AbTableHeader({super.key, this.onPressed, this.searchOnChanged, required this.buttonText, this.searchController});
  final void Function()? onPressed;
  final void Function(String)? searchOnChanged;
  final String buttonText;
  final TextEditingController? searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: AbDeviceUtils.isDesktopScreen(context) ? 3 : 1,
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(backgroundColor: AbColors.primary, foregroundColor: Colors.white),
                  child: Text(buttonText), 
                ),
              ),
            ],
          )),
        Expanded(
          flex: AbDeviceUtils.isDesktopScreen(context) ? 2 : 1,
          child: TextFormField(
            controller: searchController,
            onChanged: searchOnChanged,
            decoration: const InputDecoration(hintText: 'Search here...', prefixIcon: Icon(Iconsax.search_normal))
          )
        )
      ],
    );
  }
}