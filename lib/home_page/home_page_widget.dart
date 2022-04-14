import '../auth/auth_util.dart';
import '../business_loan/business_loan_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../signin_and_signup/signin_and_signup_widget.dart';
import '../staff/staff_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).secondaryColor),
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            scaffoldKey.currentState.openDrawer();
          },
          child: Icon(
            Icons.menu_rounded,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 26,
          ),
        ),
        title: Text(
          'Dashboard',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Source Sans Pro',
                color: Color(0xFF232323),
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              'assets/images/airplane-flying-above-the-clouds.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              fit: BoxFit.cover,
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
                          style: FlutterFlowTheme.of(context).title3.override(
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
                          style: FlutterFlowTheme.of(context).title3.override(
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
                            child: StaffWidget(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.work_rounded,
                          color: FlutterFlowTheme.of(context).lineColor,
                          size: 24,
                        ),
                        title: Text(
                          'Staff Details',
                          style: FlutterFlowTheme.of(context).title3.override(
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
              decoration: BoxDecoration(),
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
                        style: FlutterFlowTheme.of(context).bodyText1.override(
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
                              child: SigninAndSignupWidget(),
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
      ),
    );
  }
}
