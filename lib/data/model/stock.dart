class Stocks {
  String name;
  String location;
  double points;
  double variation;

  Stocks({this.name, this.location, this.points, this.variation});

  Stocks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    points = json['points'];
    variation = json['variation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['location'] = this.location;
    data['points'] = this.points;
    data['variation'] = this.variation;
    return data;
  }
}
