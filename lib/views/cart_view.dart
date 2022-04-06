import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser_soluciones/controllers/products_controlller.dart';
import 'package:ser_soluciones/models/products.dart';
import 'package:ser_soluciones/utils/AppBars/global_app_bar.dart';
import 'package:ser_soluciones/utils/Utils.dart';
import 'package:ser_soluciones/utils/constans.dart';

class Cart_View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _instance = Get.find<ProductsController>();

    return Scaffold(
      appBar: MyAppBar(
        titleText: "Total",
        context: context,
        icon: false,
      ),
      body: GetBuilder<ProductsController>(
        id: 'products',
        initState: (_) {},
        builder: (_) {
          final List<Products> pro = _.products;
          pro.removeWhere((product) => product.select == 0);
          print(pro);

          return SafeArea(
            child: FutureBuilder<List<Products>>(
                initialData: pro,
                builder: (context, snapshot) {
                  return Column(
                    children: <Widget>[
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: pro.length,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: <Widget>[
                                      Text(pro[index].name),
                                      Text(
                                          '\$${Utils.getCurrency(pro[index].price.toString())}')
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Visibility(
                                        visible: pro[index].quantity > 0,
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
                                                  if (pro[index].select > 0) {
                                                    pro[index].select--;
                                                    _instance
                                                        .update(['products']);
                                                  }
                                                }),
                                          ),
                                        ),
                                      ),
                                      Text(pro[index].quantity > 0
                                          ? pro[index].select.toString()
                                          : 'Agotado'),
                                      Visibility(
                                        visible: pro[index].quantity > 0,
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
                                                  if (pro[index].select + 1 <=
                                                      pro[index].quantity) {
                                                    pro[index].select++;
                                                    _instance
                                                        .update(['products']);
                                                  }
                                                }),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      Obx(() => Visibility(
                            visible: pro.isNotEmpty,
                            child: Text(
                              'Total \$${Utils.getCartTotal(pro)}',
                              style: const TextStyle(fontSize: 24),
                            ),
                          )),
                    ],
                  );
                }),
          );
        },
      ),
    );
  }
}
