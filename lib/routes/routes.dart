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

  static const banners = '/banners';
  static const createBanner = '/create-banner';
  static const editBanner = '/edit-banner';

  static const products = '/products';
  static const createProduct = '/create-product';
  static const editProduct = '/edit-product';

  static const customers = '/customers';
  static const createCustomer = '/create_customer';
  static const customerDetails = '/customer_details';


  static List sidebarMenuItems = [
    dashboard,
    media,
    categories,
    brands,
    banners,
    products
  ];
}
