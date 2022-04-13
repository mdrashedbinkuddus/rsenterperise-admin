import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../business_loan/business_loan_widget.dart';
import '../components/add_shipment_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../shipment_details/shipment_details_widget.dart';
import '../sign_in/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ShipmentWidget extends StatefulWidget {
  const ShipmentWidget({Key key}) : super(key: key);

  @override
  _ShipmentWidgetState createState() => _ShipmentWidgetState();
}

class _ShipmentWidgetState extends State<ShipmentWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          'Shipments',
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
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        height: 350,
                        child: AddShipmentWidget(),
                      ),
                    );
                  },
                );
              },
              child: Icon(
                Icons.library_add,
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
      drawer: StreamBuilder<UserRecord>(
        stream: UserRecord.getDocument(currentUserReference),
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
          final drawerUserRecord = snapshot.data;
          return Drawer(
            elevation: 16,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          color: FlutterFlowTheme.of(context).lineColor,
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: StreamBuilder<UserRecord>(
                            stream: UserRecord.getDocument(
                                drawerUserRecord.reference),
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
                              final imageUserRecord = snapshot.data;
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    drawerUserRecord.photoUrl,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/r-s-enterprise-admin-ghscow/assets/ffgkx5xuwf47/logo.png',
                                  ),
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Text(
                            drawerUserRecord.displayName,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Source Sans Pro',
                                      fontSize: 14,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                                reverseDuration: Duration(milliseconds: 0),
                                child: NavBarPage(initialPage: 'Payments'),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(
                              FFIcons.ktaka,
                              color: FlutterFlowTheme.of(context).lineColor,
                              size: 24,
                            ),
                            title: Text(
                              'Payments',
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Source Sans Pro',
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                            ),
                            dense: false,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 5, 0, 5),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                                reverseDuration: Duration(milliseconds: 0),
                                child: BusinessLoanWidget(),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.piggyBank,
                              color: FlutterFlowTheme.of(context).lineColor,
                              size: 24,
                            ),
                            title: Text(
                              'Business Loan',
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Source Sans Pro',
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                            ),
                            dense: false,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 5, 0, 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: FlutterFlowTheme.of(context).lineColor,
                        offset: Offset(0, -1),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Text(
                            'Logout',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Source Sans Pro',
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                          child: InkWell(
                            onTap: () async {
                              await signOut();
                              await Navigator.pushAndRemoveUntil(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                  reverseDuration: Duration(milliseconds: 0),
                                  child: SignInWidget(),
                                ),
                                (r) => false,
                              );
                            },
                            child: Icon(
                              Icons.logout,
                              color: FlutterFlowTheme.of(context).lineColor,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: StreamBuilder<List<ShipmentRecord>>(
              stream: queryShipmentRecord(),
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
                List<ShipmentRecord> gridViewShipmentRecordList = snapshot.data;
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: 1.5,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: gridViewShipmentRecordList.length,
                  itemBuilder: (context, gridViewIndex) {
                    final gridViewShipmentRecord =
                        gridViewShipmentRecordList[gridViewIndex];
                    return InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                            reverseDuration: Duration(milliseconds: 0),
                            child: ShipmentDetailsWidget(
                              shipmentDetails: gridViewShipmentRecord.reference,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shipment No.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    gridViewShipmentRecord.shipmentNo
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Lato',
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    '/',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Lato',
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    gridViewShipmentRecord.cartoonNumber,
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Lato',
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
