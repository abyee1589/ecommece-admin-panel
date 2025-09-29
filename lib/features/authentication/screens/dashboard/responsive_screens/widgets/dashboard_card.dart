import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class AbDashboardCard extends StatelessWidget {
  const AbDashboardCard({
    super.key, 
    required this.title, 
    required this.subTitle, 
    required this.stats,    
    this.icon = Iconsax.arrow_up_3, 
    this.color = AbColors.success,
    this.onTap,
  });

  final String title, subTitle;
  final IconData icon;
  final Color color;
  final int stats;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AbRoundedContainer(
      onTap: onTap,
      padding: const EdgeInsets.all(AbSizes.lg),
      child: Column(
        children: [

          /// Heading
          AbSectionHeading(title: title, textColor: AbColors.textSecondary),
          const SizedBox(height: AbSizes.spaceBtwSections),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(subTitle, style: Theme.of(context).textTheme.headlineMedium)),

              /// Rightside stats
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(icon, color: color, size: AbSizes.iconSm),
                        Text(
                          '$stats%', 
                          style: Theme.of(context).textTheme.titleLarge!.apply(color: color, overflow: TextOverflow.ellipsis)
                        )
                      ]
                    ),
                    SizedBox(
                      width: 135,
                      child: Text(
                        'Compared to December 2025', 
                        style: Theme.of(context).textTheme.labelMedium,
                        // softWrap: true,
                        // maxLines: 2,
                        overflow: TextOverflow.ellipsis
                      ),
                    )
                  ]
                ),
              )
            ]
          )
        ],
      ),
    );
  }
}