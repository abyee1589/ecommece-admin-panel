import 'package:ab_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/models/category_model.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/category/edit_category/resposive_screens/desktop_edit_category.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/category/edit_category/resposive_screens/mobile_edit_category.dart';
import 'package:ab_ecommerce_admin_panel/features/shop/screens/category/edit_category/resposive_screens/tablet_edit_category.dart';
import 'package:flutter/material.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = CategoryModel(id: '', name: '', image: '');
    return AbSiteTemplate(desktop: EditCategoryDesktopScreen(category: category,), tablet: EditCategoryTabletScreen(category: category,), mobile: EditCategoryMobileScreen(category: category,));
  }
}