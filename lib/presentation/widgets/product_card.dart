import 'package:crafty_bay_ecommerce/data/models/product.dart';
import 'package:crafty_bay_ecommerce/presentation/screens/product-details_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/utility/app_colors.dart';
import 'package:crafty_bay_ecommerce/presentation/utility/assets_path.dart';
import 'package:crafty_bay_ecommerce/presentation/widgets/wish_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.showAddToWishlist = true, required this.product,
  });

  final bool showAddToWishlist;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductDetailsScreen());
      },
      child: Card(
        elevation: 3,
        surfaceTintColor: Colors.white,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                      product.brand?.brandImg ?? '',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? '',
                      maxLines: 2,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Wrap(
                      spacing: 5,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.start,
                      children: [
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor),
                        ),
                         Wrap(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            Text('${product.star}'),
                          ],
                        ),
                        WishButton(showAddToWishlist: showAddToWishlist),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
