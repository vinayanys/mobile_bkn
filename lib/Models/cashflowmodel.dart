class CashFlowModel {
  final int id;
  final String date;
  final double amount;
  final String description;

  CashFlowModel({
    required this.id,
    required this.date,
    required this.amount,
    required this.description,
  });

  factory CashFlowModel.fromMap(Map<String, dynamic> map) {
    return CashFlowModel(
      id: map['id'],
      date: map['date'],
      amount: map['amount'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'amount': amount,
      'description': description,
    };
  }
}
