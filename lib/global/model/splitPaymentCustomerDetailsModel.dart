class SplitPaymentCustomerDetailsModel {
  final String customerNumber;
  final double splitAmount;

  SplitPaymentCustomerDetailsModel({required this.customerNumber, required this.splitAmount});

  // Convert JSON to model
  factory SplitPaymentCustomerDetailsModel.fromJson(Map<String, dynamic> json) {
    return SplitPaymentCustomerDetailsModel(
      customerNumber: json['customerNumber'],
      splitAmount: (json['splitAmount'] as num).toDouble(),
    );
  }

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'customerNumber': customerNumber,
      'splitAmount': splitAmount,
    };
  }
}