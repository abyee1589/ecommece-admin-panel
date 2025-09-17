import 'package:ab_ecommerce_admin_panel/common/widgets/images/ab_circular_image.dart';
import 'package:ab_ecommerce_admin_panel/layouts/headers/sidebars/menu/menu_item.dart';
import 'package:ab_ecommerce_admin_panel/routes/routes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AbSideBar extends StatelessWidget {
  const AbSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: AbColors.white,
          border: Border(right: BorderSide(color: AbColors.grey, width: 1))
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AbCircularImage(width: 100, height: 100, image: AbImages.user, backgroundColor: Colors.transparent),
              const SizedBox(height: AbSizes.spaceBtwSections),
              Padding(
                padding: const EdgeInsets.all(AbSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('MENU', style: Theme.of(context).textTheme.bodySmall!.apply(letterSpacingDelta: 1.2)),
                    const AbMenuItem(icon: Iconsax.status, itemName: 'Dashboard', route: AbRoutes.home),
                    const AbMenuItem(icon: Iconsax.image, itemName: 'Media', route: AbRoutes.search),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}