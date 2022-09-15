import 'package:intl/intl.dart';

class CurrencyFormat {
  final double amount;
  final bool priceXPF;
  final bool? priceEUR;

  CurrencyFormat({
    required this.amount,
    required this.priceXPF,
    this.priceEUR,
  });

  String returnPrice() {
    String _return = "";

    if (priceXPF == true) {
      _return = NumberFormat.currency(locale: "fr", symbol: "XPF", decimalDigits: 0).format(amount);
    } else if (priceXPF == false && priceEUR == true) {
      _return = NumberFormat.currency(locale: "fr", symbol: "EUR", decimalDigits: 2).format(amount);
    }

    return _return;
  }

  String returnPriceTTC() {
    String _return = "";

    if (priceXPF == true) {
      _return = NumberFormat.currency(locale: "fr", symbol: "XPF TTC", decimalDigits: 0).format(amount);
    } else if (priceXPF == false && priceEUR == true) {
      _return = NumberFormat.currency(locale: "fr", symbol: "EUR TTC", decimalDigits: 2).format(amount);
    }

    return _return;
  }

  String returnPriceHT() {
    String _return = "";

    if (priceXPF == true) {
      _return = NumberFormat.currency(locale: "fr", symbol: "XPF HT", decimalDigits: 0).format(amount);
    } else if (priceXPF == false && priceEUR == true) {
      _return = NumberFormat.currency(locale: "fr", symbol: "EUR HT", decimalDigits: 2).format(amount);
    }

    return _return;
  }

  String returnCashback({bool? withoutSymbol}) {
    String _return = "";

    _return = NumberFormat.currency(locale: "fr", symbol: withoutSymbol != true ? "XPF cashback" : "", decimalDigits: 2).format(amount);

    return _return;
  }

  String returnPV({bool? withoutSymbol}) {
    String _return = "";

    _return = NumberFormat.currency(locale: "fr", symbol: withoutSymbol != true ? "PV" : "", decimalDigits: 2).format(amount);

    return _return;
  }
}
