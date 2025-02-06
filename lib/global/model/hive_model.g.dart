// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SplitCustomerInfoAdapter extends TypeAdapter<SplitCustomerInfo> {
  @override
  final int typeId = 173;

  @override
  SplitCustomerInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SplitCustomerInfo(
      id: fields[0] as int,
      customerNumber: fields[1] as String,
      amount: fields[2] as num,
      status: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SplitCustomerInfo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.customerNumber)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SplitCustomerInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
