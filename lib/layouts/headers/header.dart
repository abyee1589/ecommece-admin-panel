import 'package:ab_ecommerce_admin_panel/common/widgets/images/ab_rounded_image.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AbHeader extends StatelessWidget implements PreferredSizeWidget{
  const AbHeader({super.key, this.scaffoldKey});
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AbColors.white,
        border: Border(bottom: BorderSide(color: AbColors.grey, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AbSizes.md, vertical: AbSizes.sm),
      child: AppBar(
        /// Mobile Menu
        leading: !AbDeviceUtils.isDesktopScreen(context) ? IconButton(onPressed: () => scaffoldKey?.currentState?.openDrawer(), icon: const Icon(Iconsax.menu)) : null,
        /// Search Field
        title: AbDeviceUtils.isDesktopScreen(context) ? SizedBox(
          width: 400,
          child: TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.search_normal),
              hintText: 'Search Anything...'
            ),
          ),
        ) : null,
        actions: [
          if(!AbDeviceUtils.isDesktopScreen(context)) IconButton(icon: const Icon(Iconsax.search_normal), onPressed: (){}),
          IconButton(icon: const Icon(Iconsax.notification), onPressed: (){}),
          const SizedBox(width: AbSizes.spaceBtwItems / 2),

          Row(
            children: [
              const AbRoundedImage(
                width: 40,
                height: 40, 
                padding: 2,
                imageType: ImageType.asset, 
                image: AbImages.user,
              ),
              const SizedBox(width: AbSizes.sm),
              if(!AbDeviceUtils.isMobileScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Coding with Ab', style: Theme.of(context).textTheme.titleLarge),
                    Text('abdibekele2021@gmail.com', style: Theme.of(context).textTheme.labelMedium),
                  ],
                )
            ],
          )
        ],
      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AbDeviceUtils.getAppBarHeight() + 15);
}