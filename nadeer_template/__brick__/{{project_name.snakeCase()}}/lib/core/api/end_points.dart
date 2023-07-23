class EndPoints {
  static const bool isTesting = true;
  static const String baseUrl = isTesting ? testBaseUrl : onlineBaseUrl;
  static const String testBaseUrl = 'http://192.168.1.62:5000';
  static const String onlineBaseUrl =
      'https://ecommerce-2-dot-e-commerce-387711.uc.r.appspot.com';
  static const String bucketName =
      'https://storage.googleapis.com/e-commerce_image_storage';

  static const String privacyPath = '$baseUrl/privacy-policy';
  static const String googleAuthPath = '$baseUrl/auth/google';
  static const String appleAuthPath = '$baseUrl/auth/apple';
  static const String getAllAddress = '$baseUrl/address';
  static const String orderPath = '$baseUrl/order';
  static const String statesPath = '$baseUrl/state';
  static const String walletPath = '$baseUrl/transaction';
  static const String orderLogPath = '$baseUrl/orderLogs';
  static const String cartPath = '$baseUrl/cart';
  static const String removeCouponFromCartPath = '$cartPath/rmCoupon';
  static const String userCartPath = '$cartPath/userCart';
  static const String cartLogPath = '$baseUrl/cartlog';
  static const String regionPath = '$baseUrl/region';
  static const String districtPath = '$baseUrl/district';
  static const String catalogPath = '$baseUrl/catalog';
  static const String categoryPath = '$baseUrl/category';
  static const String productPath = '$baseUrl/product';
  static const String adminGetUnassignedProductPath = '$productPath/unassigned';
  static const String adminAssignProductToCategoryPath = '$productPath/bulk';
  static const String adminGetAllProduct = '$productPath/all';
  static const String adminGetProductByCatalogIdPath = '$catalogPath/products';
  static const String productCategoryPath = '$productPath/category';
  static const String businessPath = '$baseUrl/business';
  static const String contactUsPath = '$baseUrl/contactUs';
  static const String favoritePath = '$baseUrl/favorite';
  static const String measurmentPath = '$baseUrl/measurment';
  static const String couponPath = '$baseUrl/coupon';
  static const String verifyCouponPath = '$couponPath/proceed';
  static const String twitterAuthPath = '$baseUrl/auth/twitter';
  static const String emailAuthPath = '$baseUrl/auth/login';
  static const String signupPath = '$baseUrl/auth/signup';
  static const String userPath = '$baseUrl/user';
  static const String getProfilePath = '$userPath/profile';
  static const String changePasswordPath = '$userPath/changePassword';
  static const String forgetPasswordPath = '$userPath/forgetPassword';
  static const String verify = '$userPath/verify';
  static const String imagePath = '$baseUrl/image';
}
