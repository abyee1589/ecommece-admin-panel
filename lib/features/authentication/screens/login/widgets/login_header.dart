import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../controllers/user_controller.dart';

class AbLoginHeader extends StatelessWidget {
  const AbLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Image(width: 100, height: 100, image: AssetImage(AbImages.darkAppLogo)),
          const SizedBox(height: AbSizes.spaceBtwSections),
          Text(AbTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: AbSizes.sm,),
          Text(AbTexts.loginSubTile, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

