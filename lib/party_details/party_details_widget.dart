import '../backend/backend.dart';
import '../edit_party/edit_party_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PartyDetailsWidget extends StatefulWidget {
  const PartyDetailsWidget({
    Key key,
    this.partyDetails,
  }) : super(key: key);

  final DocumentReference partyDetails;

  @override
  _PartyDetailsWidgetState createState() => _PartyDetailsWidgetState();
}

class _PartyDetailsWidgetState extends State<PartyDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PartyListRecord>(
      stream: PartyListRecord.getDocument(widget.partyDetails),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitDoubleBounce(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final partyDetailsPartyListRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            iconTheme: IconThemeData(color: Colors.black),
            automaticallyImplyLeading: true,
            title: Text(
              partyDetailsPartyListRecord.name,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Source Sans Pro',
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
                    color: FlutterFlowTheme.of(context).negativeTwo,
                    size: 26,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: EditPartyWidget(
                          partyName: partyDetailsPartyListRecord.name,
                          partyNumber: partyDetailsPartyListRecord.phone,
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.edit_rounded,
                    color: FlutterFlowTheme.of(context).primaryColor,
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
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                color: FlutterFlowTheme.of(context).lineColor,
                              )
                            ],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 5),
                                          child: Text(
                                            partyDetailsPartyListRecord.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                  fontSize: 18,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          formatNumber(
                                            partyDetailsPartyListRecord.phone,
                                            formatType: FormatType.custom,
                                            format: '+880',
                                            locale: '',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await launchURL(formatNumber(
                                        partyDetailsPartyListRecord.phone,
                                        formatType: FormatType.custom,
                                        format: 'tel:',
                                        locale: '',
                                      ));
                                    },
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.black,
                                      size: 26,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(),
                        child: DefaultTabController(
                          length: 4,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              TabBar(
                                isScrollable: true,
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyText1,
                                indicatorColor:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                indicatorWeight: 2,
                                tabs: [
                                  Tab(
                                    text: 'Details',
                                  ),
                                  Tab(
                                    text: 'Current Shipment',
                                  ),
                                  Tab(
                                    text: 'Finance',
                                  ),
                                  Tab(
                                    text: 'History',
                                  ),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Container(),
                                    Container(),
                                    Container(),
                                    Container(),
                                  ],
                                ),
                              ),
                            ],
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
