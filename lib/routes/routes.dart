class AbRoutes {
  static const login = '/login';
  static const forgetPassword = '/forget-password';
  static const resetPassword = '/reset-password';
  static const dashboard= '/dashboard';
  static const media= '/media';

  static const categories = '/categories';
  static const createCategory = '/create-category';
  static const editCategory = '/edit-category';

  static const brands = '/brands';
  static const createBrand = '/create-brand';
  static const editBrand = '/edit-brand';


  static List sidebarMenuItems = [
    dashboard,
    media,
    categories,
    brands
  ];
}
