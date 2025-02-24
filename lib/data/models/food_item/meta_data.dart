class MetaData {
  final String? productId;
  final bool? isDealProduct;
  final String? productName;
  final String? unitChartId;
  final String? unitChartName;

  MetaData({
     this.productId,
     this.productName,
     this.unitChartId,
     this.unitChartName,
     this.isDealProduct,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      productId: json['ProductID'] ?? '',
      productName: json['ProductName'] ?? '',
      unitChartId: json['UnitChartID'] ?? '',
      unitChartName: json['UnitChartName'] ?? '',
      isDealProduct: json['IsDealProduct'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ProductID': productId,
      'ProductName': productName,
      'UnitChartID': unitChartId,
      'UnitChartName': unitChartName,
      'IsDealProduct':isDealProduct,
    };
  }
}
