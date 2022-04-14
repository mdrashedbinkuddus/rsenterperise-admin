import '../auth/auth_util.dart';
import '../code_verification/code_verification_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key key}) : super(key: key);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  TextEditingController desktopPhoneFieldController;
  TextEditingController phoneNumberController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    desktopPhoneFieldController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
            ))
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(100, 0, 100, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Rafia Enterprise',
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Source Sans Pro',
                                        fontSize: 60,
                                      ),
                            ),
                            Form(
                              key: formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 100, 0, 0),
                                    child: TextFormField(
                                      controller: desktopPhoneFieldController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Enter Phone Number',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            width: 3,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            width: 3,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 30, 20, 30),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                      keyboardType: TextInputType.phone,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 40, 0, 50),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if ((desktopPhoneFieldController
                                                .text) ==
                                            (currentPhoneNumber)) {
                                          if (desktopPhoneFieldController
                                                  .text.isEmpty ||
                                              !desktopPhoneFieldController.text
                                                  .startsWith('+')) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Phone Number is required and has to start with +.'),
                                              ),
                                            );
                                            return;
                                          }
                                          await beginPhoneAuth(
                                            context: context,
                                            phoneNumber:
                                                desktopPhoneFieldController
                                                    .text,
                                            onCodeSent: () async {
                                              await Navigator
                                                  .pushAndRemoveUntil(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                  reverseDuration:
                                                      Duration(milliseconds: 0),
                                                  child:
                                                      CodeVerificationWidget(),
                                                ),
                                                (r) => false,
                                              );
                                            },
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Not Authorised'),
                                                content: Text(
                                                    'You are not verified'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                      text: 'Verify Phone',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 80,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .title2
                                            .override(
                                              fontFamily: 'Source Sans Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .buttonTextColor,
                                              fontSize: 26,
                                            ),
                                        elevation: 5,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: 5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 2,
                              indent: 200,
                              endIndent: 200,
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                                child: Container(
                                  width: double.infinity,
                                  height: 80,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            final user =
                                                await signInWithGoogle(context);
                                            if (user == null) {
                                              return;
                                            }
                                            await Navigator.pushAndRemoveUntil(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                                reverseDuration:
                                                    Duration(milliseconds: 0),
                                                child: NavBarPage(
                                                    initialPage: 'HomePage'),
                                              ),
                                              (r) => false,
                                            );
                                          },
                                          text: 'Sign in with Google',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 80,
                                            color: Colors.white,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .title2
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                            elevation: 4,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0,
                                            ),
                                            borderRadius: 5,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.83, 0),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
                              child: Text(
                                '© 2022 Rafia Enterprise',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Source Sans Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Image.asset(
                        'assets/images/airplane-flying-above-the-clouds.jpg',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            if (responsiveVisibility(
              context: context,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: TextFormField(
                            controller: phoneNumberController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Number',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 24, 20, 24),
                              suffixIcon: Icon(
                                Icons.phone,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 22,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            if (phoneNumberController.text.isEmpty ||
                                !phoneNumberController.text.startsWith('+')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Phone Number is required and has to start with +.'),
                                ),
                              );
                              return;
                            }
                            await beginPhoneAuth(
                              context: context,
                              phoneNumber: phoneNumberController.text,
                              onCodeSent: () async {
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: CodeVerificationWidget(),
                                  ),
                                  (r) => false,
                                );
                              },
                            );
                          },
                          text: 'Get OTP',
                          options: FFButtonOptions(
                            width: 200,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Source Sans Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .buttonTextColor,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: 230,
                      height: 44,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final user = await signInWithGoogle(context);
                                if (user == null) {
                                  return;
                                }
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: NavBarPage(initialPage: 'HomePage'),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: 'Sign in with Google',
                              icon: Icon(
                                Icons.add,
                                color: Colors.transparent,
                                size: 20,
                              ),
                              options: FFButtonOptions(
                                width: 230,
                                height: 44,
                                color: Colors.white,
                                textStyle: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Color(0xFF606060),
                                  fontSize: 17,
                                ),
                                elevation: 5,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 5,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.83, 0),
                            child: Container(
                              width: 22,
                              height: 22,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
