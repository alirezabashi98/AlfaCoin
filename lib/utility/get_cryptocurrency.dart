List<String> getCryptocurrency(Map<String, dynamic> date) {
  late List<String> newListDate = [];

  for (var element in date.keys) {
    newListDate.add(element);
  }

  return newListDate;
}
