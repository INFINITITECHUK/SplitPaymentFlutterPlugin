import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class SplitCustomerInfo {

  @HiveField(0)
  final int id; // Auto-incrementing ID

  @HiveField(1)
  final String customerNumber;

  @HiveField(2)
  final num amount;

  @HiveField(3)
  final int status;

  // status 0 = pending, 1 = processing, 2 = complete, 3 = failed

  SplitCustomerInfo({required this.id, required this.customerNumber,required this.amount,required this.status});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerNumber': customerNumber,
      'splitAmount': amount,
      'status': status
    };
  }
}