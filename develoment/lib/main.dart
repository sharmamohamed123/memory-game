
// ignore_for_file: prefer_const_constructors, duplicate_ignore



import 'package:flutter/material.dart';
import 'package:pizza_assignment/utils/game_logic.dart';
import 'package:pizza_assignment/widgets/score_board.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key: key);

  Widget build(BuildContext context){
    return MaterialApp(home: Homeage());//MaterialApp
  }
}

//now lets create the home page of the app
//now lets run the application

//now we are going the to make game logic

class Homeage extends StatefulWidget {
  const Homeage({Key? key}):super(key: key) ;

  @override
  State<Homeage> createState() => _HomeageState();
}

class _HomeageState extends State<Homeage> {
  //lets start by inititen the game 
  Game _game = Game();
   //we will add stats variables 
  int tries =0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }


  @override
  Widget build(BuildContext context) {
     //we want that the board moke a screen width * screen_width size
  //lets get the screen width
  double screen_width = MediaQuery.of(context).size.width;
 
    return Scaffold(
      //lets add some colors
      backgroundColor: Color(0xFFe55870),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Center(
            child: Text(
              "Memory Game",
               style: TextStyle(
                 fontSize: 48.0,
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
                 ),
              ),
            ),
            SizedBox(height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //I am going to more custom widget function for the score board
                scoreBoard("Tries", "${tries}"),
                scoreBoard("Score", "${score}"),
              ],
              ),
              SizedBox(
                height:screen_width,
                width: screen_width,

                child: GridView.builder(
                  itemCount: _game.gameImg!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                ),
                padding: EdgeInsets.all(16.0),
                 itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      //here we are going to place all our game logic
                      print(_game.cards_list[index]);
                      setState(() {
                        tries++;
                        _game.gameImg![index] = _game.cards_list[index];
                        _game.matchCheck
                          .add({index:_game.cards_list[index]});
                      });
                      if(_game.matchCheck.length == 2){
                        if(_game.matchCheck[0].values.first == _game.matchCheck[1].values.first){
                          print("true");
                          score += 100;
                          _game.matchCheck.clear();
                        }else{
                          print(false);
                          Future.delayed(Duration(microseconds: 500), (){
                            print(_game.gameImg);
                            setState(() {
                              _game.gameImg![_game.matchCheck[0].keys.first] = 
                                  _game.hiddenCardpath;
                              _game.gameImg![_game.matchCheck[1].keys.first] = 
                                  _game.hiddenCardpath;
                              _game.matchCheck.clear();
                            });
                          });
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFB46A),
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(image: AssetImage(_game.gameImg![index]),
                        fit:BoxFit.cover,
                        ),
                      ),
                    ));
                  }),
                ),
        ],
      ),
    );
  }
}









