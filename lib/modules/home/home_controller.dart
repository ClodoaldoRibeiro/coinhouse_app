import 'package:coinhouse_app/data/model/currency.dart';
import 'package:coinhouse_app/data/repository/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  HomeController() {
    getMoedasList();
  }
  final RxList<Currency> currencyList = <Currency>[].obs;
  final RxString erroList = ''.obs;

  Future getMoedasList() async {
    var response = await MoedaRepository.getMoedas();

    if (response.ok) {
      currencyList.assignAll(response.result);
    } else {
      Get.snackbar("Atenção", response.msg,
          backgroundColor: Colors.grey[600], colorText: Colors.white);
      return erroList.value = response.msg;
    }
  }

  PageController pageController;
  TabController tabcontroller;
  RxInt currentPage = 0.obs;

  void onSelect(int page) {
    tabcontroller.animateTo(page,
        duration: Duration(milliseconds: 2), curve: Curves.bounceOut);
    pageController.animateToPage(page,
        duration: Duration(milliseconds: 2), curve: Curves.bounceOut);
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    tabcontroller = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  onClose() {
    pageController.dispose();
    tabcontroller.dispose();
    super.onClose();
  }
}
