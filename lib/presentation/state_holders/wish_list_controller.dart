import 'package:crafty_bay_ecommerce/data/models/cart_model.dart';
import 'package:crafty_bay_ecommerce/data/models/category.dart';
import 'package:crafty_bay_ecommerce/data/models/category_list_model.dart';
import 'package:crafty_bay_ecommerce/data/models/network_response.dart';
import 'package:crafty_bay_ecommerce/data/models/product.dart';
import 'package:crafty_bay_ecommerce/data/models/product_list_model.dart';
import 'package:crafty_bay_ecommerce/data/models/wish_list_item.dart';
import 'package:crafty_bay_ecommerce/data/models/wish_list_model.dart';
import 'package:crafty_bay_ecommerce/data/network_caller/network_caller.dart';
import 'package:crafty_bay_ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<WishListItem> _wishList = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<WishListItem> get wishList => _wishList;

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.getWishList,
    );
    if (response.isSuccess) {
      _wishList =
          WishListModel.fromJson(response.responseData).wishList ?? [];
      isSuccess = true;
    } else {
      // why null --> !?
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
