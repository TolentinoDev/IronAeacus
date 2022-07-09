import 'package:flutter/material.dart';

class WorkoutTile extends StatelessWidget{

  String workoutName;
  String reps;
  String weight1state;
  String weight2state;
  String weight3state;
  Function textboxCallback;

  WorkoutTile({
    required this.workoutName,
    required this.reps,
    required this.weight1state,
    required this.weight2state,
    required this.weight3state,required this.textboxCallback

  });

  String entryText = 'Log';

  String entryText2 = 'Log';

  String entryText3 = 'Log';

  Widget buildBottomSheet (BuildContext context){
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column (
          children: <Widget> [
        Text("Add weight"
        ,
        style: TextStyle(
          fontSize: 40.0,
          color: Colors.deepOrangeAccent
        )),
        TextField(
          autofocus: true,
          textAlign: TextAlign.center,
          onChanged: (value) {
              entryText = value;
          },
        ),
            MaterialButton(
                child: Text('Add'),
                color: Colors.deepOrangeAccent,
                onPressed: (){
                  weight1state = entryText;
                  //textboxCallback(weight1state,weight2state,weight3state);
                  print(entryText);
                  Navigator.pop(context);
                })
        ]
      ),
      ),
    );
  }

  Widget buildBottomSheet2 (BuildContext context){
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column (
            children: <Widget> [
              Text("Add weight"
                  ,
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.deepOrangeAccent
                  )),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                    entryText2 = value;
                }
              ),
              MaterialButton(
                  child: Text('Add'),
                  color: Colors.deepOrangeAccent,
                  onPressed: (){
                    print(entryText2);
                    //textboxCallback(weight1state,weight2state,weight3state);
                    weight2state = entryText2;
                    Navigator.pop(context);
                  })
            ]
        ),
      ),
    );
  }

  Widget buildBottomSheet3 (BuildContext context){
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column (
            children: <Widget> [
              Text("Add weight"
                  ,
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.deepOrangeAccent
                  )),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                    entryText3 = value;
                }
              ),
              MaterialButton(
                  child: Text('Add'),
                  color: Colors.deepOrangeAccent,
                  onPressed: (){
                    weight3state = entryText3;
                    textboxCallback(weight1state,weight2state,weight3state);
                    print(entryText3);
                    Navigator.pop(context);
                  })
            ]
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Container(
    height: 200,
    //color: Colors.deepOrange[200],
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
              color: Colors.deepOrange[400],
              borderRadius: BorderRadius.circular(15)
      ) ,
      child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Workout'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text('${workoutName}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text('${workoutName}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text('${workoutName}'),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Reps'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text('${reps}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text('${reps}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text('${reps}'),
                      )
                    ],
                  ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text('Weight'),
                        ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: SizedBox(

                        width: 55,
                        height: 40,
                        child: DecoratedBox
                          (decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(5)),

                        child: MaterialButton(
                          onPressed: () {
                            showModalBottomSheet(context: context, builder: buildBottomSheet);
                          },
                            child:Text('Log')
                        )
                              ),
                      ),
                    ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: SizedBox(

                            width: 55,
                            height: 40,
                            child: DecoratedBox
                              (decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(5)),

                                child: MaterialButton(
                                    onPressed: () {
                                      showModalBottomSheet(context: context, builder: buildBottomSheet2);
                                    },
                                    child:Text('$entryText2')
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: SizedBox(

                            width: 55,
                            height: 40,
                            child: DecoratedBox
                              (decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(5)),

                                child: MaterialButton(
                                    onPressed: () {

                                      showModalBottomSheet(context: context, builder: buildBottomSheet3);
                                    },
                                    child:Text('$entryText3')
                                )
                            ),
                          ),
                        ),

                      ],

                    ),


                ],
              ),

            ],
      ),


    ),
          ],
        ));
    }
}
