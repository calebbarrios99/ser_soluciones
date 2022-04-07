import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser_soluciones/controllers/products_controlller.dart';
import 'package:ser_soluciones/utils/constans.dart';
import 'package:ser_soluciones/utils/hive/hive_data.dart';
import 'package:slide_to_act/slide_to_act.dart';

final _instance = Get.find<ProductsController>();
final hiveData = HiveData();

void createSlideDialog(
    {required BuildContext context,
    required int productId,
    required int index}) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            Container(
              color: Colors.transparent,
              width: 600,
              child: SlideAction(
                elevation: 0.0,
                height: 40,
                innerColor: kYellowMainColor,
                outerColor: kDarkBlueMainColor,
                alignment: Alignment.center,
                onSubmit: () {
                  Future.delayed(const Duration(microseconds: 1), () async {
                    await _instance.deleteProducts(productId);
                    hiveData.deleteProduct(
                      index,
                    );

                    _instance.updateProductsModel();
                  });
                },
                child: const Text(
                  'Desliza para eliminar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                sliderButtonIcon: const Icon(Icons.delete),
              ),
            )
          ],
        );
      });
}
