import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'costs_record.g.dart';

abstract class CostsRecord implements Built<CostsRecord, CostsRecordBuilder> {
  static Serializer<CostsRecord> get serializer => _$costsRecordSerializer;

  @nullable
  DateTime get date;

  @nullable
  String get description;

  @nullable
  double get amount;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CostsRecordBuilder builder) => builder
    ..description = ''
    ..amount = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('costs');

  static Stream<CostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CostsRecord._();
  factory CostsRecord([void Function(CostsRecordBuilder) updates]) =
      _$CostsRecord;

  static CostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCostsRecordData({
  DateTime date,
  String description,
  double amount,
}) =>
    serializers.toFirestore(
        CostsRecord.serializer,
        CostsRecord((c) => c
          ..date = date
          ..description = description
          ..amount = amount));
