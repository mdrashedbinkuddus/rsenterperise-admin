import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'business_loan_record.g.dart';

abstract class BusinessLoanRecord
    implements Built<BusinessLoanRecord, BusinessLoanRecordBuilder> {
  static Serializer<BusinessLoanRecord> get serializer =>
      _$businessLoanRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'person_name')
  String get personName;

  @nullable
  @BuiltValueField(wireName: 'date_of_taken')
  DateTime get dateOfTaken;

  @nullable
  double get amount;

  @nullable
  @BuiltValueField(wireName: 'payment_date')
  DateTime get paymentDate;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BusinessLoanRecordBuilder builder) => builder
    ..personName = ''
    ..amount = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('business_loan');

  static Stream<BusinessLoanRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BusinessLoanRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  BusinessLoanRecord._();
  factory BusinessLoanRecord(
          [void Function(BusinessLoanRecordBuilder) updates]) =
      _$BusinessLoanRecord;

  static BusinessLoanRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBusinessLoanRecordData({
  String personName,
  DateTime dateOfTaken,
  double amount,
  DateTime paymentDate,
}) =>
    serializers.toFirestore(
        BusinessLoanRecord.serializer,
        BusinessLoanRecord((b) => b
          ..personName = personName
          ..dateOfTaken = dateOfTaken
          ..amount = amount
          ..paymentDate = paymentDate));
