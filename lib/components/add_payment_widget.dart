import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPaymentWidget extends StatefulWidget {
  const AddPaymentWidget({Key key}) : super(key: key);

  @override
  _AddPaymentWidgetState createState() => _AddPaymentWidgetState();
}

class _AddPaymentWidgetState extends State<AddPaymentWidget> {
  DateTime datePicked;
  TextEditingController partyNameController;
  TextEditingController invoiceNumberController;
  TextEditingController paymentAmountController;
  TextEditingController chequeNumberController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    chequeNumberController = TextEditingController();
    invoiceNumberController = TextEditingController();
    partyNameController = TextEditingController();
    paymentAmountController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 4475,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Payments',
                    style: FlutterFlowTheme.of(context).title2,
                  ),
                  InkWell(
                    onTap: () async {
                      final partyPaymentsCreateData =
                          createPartyPaymentsRecordData(
                        date: datePicked,
                        partyName: partyNameController.text,
                        paidAmount: double.parse(partyNameController.text),
                        invoiceNumber: int.parse(invoiceNumberController.text),
                        chequeNo: chequeNumberController.text,
                      );
                      await PartyPaymentsRecord.collection
                          .doc()
                          .set(partyPaymentsCreateData);
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.check_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dateTimeFormat('yMMMd', datePicked),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: InkWell(
                                onTap: () async {
                                  // DatePicker
                                  await DatePicker.showDatePicker(
                                    context,
                                    showTitleActions: true,
                                    onConfirm: (date) {
                                      setState(() => datePicked = date);
                                    },
                                    currentTime: getCurrentTimestamp,
                                    minTime: getCurrentTimestamp,
                                  );
                                },
                                child: Icon(
                                  Icons.calendar_today_rounded,
                                  color: Colors.black,
                                  size: 26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: TextFormField(
                          controller: partyNameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Party Name',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFCDCDCD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFCDCDCD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(15, 20, 15, 20),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: TextFormField(
                          controller: invoiceNumberController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Invoice Number',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFCDCDCD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFCDCDCD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(15, 20, 15, 20),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      TextFormField(
                        controller: paymentAmountController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Amount Paid',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFCDCDCD),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFCDCDCD),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(15, 20, 15, 20),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                        keyboardType: TextInputType.number,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: TextFormField(
                          controller: chequeNumberController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Cheque Number',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFCDCDCD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFCDCDCD),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(15, 20, 15, 20),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
