// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../dish_model_hive_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DishModelAdapter extends TypeAdapter<HiveDishModel> {
  @override
  final int typeId = 0;

  @override
  HiveDishModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveDishModel(
      dishId: fields[0] as int,
      name: fields[1] as String,
      isDishFavorite: fields[2] as bool,
      isDishNew: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveDishModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.dishId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isDishFavorite)
      ..writeByte(3)
      ..write(obj.isDishNew);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DishModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
