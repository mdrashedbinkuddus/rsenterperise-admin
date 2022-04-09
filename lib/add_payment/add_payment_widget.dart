import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
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
  DateTime datePicked1;
  TextEditingController textController1;
  String dropDownValue;
  DateTime datePicked2;
  TextEditingController textController2;
  String paymentMethodValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 =
        TextEditingController(text: dateTimeFormat('yMMMd', datePicked2));
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PartyListRecord>>(
      stream: queryPartyListRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitDoubleBounce(
                color: Colors.black,
                size: 50,
              ),
            ),
          );
        }
        List<PartyListRecord> addPaymentPartyListRecordList = snapshot.data;
        final addPaymentPartyListRecord =
            addPaymentPartyListRecordList.isNotEmpty
                ? addPaymentPartyListRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryBtnText,
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Add Payments',
              style: FlutterFlowTheme.of(context).title3.override(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.black,
                  size: 26,
                ),
              ),
            ],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: TextFormField(
                              onFieldSubmitted: (_) async {
                                await DatePicker.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  onConfirm: (date) {
                                    setState(() => datePicked1 = date);
                                  },
                                  currentTime: getCurrentTimestamp,
                                  minTime: getCurrentTimestamp,
                                );
                              },
                              controller: textController1,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Date',
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
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    15, 20, 15, 20),
                                suffixIcon: Icon(
                                  Icons.calendar_today_rounded,
                                  color: Color(0xFF757575),
                                  size: 26,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                            child: FlutterFlowDropDown(
                              options: ['Option 1'].toList(),
                              onChanged: (val) =>
                                  setState(() => dropDownValue = val),
                              width: 180,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintText: 'Select Party...',
                              fillColor: Colors.white,
                              elevation: 2,
                              borderColor: Color(0xFFCDCDCD),
                              borderWidth: 2,
                              borderRadius: 5,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            ),
                          ),
                          TextFormField(
                            onFieldSubmitted: (_) async {
                              await DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                onConfirm: (date) {
                                  setState(() => datePicked2 = date);
                                },
                                currentTime: getCurrentTimestamp,
                                minTime: getCurrentTimestamp,
                              );
                            },
                            controller: textController2,
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
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  15, 20, 15, 20),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                            keyboardType: TextInputType.number,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                            child: FlutterFlowChoiceChips(
                              initiallySelected: [paymentMethodValue],
                              options: [ChipData('Cash'), ChipData('Cheque')],
                              onChanged: (val) => setState(
                                  () => paymentMethodValue = val.first),
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                iconColor: Colors.white,
                                iconSize: 18,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    15, 5, 15, 5),
                                elevation: 0,
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF323B45),
                                    ),
                                iconColor: Color(0xFF323B45),
                                iconSize: 18,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    15, 5, 15, 5),
                                elevation: 4,
                              ),
                              chipSpacing: 25,
                              multiselect: false,
                              alignment: WrapAlignment.spaceEvenly,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
