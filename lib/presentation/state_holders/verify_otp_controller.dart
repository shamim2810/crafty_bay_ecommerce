import 'package:crafty_bay_ecommerce/data/models/cart_model.dart';
import 'package:crafty_bay_ecommerce/data/models/category.dart';
import 'package:crafty_bay_ecommerce/data/models/category_list_model.dart';
import 'package:crafty_bay_ecommerce/data/models/network_response.dart';
import 'package:crafty_bay_ecommerce/data/network_caller/network_caller.dart';
import 'package:crafty_bay_ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> verifyOtp(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.verifyOtp(email, otp),
    );
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
