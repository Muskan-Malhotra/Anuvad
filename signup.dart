import 'package:chat_app/services/auth.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{

  bool isLoading = false;
  AuthMethods authMethods = new AuthMethods();
  final formkey = GlobalKey<FormState>();
  //TextEditorControl
  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  signMeUp(){
    if(formkey.currentState.validate()){
      setState(() {
        isLoading = true;
      });

      authMethods.signUpWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text)
        .then((val){
          print("$val");  //to print the userid for now
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar:appBarMain(context),
        body: SingleChildScrollView(  //so if we don't have this widget the signin options at the bottom would deter in small screen phones
          child: Container(
            // to bring the text back to its original position
            height: MediaQuery.of(context).size.height -60, //if we don't put this the conatiner floats on the top as we start typing on typing pad
            alignment: Alignment.bottomCenter,
            child: Container(
              //wrapping a column within a container so as to provide padding or margin as a whole
              padding: EdgeInsets.symmetric(horizontal: 24), //horzontal 24 is padding only //to provide a kind of padding which is symmtrical in all proportions
              child: Column(
                //as the column is taking thw whole space vertically so we will minimize its axis
                mainAxisSize: MainAxisSize.min,
                //coz we need to align in vertical order
                children :[
                  Form( //we will prvide a key to this form and by that key we will be
                    //able to validate all the features of the form
                    key : formkey,
                    child: Column(
                      children: [
                      TextFormField(
                        validator: (val){
                          return val.isEmpty || val.length < 2 ? "Please Provide UserName" : null;
                          //return "Write something meaning ful so this message will show beneath the line of username in red"

                        } ,
                      controller: userNameTextEditingController,
                      style: simpleTextStyle(),
                      decoration: textFieldInputDecoration("username"),
                    ),
                      TextFormField(
                        validator: (val){
                          return RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val) ? null: "Please provide a valid email ";

                        },
                      controller: emailTextEditingController,
                      style: simpleTextStyle(),
                      decoration: textFieldInputDecoration("email"),
                ),
                      TextFormField(
                        //to make sure that the password is  000 or ... is not visible
                          obscureText :true,
                        validator: (val){
                          return val.length > 6 ? null: "Please provide password greater than 6 characters";
                        },
                      controller: passwordTextEditingController,
                      style: simpleTextStyle(),
                      decoration : textFieldInputDecoration("password"),
                ),
                      ],
                    ),
                  ),

                  SizedBox(height:8,), //to provide a vertical padding beneath the password column
                  Container(
                    alignment: Alignment.centerRight,
                    child:Container( //we can align with align varabl as well nut we don't want to make it a hard click for the user that's why we will be using padding
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      child: Text("Forget Password?", style:simpleTextStyle(),),
                    ),
                  ),
                  SizedBox(height:8,), //to provide vertical space and that to horizontal coz take it as skipping the rows
                  GestureDetector(
                    //gesture dector widget has an ontap property func
                    onTap: (){
                      //first we will check the validation of the form
                      signMeUp();
                      //with this sign me up we can easily work on the parameter of username and if nothing is given it shows an error
                      //on the click og signup button
                      //with to do we can stand by to the event

                    },
                    child: Container(
                      //providing on click listener here
                      alignment : Alignment.center,   //to align text in centre
                      width: MediaQuery.of(context).size.width,// width should be equal to the width of the display
                      padding: EdgeInsets.symmetric(vertical: 20), //vertical is for to provide padding up and down of the matter which appears in blue color
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            //linear gradiant is used for to arrange the colors in a linear format
                              colors: [
                                const Color(0xff007EF4),
                                const Color(0xff2A75BC)
                              ]
                          ),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text("Sign Up", style: medTextStyle(), ),
                    ),
                  ), //they contain the elemnts of the body
                  SizedBox(height:16,), //to provide vertical space and that to horizontal coz take it as skipping the rows
                  Container(
                    alignment : Alignment.center,   //to align text in centre
                    width: MediaQuery.of(context).size.width,// width should be equal to the width of the display
                    padding: EdgeInsets.symmetric(vertical: 20), //vertical is for to provide padding up and down of the matter which appears in blue color
                    decoration: BoxDecoration(
                        color : Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Text("Sign Un with Google", style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),),
                  ),
                  // no we are working on the register option.. so there is a usecase of rich text as well but we won't be using it
                  //as we want to provide individual clickable text
                  //for this we will create a row which will have text arranged in a horizontal widget format

                  SizedBox(height: 16,),  // with a comma after height : 16 indicates that vertical width is null
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, //main axis alignment for column is vertical and for row is horzontal
                    children: [
                      Text("Already have an account?", style: medTextStyle(),
                      ),
                      Text("SignIn now", style:TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          decoration: TextDecoration.underline
                      ),),
                    ],
                  ),
                  SizedBox(height: 50,),

                ],),
            ),
          ),
        ));
      } catch (e, s) {
      print(s);
    }

  }


  }


