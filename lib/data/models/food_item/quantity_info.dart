class QuantityInfo {
  final int minPermitted;
  final int maxPermitted;
  final bool isMinPermittedOptional;
  final int chargeAbove;
  final int refundUnder;

  QuantityInfo({
    required this.minPermitted,
    required this.maxPermitted,
    required this.isMinPermittedOptional,
    required this.chargeAbove,
    required this.refundUnder,
  });

  factory QuantityInfo.fromJson(Map<String, dynamic> json) {
    return QuantityInfo(
      minPermitted: json['Quantity']['MinPermitted'],
      maxPermitted: json['Quantity']['MaxPermitted'],
      isMinPermittedOptional: json['Quantity']['IsMinPermittedOptional'],
      chargeAbove: json['Quantity']['ChargeAbove'],
      refundUnder: json['Quantity']['RefundUnder'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Quantity': {
        'MinPermitted': minPermitted,
        'MaxPermitted': maxPermitted,
        'IsMinPermittedOptional': isMinPermittedOptional,
        'ChargeAbove': chargeAbove,
        'RefundUnder': refundUnder,
      },
    };
  }
}