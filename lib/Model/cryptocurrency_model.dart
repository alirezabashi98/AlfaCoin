class CryptocurrencyModel {
  String id;
  int rank;
  String symbol;
  String name;
  double supply;
  double maxSupply;
  double marketCapUsd;
  double volumeUsd24Hr;
  double priceUsd;
  double changePercent24Hr;
  double vwap24Hr;
  String explorer;

  CryptocurrencyModel(
    this.id,
    this.rank,
    this.symbol,
    this.name,
    this.supply,
    this.maxSupply,
    this.marketCapUsd,
    this.volumeUsd24Hr,
    this.priceUsd,
    this.changePercent24Hr,
    this.vwap24Hr,
    this.explorer,
  );

  factory CryptocurrencyModel.fromMapJson(Map<String, dynamic> jsonMapObject) =>
      CryptocurrencyModel(
        jsonMapObject['id'],
        int.parse(jsonMapObject['rank']),
        jsonMapObject['symbol'],
        jsonMapObject['name'],
        double.parse(jsonMapObject['supply']),
        double.parse(jsonMapObject['maxsupply']),
        double.parse(jsonMapObject['marketCapUsd']),
        double.parse(jsonMapObject['volumeUsd24Hr']),
        double.parse(jsonMapObject['priceUsd']),
        double.parse(jsonMapObject['changePercent24Hr']),
        double.parse(jsonMapObject['vwap24Hr']),
        jsonMapObject['explorer'],
      );
}
