class CryptoHistoryModel {
  double priceUsd;
  int time;
  DateTime date;

  CryptoHistoryModel(this.priceUsd, this.time, this.date);

  factory CryptoHistoryModel.fromMapJson(Map<String, dynamic> jsonMapObject) =>
      CryptoHistoryModel(
        double.parse(jsonMapObject['priceUsd']),
        jsonMapObject['time'],
        DateTime.fromMillisecondsSinceEpoch(jsonMapObject['time']),
      );
}
