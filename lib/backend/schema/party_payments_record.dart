import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'party_payments_record.g.dart';

abstract class PartyPaymentsRecord
    implements Built<PartyPaymentsRecord, PartyPaymentsRecordBuilder> {
  static Serializer<PartyPaymentsRecord> get serializer =>
      _$partyPaymentsRecordSerializer;

  @nullable
  DateTime get date;

  @nullable
  @BuiltValueField(wireName: 'paid_amount')
  double get paidAmount;

  @nullable
  @BuiltValueField(wireName: 'payment_type')
  String get paymentType;

  @nullable
  @BuiltValueField(wireName: 'party_name')
  String get partyName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PartyPaymentsRecordBuilder builder) => builder
    ..paidAmount = 0.0
    ..paymentType = ''
    ..partyName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('party_payments');

  static Stream<PartyPaymentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PartyPaymentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  PartyPaymentsRecord._();
  factory PartyPaymentsRecord(
          [void Function(PartyPaymentsRecordBuilder) updates]) =
      _$PartyPaymentsRecord;

  static PartyPaymentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPartyPaymentsRecordData({
  DateTime date,
  double paidAmount,
  String paymentType,
  String partyName,
}) =>
    serializers.toFirestore(
        PartyPaymentsRecord.serializer,
        PartyPaymentsRecord((p) => p
          ..date = date
          ..paidAmount = paidAmount
          ..paymentType = paymentType
          ..partyName = partyName));
