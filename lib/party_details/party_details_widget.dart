import '../backend/backend.dart';
import '../components/edit_party_details_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PartyDetailsWidget extends StatefulWidget {
  const PartyDetailsWidget({
    Key key,
    this.partyName,
  }) : super(key: key);

  final String partyName;

  @override
  _PartyDetailsWidgetState createState() => _PartyDetailsWidgetState();
}

class _PartyDetailsWidgetState extends State<PartyDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        List<PartyListRecord> partyDetailsPartyListRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final partyDetailsPartyListRecord =
            partyDetailsPartyListRecordList.isNotEmpty
                ? partyDetailsPartyListRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            iconTheme: IconThemeData(color: Colors.black),
            automaticallyImplyLeading: true,
            title: Text(
              widget.partyName,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF232323),
                    fontSize: 22,
                  ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                child: InkWell(
                  onTap: () async {
                    await partyDetailsPartyListRecord.reference.delete();
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.delete,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    size: 26,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                child: InkWell(
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryColor,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: Container(
                            height: 410,
                            child: EditPartyDetailsWidget(
                              partyName: partyDetailsPartyListRecord.name,
                              partyPhoneNumber:
                                  partyDetailsPartyListRecord.phone,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(
                    Icons.edit_rounded,
                    color: Colors.black,
                    size: 26,
                  ),
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
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: FlutterFlowTheme.of(context).lineColor,
                              )
                            ],
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.partyName,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
