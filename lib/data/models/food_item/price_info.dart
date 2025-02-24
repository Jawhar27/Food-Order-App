class PriceInfo {
  final int deliveryPrice;
  final int pickupPrice;
  final int tablePrice;
  final int corePrice;
  final int containerDeposit;

  PriceInfo({
    required this.deliveryPrice,
    required this.pickupPrice,
    required this.tablePrice,
    required this.corePrice,
    required this.containerDeposit,
  });

  factory PriceInfo.fromJson(Map<String, dynamic> json) {
    return PriceInfo(
      deliveryPrice: json['Price']['DeliveryPrice']??0,
      pickupPrice: json['Price']['PickupPrice']??0,
      tablePrice: json['Price']['TablePrice']??0,
      corePrice: json['Price']['CorePrice']??0,
      containerDeposit: json['Price']['ContainerDeposit']??0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Price': {
        'DeliveryPrice': deliveryPrice,
        'PickupPrice': pickupPrice,
        'TablePrice': tablePrice,
        'CorePrice': corePrice,
        'ContainerDeposit': containerDeposit,
      },
    };
  }
}