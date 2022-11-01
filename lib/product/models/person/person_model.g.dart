// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonModelAdapter extends TypeAdapter<PersonModel> {
  @override
  final int typeId = 1;

  @override
  PersonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonModel(
      id: fields[0] as dynamic,
      password: fields[1] as String?,
      pbik: fields[2] as String?,
      email: fields[3] as String?,
      name: fields[4] as String?,
      lastName: fields[5] as String?,
      rank: fields[6] as String?,
      gender: fields[7] as String?,
      address: fields[8] as AddressModel?,
      totalPoint: fields[9] as int?,
      duty: fields[10] as String?,
      order: fields[11] as OrderModel?,
      imageUrl: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PersonModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.pbik)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.lastName)
      ..writeByte(6)
      ..write(obj.rank)
      ..writeByte(7)
      ..write(obj.gender)
      ..writeByte(8)
      ..write(obj.address)
      ..writeByte(9)
      ..write(obj.totalPoint)
      ..writeByte(10)
      ..write(obj.duty)
      ..writeByte(11)
      ..write(obj.order)
      ..writeByte(12)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
