import 'package:flutter_dotenv/flutter_dotenv.dart';

class kUrl {
  static String _baseUrl = dotenv.env['BASE_URL'] ?? 'FALL_BACK_TEXT';

  static String loginUser = '$_baseUrl/auth/login';
  static String registerUser = '$_baseUrl/auth/register';
  static String verifyOtp = '$_baseUrl/auth/verify-otp';
  static String resendOtp = '$_baseUrl/auth/resend-otp';
  static String getUser = '$_baseUrl/profile';
  static String getWallet = '$_baseUrl/wallets';
  static String createSavingsPlan = '$_baseUrl/savings/plan';

  static String profileUpdate = '$_baseUrl/profile/update';
  static String getWalletTrxns = '$_baseUrl/wallets/transactions';
  static String getSavingsBal = '$_baseUrl/savings/balance';
  static String getActiveSavings = '$_baseUrl/savings/my-plans';
  static String getUploadedAccounts = '$_baseUrl/accounts';
  static String getBanks = '$_baseUrl/payments/flutterwave/banks';

  static String getAirportLocations = '$_baseUrl/duffel/locations';

  static String forgotPwd = '$_baseUrl/auth/reset';
  static String resetPwd = '$_baseUrl/auth/reset-password';

  static String getCountries = '$_baseUrl/country';
}
