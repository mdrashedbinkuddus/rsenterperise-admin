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
  TextEditingController phoneNumberController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    phoneNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: TextFormField(
                        controller: phoneNumberController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Number',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          suffixIcon: Icon(
                            Icons.phone,
                            color: Colors.black,
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
                              MaterialPageRoute(
                                builder: (context) => CodeVerificationWidget(),
                              ),
                              (r) => false,
                            );
                          },
                        );
                      },
                      text: 'Get OTP',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Colors.white,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                        elevation: 1,
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
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
                              MaterialPageRoute(
                                builder: (context) =>
                                    NavBarPage(initialPage: 'HomePage'),
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
        ),
      ),
    );
  }
}
