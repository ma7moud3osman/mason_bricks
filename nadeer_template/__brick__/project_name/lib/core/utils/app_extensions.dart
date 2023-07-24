import '../shared_models/name.dart';
import '../shared_models/name_mode.dart';
import 'app_enums.dart';

extension GetStringRole on Roles {
  String get getStringRole {
    switch (this) {
      case Roles.fulfillment:
        return 'fulfillment';
      case Roles.admin:
        return 'admin';
      case Roles.driver:
        return 'driver';
      default:
        return 'user';
    }
  }

  Name get getNameRole {
    switch (this) {
      case Roles.fulfillment:
        return NameModel(ar: 'تحقيق', en: 'fulfillment');
      case Roles.admin:
        return NameModel(ar: 'أدمن', en: 'admin');
      case Roles.driver:
        return NameModel(ar: 'توصيل', en: 'driver');
      default:
        return NameModel(ar: 'مستخدم', en: 'user');
    }
  }
}

extension GetAuthStatus on String {
  Roles get getRole {
    switch (toLowerCase()) {
      case 'fulfillment':
        return Roles.fulfillment;
      case 'admin':
        return Roles.admin;
      case 'driver':
        return Roles.driver;
      default:
        return Roles.user;
    }
  }
}

extension FirstLetterExtension on String {
  String get toFirstUpperLetter =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}

extension LoginFromTypeFromString on String {
  LoginFromType get getLoginType {
    switch (toLowerCase()) {
      case 'local':
        return LoginFromType.local;
      case 'socialmedia':
        return LoginFromType.socialMedia;
      default:
        return LoginFromType.local;
    }
  }
}

extension GetStringLoginFromType on LoginFromType {
  String get getStringLoginFromType {
    switch (this) {
      case LoginFromType.socialMedia:
        return 'socialMedia';
      case LoginFromType.local:
        return 'local';
      default:
        return 'local';
    }
  }
}

extension GetPaymentNames on PaymentMethods {
  String get getPaymentId {
    switch (this) {
      case PaymentMethods.online:
        return 'online';
      case PaymentMethods.cash:
        return 'cash';
      case PaymentMethods.wallet:
        return 'wallet';
    }
  }

  Name get getNameModel {
    switch (this) {
      case PaymentMethods.online:
        return NameModel(ar: 'البطاقة الائتمانية', en: 'Credit card');
      case PaymentMethods.cash:
        return NameModel(ar: 'دفع عند الاستلام', en: 'Cash on delivery');
      case PaymentMethods.wallet:
        return NameModel(ar: 'المحفظة', en: 'Wallet');
    }
  }
}

extension GetPaymentEnum on String {
  PaymentMethods get toPaymentEnum {
    switch (this) {
      case 'online':
        return PaymentMethods.online;
      case 'wallet':
        return PaymentMethods.wallet;
      default:
        return PaymentMethods.cash;
    }
  }
}
