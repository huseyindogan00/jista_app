// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressModelAdapter extends TypeAdapter<AddressModel> {
  @override
  final int typeId = 0;

  @override
  AddressModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressModel(
      id: fields[0] as dynamic,
      city: fields[1] as String,
      town: fields[2] as String,
      telephoneNumber: fields[3] as String,
      mobileTelephoneNumber: fields[4] as String,
      fullAddress: fields[5] as String,
      postCode: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddressModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.city)
      ..writeByte(2)
      ..write(obj.town)
      ..writeByte(3)
      ..write(obj.telephoneNumber)
      ..writeByte(4)
      ..write(obj.mobileTelephoneNumber)
      ..writeByte(5)
      ..write(obj.fullAddress)
      ..writeByte(6)
      ..write(obj.postCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
