class NutrientData {
  final Calories calories;
  final Kilojules kilojules;
  final ServingSize servingSize;
  final int numberOfServings;
  final Interval numberOfServingIntervals;
  final NetQuantity netQuantity;
  final CaloriesPerServing caloriesPerServing;
  final KilojulesPerServing kilojulesPerServing;
  final Fat fat;
  final SaturatedFattyAcids saturatedFattyAcids;
  final Carbohydrates carbohydrates;
  final Sugar sugar;
  final Protein protein;
  final Salt salt;

  NutrientData({
    required this.calories,
    required this.kilojules,
    required this.servingSize,
    required this.numberOfServings,
    required this.numberOfServingIntervals,
    required this.netQuantity,
    required this.caloriesPerServing,
    required this.kilojulesPerServing,
    required this.fat,
    required this.saturatedFattyAcids,
    required this.carbohydrates,
    required this.sugar,
    required this.protein,
    required this.salt,
  });

  factory NutrientData.fromJson(Map<String, dynamic> json) {
    return NutrientData(
      calories: Calories.fromJson(json['Calories']),
      kilojules: Kilojules.fromJson(json['Kilojules']),
      servingSize: ServingSize.fromJson(json['ServingSize']),
      numberOfServings: json['NumberofServings'] ?? 0,
      numberOfServingIntervals: Interval.fromJson(json['NumberofServingIntervals']),
      netQuantity: NetQuantity.fromJson(json['NetQuantity']),
      caloriesPerServing: CaloriesPerServing.fromJson(json['CaloriesperServing']),
      kilojulesPerServing: KilojulesPerServing.fromJson(json['KilojulesperServing']),
      fat: Fat.fromJson(json['Fat']),
      saturatedFattyAcids: SaturatedFattyAcids.fromJson(json['SaturatedFattyAcids']),
      carbohydrates: Carbohydrates.fromJson(json['Carbohydrates']),
      sugar: Sugar.fromJson(json['Sugar']),
      protein: Protein.fromJson(json['Protein']),
      salt: Salt.fromJson(json['Salt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Calories': calories.toJson(),
      'Kilojules': kilojules.toJson(),
      'ServingSize': servingSize.toJson(),
      'NumberofServings': numberOfServings,
      'NumberofServingIntervals': numberOfServingIntervals.toJson(),
      'NetQuantity': netQuantity.toJson(),
      'CaloriesperServing': caloriesPerServing.toJson(),
      'KilojulesperServing': kilojulesPerServing.toJson(),
      'Fat': fat.toJson(),
      'SaturatedFattyAcids': saturatedFattyAcids.toJson(),
      'Carbohydrates': carbohydrates.toJson(),
      'Sugar': sugar.toJson(),
      'Protein': protein.toJson(),
      'Salt': salt.toJson(),
    };
  }
}

class Calories {
  final EnergyInterval energyInterval;
  final int displayType;

  Calories({
    required this.energyInterval,
    required this.displayType,
  });

  factory Calories.fromJson(Map<String, dynamic> json) {
    return Calories(
      energyInterval: EnergyInterval.fromJson(json['EnergyInterval']),
      displayType: json['DisplayType'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'EnergyInterval': energyInterval.toJson(),
      'DisplayType': displayType,
    };
  }
}

class Kilojules {
  final EnergyInterval energyInterval;
  final int displayType;

  Kilojules({
    required this.energyInterval,
    required this.displayType,
  });

  factory Kilojules.fromJson(Map<String, dynamic> json) {
    return Kilojules(
      energyInterval: EnergyInterval.fromJson(json['EnergyInterval']),
      displayType: json['DisplayType'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'EnergyInterval': energyInterval.toJson(),
      'DisplayType': displayType,
    };
  }
}

class EnergyInterval {
  final int lower;
  final int upper;

  EnergyInterval({
    required this.lower,
    required this.upper,
  });

  factory EnergyInterval.fromJson(Map<String, dynamic> json) {
    return EnergyInterval(
      lower: json['Lower'] ?? 0,
      upper: json['Upper'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Lower': lower,
      'Upper': upper,
    };
  }
}

class ServingSize {
  final String measurementType;
  final WeightedInterval weightedInterval;
  final VolumenInterval volumenInterval;
  final CountInterval countInterval;

  ServingSize({
    required this.measurementType,
    required this.weightedInterval,
    required this.volumenInterval,
    required this.countInterval,
  });

  factory ServingSize.fromJson(Map<String, dynamic> json) {
    return ServingSize(
      measurementType: json['MeasurementType'] ?? '',
      weightedInterval: WeightedInterval.fromJson(json['WeightedInterval']),
      volumenInterval: VolumenInterval.fromJson(json['VolumenInterval']),
      countInterval: CountInterval.fromJson(json['CountInterval']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'MeasurementType': measurementType,
      'WeightedInterval': weightedInterval.toJson(),
      'VolumenInterval': volumenInterval.toJson(),
      'CountInterval': countInterval.toJson(),
    };
  }
}

class WeightedInterval {
  final Interval interval;
  final Weight weight;

  WeightedInterval({
    required this.interval,
    required this.weight,
  });

  factory WeightedInterval.fromJson(Map<String, dynamic> json) {
    return WeightedInterval(
      interval: Interval.fromJson(json['Interval']),
      weight: Weight.fromJson(json['Weight']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Interval': interval.toJson(),
      'Weight': weight.toJson(),
    };
  }
}

class Weight {
  final String unitType;

  Weight({
    required this.unitType,
  });

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      unitType: json['UnitType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'UnitType': unitType,
    };
  }
}

class VolumenInterval {
  final Interval interval;
  final Volume volume;

  VolumenInterval({
    required this.interval,
    required this.volume,
  });

  factory VolumenInterval.fromJson(Map<String, dynamic> json) {
    return VolumenInterval(
      interval: Interval.fromJson(json['Interval']),
      volume: Volume.fromJson(json['Volume']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Interval': interval.toJson(),
      'Volume': volume.toJson(),
    };
  }
}

class Volume {
  final String unitType;

  Volume({
    required this.unitType,
  });

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      unitType: json['UnitType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'UnitType': unitType,
    };
  }
}

class CountInterval {
  final Interval interval;
  final Count count;

  CountInterval({
    required this.interval,
    required this.count,
  });

  factory CountInterval.fromJson(Map<String, dynamic> json) {
    return CountInterval(
      interval: Interval.fromJson(json['Interval']),
      count: Count.fromJson(json['Count']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Interval': interval.toJson(),
      'Count': count.toJson(),
    };
  }
}

class Count {
  final String unitType;

  Count({
    required this.unitType,
  });

  factory Count.fromJson(Map<String, dynamic> json) {
    return Count(
      unitType: json['UnitType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'UnitType': unitType,
    };
  }
}

class Interval {
  final int lower;
  final int upper;

  Interval({
    required this.lower,
    required this.upper,
  });

  factory Interval.fromJson(Map<String, dynamic> json) {
    return Interval(
      lower: json['Lower'] ?? 0,
      upper: json['Upper'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Lower': lower,
      'Upper': upper,
    };
  }
}

class CaloriesPerServing {
  final EnergyInterval energyInterval;
  final int displayType;

  CaloriesPerServing({
    required this.energyInterval,
    required this.displayType,
  });

  factory CaloriesPerServing.fromJson(Map<String, dynamic> json) {
    return CaloriesPerServing(
      energyInterval: EnergyInterval.fromJson(json['EnergyInterval']),
      displayType: json['DisplayType'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'EnergyInterval': energyInterval.toJson(),
      'DisplayType': displayType,
    };
  }
}

class KilojulesPerServing {
  final EnergyInterval energyInterval;
  final int displayType;

  KilojulesPerServing({
    required this.energyInterval,
    required this.displayType,
  });

  factory KilojulesPerServing.fromJson(Map<String, dynamic> json) {
    return KilojulesPerServing(
      energyInterval: EnergyInterval.fromJson(json['EnergyInterval']),
      displayType: json['DisplayType'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'EnergyInterval': energyInterval.toJson(),
      'DisplayType': displayType,
    };
  }
}

class Fat {
  final Amount amount;

  Fat({
    required this.amount,
  });

  factory Fat.fromJson(Map<String, dynamic> json) {
    return Fat(
      amount: Amount.fromJson(json['Amount']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Amount': amount.toJson(),
    };
  }
}

class SaturatedFattyAcids {
  final Amount amount;

  SaturatedFattyAcids({
    required this.amount,
  });

  factory SaturatedFattyAcids.fromJson(Map<String, dynamic> json) {
    return SaturatedFattyAcids(
      amount: Amount.fromJson(json['Amount']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Amount': amount.toJson(),
    };
  }
}

class Amount {
  final Interval interval;
  final Weight weight;

  Amount({
    required this.interval,
    required this.weight,
  });

  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount(
      interval: Interval.fromJson(json['Interval']),
      weight: Weight.fromJson(json['Weight']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Interval': interval.toJson(),
      'Weight': weight.toJson(),
    };
  }
}

class Carbohydrates {
  final Amount amount;

  Carbohydrates({
    required this.amount,
  });

  factory Carbohydrates.fromJson(Map<String, dynamic> json) {
    return Carbohydrates(
      amount: Amount.fromJson(json['Amount']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Amount': amount.toJson(),
    };
  }
}

class Sugar {
  final Amount amount;

  Sugar({
    required this.amount,
  });

  factory Sugar.fromJson(Map<String, dynamic> json) {
    return Sugar(
      amount: Amount.fromJson(json['Amount']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Amount': amount.toJson(),
    };
  }
}

class Protein {
  final Amount amount;

  Protein({
    required this.amount,
  });

  factory Protein.fromJson(Map<String, dynamic> json) {
    return Protein(
      amount: Amount.fromJson(json['Amount']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Amount': amount.toJson(),
    };
  }
}

class Salt {
  final Amount amount;

  Salt({
    required this.amount,
  });

  factory Salt.fromJson(Map<String, dynamic> json) {
    return Salt(
      amount: Amount.fromJson(json['Amount']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Amount': amount.toJson(),
    };
  }
}

class NetQuantity {
  final String measurementType;
  final WeightedInterval weightedInterval;
  final VolumenInterval volumenInterval;
  final CountInterval countInterval;

  NetQuantity({
    required this.measurementType,
    required this.weightedInterval,
    required this.volumenInterval,
    required this.countInterval,
  });

  factory NetQuantity.fromJson(Map<String, dynamic> json) {
    return NetQuantity(
      measurementType: json['MeasurementType'] ?? '',
      weightedInterval: WeightedInterval.fromJson(json['WeightedInterval']),
      volumenInterval: VolumenInterval.fromJson(json['VolumenInterval']),
      countInterval: CountInterval.fromJson(json['CountInterval']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'MeasurementType': measurementType,
      'WeightedInterval': weightedInterval.toJson(),
      'VolumenInterval': volumenInterval.toJson(),
      'CountInterval': countInterval.toJson(),
    };
  }
}
