class PriceAndTax {
  double amountWithoutTax;
  // double taxPercentage;
  List<double> listTaxPercentage;

  PriceAndTax({
    required this.amountWithoutTax,
    // required this.taxPercentage,
    required this.listTaxPercentage,
  });

  double returnPriceToTax() {
    double _return = 0.0;
    double _tax = 0.0;

    for (var tax in listTaxPercentage) {
      _tax += tax;
    }

    _return = amountWithoutTax + (amountWithoutTax * (_tax / 100));

    return _return;
  }

  List<int> returnListAmountTax() {
    List<int> _return = [];

    for (var tax in listTaxPercentage) {
      int value = (amountWithoutTax * (tax / 100)).toInt();

      _return.add(value);
    }

    return _return;
  }

  double returnPriceFromTax() {
    double _return = 0.0;
    double _tax = 0.0;

    for (var tax in listTaxPercentage) {
      _tax += tax;
    }

    _return = amountWithoutTax / (1 + (_tax / 100));

    return _return;
  }
}
