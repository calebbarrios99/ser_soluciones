import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser_soluciones/controllers/product_detail.dart';
import 'package:ser_soluciones/controllers/products_controlller.dart';
import 'package:ser_soluciones/utils/AppBars/global_app_bar.dart';
import 'package:ser_soluciones/utils/widgets/roundButton.dart';

class ProductDetailView extends StatefulWidget {
  ProductDetailView(this.index);
  int index;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: MyAppBar(
          titleText: "Editar producto",
          context: context,
          icon: false,
        ),
        body: GetBuilder<ProductDetailController>(
          init: ProductDetailController(),
          initState: (_) {},
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: _.productsDetail.name,
                        validator: (value) =>
                            value!.isEmpty ? 'Campo Requerido' : null,
                        onSaved: (newValue) =>
                            _.productsDetail.name = newValue.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.0,
                          color: Colors.black,
                        ),
                        autofocus: true,
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(),

                          // errorStyle: TextStyle(color: Colors.purple),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        initialValue: _.productsDetail.brand,
                        validator: (value) =>
                            value!.isEmpty ? 'Campo Requerido' : null,
                        onSaved: (newValue) =>
                            _.productsDetail.brand = newValue.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.0,
                          color: Colors.black,
                        ),
                        autofocus: true,
                        decoration: const InputDecoration(
                          labelText: 'Marca',
                          border: OutlineInputBorder(),

                          // errorStyle: TextStyle(color: Colors.purple),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        initialValue: _.productsDetail.reference,
                        validator: (value) =>
                            value!.isEmpty ? 'Campo Requerido' : null,
                        onSaved: (newValue) =>
                            _.productsDetail.reference = newValue.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.0,
                          color: Colors.black,
                        ),
                        autofocus: true,
                        decoration: const InputDecoration(
                          labelText: 'Referencia',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        initialValue: _.productsDetail.quantity.toString(),
                        validator: (value) =>
                            value!.isEmpty ? 'Campo Requerido' : null,
                        onSaved: (newValue) => _.productsDetail.quantity =
                            int.parse(newValue.toString()),
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.0,
                          color: Colors.black,
                        ),
                        autofocus: true,
                        decoration: const InputDecoration(
                          labelText: "Cantidad",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        initialValue: _.productsDetail.description,
                        validator: (value) =>
                            value!.isEmpty ? 'Campo Requerido' : null,
                        onSaved: (newValue) =>
                            _.productsDetail.description = newValue.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.0,
                          color: Colors.black,
                        ),
                        autofocus: true,
                        decoration: const InputDecoration(
                            labelText: "Descripción",
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        initialValue: _.productsDetail.price.toString(),
                        validator: (value) =>
                            value!.isEmpty ? 'Campo Requerido' : null,
                        onSaved: (newValue) => _.productsDetail.price =
                            int.parse(newValue.toString()),
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.0,
                          color: Colors.black,
                        ),
                        autofocus: true,
                        decoration: const InputDecoration(
                          labelText: "Precio",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundButton(
                          onPress: () {
                            _formKey.currentState?.save();
                            Get.find<ProductsController>()
                                .UpdateProducts(_.productsDetail, widget.index);
                            print(_.productsDetail.id);
                          },
                          text: 'Actualizar')
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
