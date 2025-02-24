class ProductInfo {
  final int targetMarket;
  final String gtin;
  final String plu;
  final String merchantId;
  final String productType;
  final List<String>? productTraits;
  final List<String>? countriesOfOrigin;

  ProductInfo({
    required this.targetMarket,
    required this.gtin,
    required this.plu,
    required this.merchantId,
    required this.productType,
    this.productTraits,
    this.countriesOfOrigin,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    return ProductInfo(
      targetMarket: json['TargetMarket'] ?? 0,
      gtin: json['Gtin'] ?? '',
      plu: json['Plu'] ?? '',
      merchantId: json['MerchantID'] ?? '',
      productType: json['ProductType'] ?? '',
      productTraits: json['ProductTraits'] != null ? List<String>.from(json['ProductTraits']) : null,
      countriesOfOrigin: json['CountriesofOrigin'] != null ? List<String>.from(json['CountriesofOrigin']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'TargetMarket': targetMarket,
      'Gtin': gtin,
      'Plu': plu,
      'MerchantID': merchantId,
      'ProductType': productType,
      'ProductTraits': productTraits,
      'CountriesofOrigin': countriesOfOrigin,
    };
  }
}
