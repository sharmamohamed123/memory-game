

class Game{
  final String hiddenCardpath = "assets/images/hidden.png";
  List<String>? gameImg;

  //now re going make the recto of each cards
  //so we can play
  final List<String> cards_list =[
    "assets/images/circle.jpg",
    "assets/images/triangle.jpg",
    "assets/images/circle.jpg",
    "assets/images/heartt.png",
    "assets/images/star.jpg",
    "assets/images/triangle.jpg",
    "assets/images/star.jpg",
    "assets/images/heartt.png",
  ];
   //in this list wel store two first clicked  card see if they match or not 
  List<Map<int, String>> matchCheck = [];




  final int cardCount = 8;

  //init the game 
  void initGame(){
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }

}