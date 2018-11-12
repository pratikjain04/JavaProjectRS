
List<History> testHist = [
  new History(
      new Hospital(
          "Apollo Hospital",
          ['Common cold'],
          ['Crocin Advanced', 'Honitus']
      )
  ),
  new History(
      new Hospital(
          "Manipal Hospital",
          ['Stomach infection'],
          ['Rantac 300', 'Flagyl']
      )
  ),
  new History(
      new Hospital(
          "Rajasthan Hospital",
          ['Fever and Common Cold'],
          ['Paracetamol','Crocin Advanced']
      )
  ),
];

class History {
  Hospital hospital;
  History(this.hospital);
}

class Hospital {
  String name;
  List<String> diseasesTreated = [];
  List<String> medicinesPrescribed = [];
  Hospital(this.name, this.diseasesTreated, this.medicinesPrescribed);
}