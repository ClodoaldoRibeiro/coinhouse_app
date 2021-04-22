import 'dart:async';

import 'package:coinhouse_app/data/model/currency.dart';
import 'package:coinhouse_app/modules/home/home_controller.dart';
import 'package:coinhouse_app/modules/home/widget/app_drawer.dart';
import 'package:coinhouse_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Coin House",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        //  drawer: AppDrawer(),
        body: _pageView(),
        bottomNavigationBar: _bottomNavigationBar());
  }

  Widget _bottomNavigationBar() {
    return TabBar(
      controller: controller.tabcontroller,
      labelColor: AppColors.PRIMARY_COLOR,
      indicatorColor: AppColors.PRIMARY_COLOR,
      isScrollable: false,
      onTap: (pagina) {
        controller.onSelect(pagina);
      },
      tabs: [
        Tab(
          child: Text(
            "Moedas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            "Bolsas",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            "Favorite",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _pageView() {
    return PageView(
      onPageChanged: (pagina) {
        controller.onSelect(pagina);
      },
      controller: controller.pageController,
      children: [
        Obx(() {
          return ListView.builder(
            itemCount: controller.currencyList.isEmpty
                ? 0
                : controller.currencyList.length,
            itemBuilder: (context, index) {
              Currency moeda = controller.currencyList[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Card(
                  child: ExpansionTile(
                    title: Text(
                      "${moeda.name}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.PRIMARY_COLOR),
                    ),
                    trailing: Text(
                      moeda.buy != null
                          ? "R\$ ${moeda.buy.toStringAsFixed(2)}"
                          : null,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.MATERIAL_PRIMARY_COLOR[300]),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 0, bottom: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(moeda.buy != null
                                ? "Comprar: R\$ ${moeda.buy.toStringAsFixed(2)}"
                                : "Comrar: ?"),
                            SizedBox(
                              height: 10,
                            ),
                            Text(moeda.sell != null
                                ? "Vender: R\$ ${moeda.sell.toStringAsFixed(2)}"
                                : "Vender: "),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              moeda.variation != null
                                  ? "Variação: ${moeda.variation.toStringAsFixed(2)}"
                                  : "Variação: ?",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
        Container(
          child: Icon(
            Icons.shopping_basket,
            size: 120,
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
        Container(
          child: Icon(
            Icons.favorite,
            size: 120,
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
      ],
    );
  }
}
