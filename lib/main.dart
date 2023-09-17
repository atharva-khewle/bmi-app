import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _weight = TextEditingController();
  final _height = TextEditingController();
  double _bmi =999;
  String _sbmi = "Enter Input";



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blueAccent[100],
      body: SingleChildScrollView(
        child: Container(

          height: 740,
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

//---------------------------------------text areas-------------------------------------------------
                Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        children: [
                          Container(height: 63 , color: Colors.blue[800],),
                          Container(height: 25),

                          Container(height: 63,child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Center(child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Container( width: 260,height: 50,color: Colors.blueAccent,child: Center(child: Text("BMI CALCULATOR", style: TextStyle(fontSize: 25))))))),),
                          Container(height: 23),

                          //------------------------text 1---------------------------------------------
                          Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                             Container(width: 100,height: 60,child: Container(child: Center(child: Text("Weight :",style: TextStyle(fontSize: 25)),),),),
                            SizedBox(width: 20,),
                            Container(
                              child: Center(child: Container( height: 70,width: 250,
                                child: TextField(

                                  cursorColor: Colors.red,
                                  keyboardType: TextInputType.number,
                                  controller: _weight,
                                  decoration: InputDecoration(
                                      hintText: "Enter your weight (kg)",
                                      border: OutlineInputBorder()),

                                ),
                              )),
                            ),
                          ],),

                          //-----------------------------------------------------------------------
                          SizedBox(height: 25,),
                          //----------------------------text2-------------------------------------------
                          Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                            Container(width: 100,height: 60,child: Container(child: Center(child: Text("Height :",style: TextStyle(fontSize: 25)),),),),
                            SizedBox(width: 20,),
                            Container(
                              child: Center(child: Container( height: 70,width: 250,
                                child: TextField(

                                  cursorColor: Colors.red,
                                  keyboardType: TextInputType.number,
                                  controller: _height,
                                  decoration: InputDecoration(
                                      hintText: "Enter your height (m)",
                                      border: OutlineInputBorder()),

                                ),
                              )),
                            ),
                          ],),

                        ],
                      ),

                )),

//-----------------------------------------SUBMIT --------------------------------------------------

                Container(
                    child: Container(

                      width: 150,
                      height: 55,

                      child: Container(

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),

                          child: GestureDetector(
                            onTap: (){
                              setState(() {

                                _bmi = double.parse(_weight.text)/(double.parse(_height.text)*double.parse(_height.text));
                                _sbmi = (_bmi).toStringAsFixed(2);
                                FocusManager.instance.primaryFocus?.unfocus();
                              });
                            },
                            child: Container(

                              color: Colors.lightBlue[800],
                              child: Center(child: Text('SUBMIT', style: TextStyle(color: Colors.white,fontSize: 20),)),
                            ),
                          ),
                        ),
                      ),
                    )),

//-----------------------------------------------------------------------------------------
                SizedBox(height: 50,),
//--------------------------------------------------result box---------------------------------------

                Container(
                  height: 260,
                  width: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.blueAccent,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(child: Center(child: Text("YOUR BMI:" , style: TextStyle(fontSize: 30),),),),
                          SizedBox(height: 10,),
                          Container(child: ClipRRect( borderRadius: BorderRadius.circular(10),child: Container(color: _bmi<18.5?Colors.red:_bmi<25?Colors.greenAccent[400]:_bmi<30?Colors.redAccent[200]:_bmi<35?Colors.red[600]:_bmi<998?Colors.redAccent[700]:Colors.lightBlue[800],child: Center(child: Text("${_sbmi}", style: TextStyle(fontSize: 25))))), height: 50,width: 200,),

                          SizedBox(height: 30,),


                          Container( child: Center(child: Text("RESULTS:" , style: TextStyle(fontSize: 30),),),),
                          SizedBox(height: 10,),

                          Container( child: ClipRRect( borderRadius: BorderRadius.circular(10), child: Container(color:  _bmi<18.5?Colors.red:_bmi<25?Colors.greenAccent[400]:_bmi<30?Colors.redAccent[200]:_bmi<35?Colors.red[600]:_bmi<998?Colors.redAccent[700]:Colors.lightBlue[800],width: 200,height: 50,child: Center(child: Text(_bmi<18.5?"UNDERWEIGHT":_bmi<25?"NORMAL":_bmi<30?"OVERWEIGHT":_bmi<35?"OBESE":_bmi<998?"EXTREMELY OBESE":"Enter Input", style: TextStyle(fontSize: 20),)))),),
                        ],
                      ),
                    ),

                  ),
                ),
                //-----------------------------------------------------------------------------------------


              ],
            ),
          ),
        ),
      ),
    );
  }


}
