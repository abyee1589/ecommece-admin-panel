import 'package:ab_ecommerce_admin_panel/layouts/headers/sidebars/sidebar_controller.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbMenuItem extends StatelessWidget {
  const AbMenuItem({
    super.key, 
    required this.route, 
    required this.icon, 
    required this.itemName,
  });
  final String route;
  final IconData icon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SidebarController());
    return InkWell(
      onTap: () => menuController.menuOnTap(route),
      onHover: (hovering) => hovering ? menuController.changeHoverItem(route) : menuController.changeHoverItem(''),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(AbSizes.xs),
          child: Container(
            decoration: BoxDecoration(
              color: menuController.isHovering(route) || menuController.isActive(route) ? AbColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(AbSizes.cardRadiusMd)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: AbSizes.lg, top: AbSizes.md, bottom: AbSizes.md, right: AbSizes.md),
                  child: menuController.isActive(route) 
                  ? Icon(icon, size: 22, color: AbColors.white)
                  : Icon(icon, size: 22, color: menuController.isHovering(route) ? AbColors.white : AbColors.darkerGrey),
                ),
                if(menuController.isActive(route) || menuController.isHovering(route))
                  Flexible(child: Text(itemName, style: Theme.of(context).textTheme.bodyMedium!.apply(color: AbColors.white),))
                else 
                  Flexible(child: Text(itemName, style: Theme.of(context).textTheme.bodyMedium!.apply(color: AbColors.darkerGrey),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}