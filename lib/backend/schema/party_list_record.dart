import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'party_list_record.g.dart';

abstract class PartyListRecord
    implements Built<PartyListRecord, PartyListRecordBuilder> {
  static Serializer<PartyListRecord> get serializer =>
      _$partyListRecordSerializer;

  @nullable
  String get name;

  @nullable
  int get phone;

  @nullable
  String get image;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PartyListRecordBuilder builder) => builder
    ..name = ''
    ..phone = 0
    ..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('party_list');

  static Stream<PartyListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PartyListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PartyListRecord._();
  factory PartyListRecord([void Function(PartyListRecordBuilder) updates]) =
      _$PartyListRecord;

  static PartyListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPartyListRecordData({
  String name,
  int phone,
  String image,
}) =>
    serializers.toFirestore(
        PartyListRecord.serializer,
        PartyListRecord((p) => p
          ..name = name
          ..phone = phone
          ..image = image));
