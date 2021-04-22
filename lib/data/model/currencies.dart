import 'package:coinhouse_app/data/model/currency.dart';

class Currencies {
  String source;
  Currency uSD;
  Currency eUR;
  Currency gBP;
  Currency aRS;
  Currency cAD;
  Currency aUD;
  Currency jPY;
  Currency cNY;
  Currency bTC;
  List<Currency> listCurrency;

  Currencies(
      {this.source,
      this.uSD,
      this.eUR,
      this.gBP,
      this.aRS,
      this.cAD,
      this.aUD,
      this.jPY,
      this.cNY,
      this.bTC});

  Currencies.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    uSD = json['USD'] != null ? new Currency.fromJson(json['USD']) : null;
    eUR = json['EUR'] != null ? new Currency.fromJson(json['EUR']) : null;
    gBP = json['GBP'] != null ? new Currency.fromJson(json['GBP']) : null;
    aRS = json['ARS'] != null ? new Currency.fromJson(json['ARS']) : null;
    cAD = json['CAD'] != null ? new Currency.fromJson(json['CAD']) : null;
    aUD = json['AUD'] != null ? new Currency.fromJson(json['AUD']) : null;
    jPY = json['JPY'] != null ? new Currency.fromJson(json['JPY']) : null;
    cNY = json['CNY'] != null ? new Currency.fromJson(json['CNY']) : null;
    bTC = json['BTC'] != null ? new Currency.fromJson(json['BTC']) : null;
    _setListCurrency();
  }

  void _setListCurrency() {
    listCurrency = List<Currency>();

    listCurrency.add(uSD);
    listCurrency.add(eUR);
    listCurrency.add(gBP);
    listCurrency.add(aRS);
    listCurrency.add(cAD);
    listCurrency.add(aUD);
    listCurrency.add(jPY);
    listCurrency.add(cNY);
    listCurrency.add(bTC);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    if (this.uSD != null) {
      data['USD'] = this.uSD.toJson();
    }
    if (this.eUR != null) {
      data['EUR'] = this.eUR.toJson();
    }
    if (this.gBP != null) {
      data['GBP'] = this.gBP.toJson();
    }
    if (this.aRS != null) {
      data['ARS'] = this.aRS.toJson();
    }
    if (this.cAD != null) {
      data['CAD'] = this.cAD.toJson();
    }
    if (this.aUD != null) {
      data['AUD'] = this.aUD.toJson();
    }
    if (this.jPY != null) {
      data['JPY'] = this.jPY.toJson();
    }
    if (this.cNY != null) {
      data['CNY'] = this.cNY.toJson();
    }
    if (this.bTC != null) {
      data['BTC'] = this.bTC.toJson();
    }
    return data;
  }

  List<Currency> getListCurrency() {
    return listCurrency;
  }
}
