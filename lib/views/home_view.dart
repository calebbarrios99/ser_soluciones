// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser_soluciones/controllers/products_controlller.dart';
import 'package:ser_soluciones/models/products.dart';
import 'package:ser_soluciones/services/routes/app_pages.dart';
import 'package:ser_soluciones/utils/Alerts/error_dialog.dart';
import 'package:ser_soluciones/utils/AppBars/global_app_bar.dart';
import 'package:ser_soluciones/utils/constans.dart';
import 'package:ser_soluciones/utils/hive/hive_data.dart';
import 'package:ser_soluciones/utils/widgets/add_modal.dart';
import 'package:ser_soluciones/utils/widgets/wish_list.dart';
import 'package:ser_soluciones/utils/widgets/onwillPop.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  State<Homeview> createState() => _HomepageState();
}

class _HomepageState extends State<Homeview> {
  HiveData hiveData = const HiveData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => onWillPop(context),
        child: GetBuilder<ProductsController>(
          init: ProductsController(),
          id: 'products',
          builder: (_) {
            if (_.loading) {
              return const Center(
                child: Center(
                    child: CircularProgressIndicator(
                  color: kYellowMainColor,
                )),
              );
            }

            return RefreshIndicator(
              onRefresh: _.onInit,
              child: Scaffold(
                appBar: MyAppBar(
                  titleText: "Ser Soluciones",
                  context: context,
                  icon: true,
                  onPress: () {
                    final List<Products> pro = _.products;
                    pro.removeWhere((product) => product.select == 0);
                    _.goCart(pro);
                  },
                ),
                body: WishList(),
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    if (_.auth.user.accessToken == null) {
                      errorAlert(
                          context: context,
                          title: 'Error',
                          desc: 'No existe autenticacion');
                    } else {
                      await addDialog(context, _);
                    }
                  },
                  backgroundColor: kYellowMainColor,
                  child: const Icon(Icons.add),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
