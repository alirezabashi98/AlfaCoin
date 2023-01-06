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
  );

  factory CryptocurrencyModel.fromMapJson(Map<String, dynamic> jsonMapObject) =>
      CryptocurrencyModel(
        jsonMapObject['id'],
        int.parse(jsonMapObject['rank']),
        jsonMapObject['symbol'],
        jsonMapObject['name'],
        double.parse(jsonMapObject['supply']),
        jsonMapObject['maxsupply'] == null
            ? 0
            : double.parse(jsonMapObject['maxsupply']),
        double.parse(jsonMapObject['marketCapUsd']),
        double.parse(jsonMapObject['volumeUsd24Hr']),
        double.parse(jsonMapObject['priceUsd']),
        jsonMapObject['changePercent24Hr'] == null
            ? 0
            : double.parse(jsonMapObject['changePercent24Hr']),
        jsonMapObject['vwap24Hr'] == null
            ? 0
            : double.parse(jsonMapObject['vwap24Hr']),
      );
}
