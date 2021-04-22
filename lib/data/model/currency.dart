class Currency {
  String name;
  double buy;
  double sell;
  double variation;

  Currency({this.name, this.buy, this.sell, this.variation});

  Currency.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    buy = json['buy']; //comprar
    sell = json['sell']; //Vender
    variation = json['variation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['buy'] = this.buy;
    data['sell'] = this.sell;
    data['variation'] = this.variation;
    return data;
  }
}
