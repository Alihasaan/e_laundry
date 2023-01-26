import 'package:e_laundry/Constants/constants.dart';
import 'package:e_laundry/Services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LoginSignup extends StatefulWidget {
  LoginSignup({Key? key}) : super(key: key);

  @override
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  final _formKey = GlobalKey<FormState>();
  late bool codeSent = false;
  String? cError;
  late String verificationId;

  TextEditingController _codeController = new TextEditingController();

  TextEditingController _phoneController = new TextEditingController();

  bool signin = true;

  bool processing = false;

  bool clicked = false;
  bool signUp = false;

  /*void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }*/

  @override
  void initState() {
    //
    super.initState();

    _codeController = new TextEditingController();
    _phoneController = new TextEditingController();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(children: [
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurpleAccent,
                Colors.blueAccent,
                primary!,
              ],
            )),
            child: Center(
              child: Container(
                padding: EdgeInsets.only(bottom: codeSent == false ? 50 : 100),
                child: Text("E-Laundry",
                    style: TextStyle(
                        fontSize: 35,
                        letterSpacing: 2,
                        color: Colors.white,
                        fontWeight: FontWeight.w800)),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(bottom: 120),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: codeSent == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Didn't receive the code? ",
                              style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 0,
                                  color: priText,
                                  fontWeight: FontWeight.w400)),
                          TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                verifyPhone("+92" + _phoneController.text);
                              }
                              snackBar("OTP resend!!");
                            },
                            child: Text("RESEND",
                                style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 0,
                                    color: Colors.cyan[500],
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      )
                    : TextButton(
                        onPressed: () {
                          AuthService(FirebaseAuth.instance)
                              .signIn("test1234@gmail.com", "123456789")
                              .then((value) => setState(() {
                                    cError = value;
                                  }));
                        },
                        child: Icon(Icons.login),
                      ),
              )),
          showAlert(),
          Center(
            child: Container(
              height: codeSent == true ? 480 : 300,
              width: 400,
              child: Card(
                  elevation: 10,
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: _buildPhoneNoTF()),
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildPhoneNoTF() {
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
                child: Text(
              "Sign In",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.cyan[300],
                  letterSpacing: 2,
                  fontWeight: FontWeight.w800),
            )),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Text(
                'Sign in using your phone number.',
                style: TextStyle(color: priText),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              height: 80.0,
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextFormField(
                controller: _phoneController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your Phone No.";
                  } else if (value.length < 10) {
                    return " Invalid Phone No. Format";
                  } else if (value.length > 10) {
                    return " Invalid Phone No. Format";
                  }
                },
                obscureText: false,
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(color: primary!)),
                  contentPadding: EdgeInsets.all(14.0),
                  labelText: ' Phone No.',
                  prefixText: "+92",
                ),
              ),
            ),
            Center(
              child: MaterialButton(
                  onPressed: codeSent == false
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            verifyPhone("+92" + _phoneController.text);
                          }
                        }
                      : null,
                  child: Text("Login",
                      style: TextStyle(fontSize: 22, color: Colors.white)),
                  color: primary),
            ),
            codeSent == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Text("Enter the 6-Digits Code Sent to your Phone Number.",
                          style: TextStyle(
                            color: priText,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'OpenSans',
                          )),
                      Container(
                          padding: EdgeInsets.all(10),
                          width: 300,
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.cyan.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 6,

                            blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            validator: (v) {
                              if (v!.length < 6) {
                                return "6 digits required.";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 40,
                            ),
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: true,

                            controller: _codeController,
                            keyboardType: TextInputType.number,
                            boxShadows: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            onCompleted: (v) {
                              print("Completed");
                            },
                            // onTap: () {
                            //   print("Pressed");
                            // },

                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                            onChanged: (String value) {},
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: IconButton(
                            icon: Text(
                              "Verify",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            padding: EdgeInsets.all(16),
                            onPressed: () {
                              //code for sign in
                              if (codeSent == true) {
                                snackBar("OTP verified");
                                AuthService(_firebaseAuth)
                                    .signInWithOTP(_codeController.text,
                                        this.verificationId)
                                    .then((value) => setState(() {
                                          cError = value;
                                        }));
                              }
                            },
                            color: primary,
                          ),
                        ),
                      )
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget showAlet() {
    print("Errroor :");
    print(cError);
    if (cError != null) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.redAccent,
        ),
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(right: 15, left: 15, top: 25),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: AutoSizeText(
                cError!,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    cError = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService(_firebaseAuth)
          .signInPhone(authResult)
          .then((value) => setState(() {
                cError = value;
              }));
      print("SignIn SuccessFul");
    };

    final PhoneVerificationFailed verificationfailed = (authException) {
      print('Error');
      print('${authException.message}');
      setState(() {
        cError = authException.message;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      setState(() {
        verificationId = verId;
      });
      print("Auto Verify");
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: (String verId, int? forceResend) {
          print("Verification Code Sent To" + phoneNo);
          setState(() {
            codeSent = true;
            verificationId = verId;
          });
        },
        codeAutoRetrievalTimeout: autoTimeout);
  }
}

/* Widget signUpUi() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 120),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.cyan[300],
                      letterSpacing: 2,
                      fontWeight: FontWeight.w800),
                )),
            SizedBox(
              height: 35,
            ),
            Container(
              child: Theme(
                data: new ThemeData(
                  primaryColor: primary,
                  primaryColorDark: Colors.red,
                ),
                child: new TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name Can not be empty.";
                    } else if (value.length <= 2) {
                      return "Name too Short";
                    } else if (value.length > 15) {
                      return "Name too Long";
                    }
                  },
                  controller: namectrl,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: new BorderSide(color: primary!)),
                      prefixIcon: Icon(
                        Icons.portrait,
                      ),
                      hintText: 'Name'),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Theme(
                data: new ThemeData(
                  primaryColor: primary,
                  primaryColorDark: Colors.red,
                ),
                child: new TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email Can not be empty.";
                    }
                  },
                  controller: emailFctrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: new BorderSide(color: primary!)),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                      ),
                      hintText: 'Email'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Theme(
                    data: new ThemeData(
                      primaryColor: primary,
                      primaryColorDark: Colors.red,
                    ),
                    child: new TextFormField(
                      obscureText: _obscureText,
                      controller: passctrl,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password Can not be empty.";
                        } else if (value.length < 8) {
                          return "Password too short. ";
                        }
                      },
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: new BorderSide(color: primary!)),
                          hintText: 'Password',
                          helperText: "",
                          prefixIcon: const Icon(
                            Icons.lock_outlined,
                          ),
                          suffixIcon: _obscureText
                              ? IconButton(
                                  icon: Icon(Icons.remove_red_eye_outlined,
                                      color: primary),
                                  onPressed: _toggle)
                              : IconButton(
                                  icon: Icon(Icons.remove_red_eye,
                                      color: primary),
                                  onPressed: _toggle)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: MaterialButton(
                  color: primary,
                  minWidth: 130,
                  height: 45,
                  onPressed: () => {
                        if (_formKey.currentState!.validate())
                          {
                            AuthService(FirebaseAuth.instance).signUp(
                                emailFctrl.text, passctrl!.text, namectrl!.text)
                          }
                      },
                  child: processing == false
                      ? Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 22.0, color: Colors.white),
                        )
                      : CircularProgressIndicator(
                          backgroundColor: Colors.white)),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
*/
