import 'package:cashpilot_money_controller/constants/colors.dart';
import 'package:cashpilot_money_controller/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UserdataScreen extends StatefulWidget {
  const UserdataScreen({super.key});

  @override
  State<UserdataScreen> createState() => _UserdataScreenState();
}

class _UserdataScreenState extends State<UserdataScreen> {

  bool _rememberMe = false;

  //form key for the for validation
  final _formKey = GlobalKey<FormState>();

  //controllers for the text form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter Your \nPersonal Details",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                    color: kMainColor
                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                //form
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          //check whether user entered a valid name
                          if(value!.isEmpty){
                            return "Please Enter Your Username";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20)
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          //check whether user entered a valid name
                          if(value!.isEmpty){
                            return "Please Enter Your Email";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20)
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          //check whether user entered a valid name
                          if(value!.isEmpty){
                            return "Please Enter a Valid Password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20)
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          //check whether user entered a valid name
                          if(value!.isEmpty){
                            return "Please Enter the Same Password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20)
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      //remember 
                      Row(
                        children: [
                          Text(
                            "Remember for the next time",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kGray
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: kMainColor,
                              value: _rememberMe, 
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              }
                            )
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            String username = _nameController.text;
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            String confPassword = _confirmPasswordController.text;

                            print("$username $email $password $confPassword");
                          }
                        },
                        child: CustomButton(
                          buttonName: "Next", 
                          buttonColor: kMainColor
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}