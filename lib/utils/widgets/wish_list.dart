import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser_soluciones/controllers/products_controlller.dart';
import 'package:ser_soluciones/models/products.dart';
import 'package:ser_soluciones/utils/Utils.dart';
import 'package:ser_soluciones/utils/constans.dart';
import 'package:logger/logger.dart';
import 'package:ser_soluciones/utils/widgets/slide_to_act_dialog.dart';

class WishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    final _instance = Get.find<ProductsController>();

    return ListView.builder(
      itemBuilder: (context, index) {
        Products products = _instance.products[index];

        return InkWell(
          onLongPress: () {
            logger.d(products.id);
            createSlideDialog(
                context: context, productId: products.id!, index: index);
          },
          onTap: () {
            _instance.productDetail(products, index);
          },
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text(products.name),
                      Text('\$${Utils.getCurrency(products.price.toString())}')
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Visibility(
                        visible: products.quantity > 0,
                        child: ClipOval(
                          child: Material(
                            color: kYellowMainColor,
                            child: InkWell(
                              splashColor: Colors.red,
                              child: const SizedBox(
                                width: 35.0,
                                height: 35.0,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () {
                                if (products.select > 0) {
                                  products.select--;
                                  _instance.update(['products']);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Obx(() => Text(products.quantity > 0
                          ? products.select.obs.toString()
                          : 'Agotado')),
                      Visibility(
                        visible: products.quantity > 0,
                        child: ClipOval(
                          child: Material(
                            color: kYellowMainColor,
                            child: InkWell(
                              splashColor: Colors.green,
                              child: const SizedBox(
                                width: 35.0,
                                height: 35.0,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () {
                                if (products.select + 1 <= products.quantity) {
                                  products.select++;
                                  _instance.update(['products']);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: _instance.products.length,
    );
  }
}
