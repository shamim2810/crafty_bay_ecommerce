import 'package:crafty_bay_ecommerce/data/models/cart_item.dart';
import 'package:crafty_bay_ecommerce/data/models/cart_list_model.dart';
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

class CartListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<CartItemModel> _cartList = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<CartItemModel> get cartList => _cartList;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.getWishList,
    );
    if (response.isSuccess) {
      _cartList = CartListModel.fromJson(response.responseData).cartList ?? [];
      isSuccess = true;
    } else {
      // why null --> !?
      _errorMessage = response.errorMessage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  double get totalPrice {
    double total = 0;
    for (CartItemModel cartItem in _cartList) {
      total += (double.tryParse(cartItem.qty ?? '1') ?? 1) *
          (double.tryParse(cartItem.product?.price ?? '0') ?? 0);
    }

    return total;
  }
}
