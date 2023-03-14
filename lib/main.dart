import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(HangmanGame());

class HangmanGame extends StatefulWidget {
  @override
  _HangmanGameState createState() => _HangmanGameState();
}

class _HangmanGameState extends State<HangmanGame> {
  String wordToGuess = "";
  List<String> lettersGuessed = [];
  int incorrectGuesses = 0;
  final List<String> words = [
    "prophetmohammad",
    "imamali",
    "imamhasan",
    "imamhusein",
    "imamzainalabidin",
    "imamalbaker",
    "imamalsadek",
    "imamalkazem",
    "imamalrida",
    "imamaljawad",
    "imamalhadi",
    "imamalaskari",
    "imamalmahdi",
    "aboalfadelalabbas",
    "alialakbar",
    "abotaleb",
    "hamzaasadoallah",
    "jaafaraltayyar",
    "prophetibrahim",
    "prophetissa",
    "prophetmousa",
    "prophetnouh",
    "prophetyousef",
    "prophetyaakoub",
    "prophetisaak",
    "prophetismael",
    "prophetharoun",
    "prophetyehya",
    "prophetzakaria",
    "prophetyoushaa3",
    "imamkhoumaini",
    "alsheikhalmoufid",
    "alsheikhalsadouk",
    "alsheikhaltousi",
    "alsheikhalwaeli",
    "alsheikhbahaaalameli",
    "abozarralghaffari",
    "almokdadbenamro",
    "ammarbenyaser",
    "malekalashtar",
    "mohammadbenabibakr",
    "habibebnmozaher",
    "zohairebnalkain",
    "jameswatson",
    "isaacnewton",
    "alexanderfleming",
    "electricity",
    "thomasedison",
    "johannesgutenberg",
    "alessandrovolta",
    "charlesbabbage",
    "timbernerslee",
    "grahambell",
    "johnbaird",
    "alberteinstein",
    "neilsbohr",
    "louispasteur",
    "johanneskepler",
    "nicolauscopernicus",
    "michaelfaraday",
    "jamesmaxwell",
    "ernestrutherford",
    "maxplanck",
    "pierredelaplace",
    "williamharvey",
    "carlgauss",
    "dimitrimendeleev",
    "euclid",
    "phythagorath",
    "gregormendel",
    "johndalton",
    "alexanderfleming",
    "Archimedes",
    "luispascal",
    "abonasralfarabi",
    "jaberalbattani",
    "mohammadibnbattuta",
    "mohammadibnrushd",
    "mohammadalkhwarizmi",
    "omarkhayyam",
    "abobakralrazi",
    "jaberibnhayyan",
    "ibnishaqalkindi",
    "hasanibnalhaytham",
    "abdallahibnalbitar",
    "alhuseinibnsina",
    "nasiraldintousi",
    "mohammadibnsirin",
    "mohammadalfarabi",
    "aboalkasemalzahrawi",
    "abojaafaribntufail",
    "mohmmadalbiruni",
    "abdalrahmanibnkhaldoun",
    "mohammadalmasoudi",
    "mohammadalidrisi",
    "billgates",
    "stevejobs",
    "linustorvalds",
    "markzuckerberg",
    "guidovanrossum",
    "larrypage",
    "brendaneich",
    "hedylamarr",
    "bjarnestroustrup",
    "dennisritchie",
    "timbernerslee",
    "stevewozniak",
    "larrypage",
    "brendaneich",
    "hedylamarr",
    "alanturing",
    "konradzuse",
    "robertmetcalfe",
    "alanshugart",
    "johnbackus",
    "garykildall",
    "christophersholes",
    "gracehopper",
    "dennisritchie",
    "bjarnestroustrup",
    "jamesgosling",
    "williamfetter",
    "hippocrates",
    "alfrednobel",
    "williamharvey"
  ];
  bool gameOver = false;
  String gameStatus = "playing";

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    setState(() {
      lettersGuessed = [];
      incorrectGuesses = 0;
      wordToGuess = words[Random().nextInt(words.length)];
      gameOver = false;
      gameStatus = "playing";
    });
  }

  bool isGameWon() {
    for (int i = 0; i < wordToGuess.length; i++) {
      if (!lettersGuessed.contains(wordToGuess[i])) {
        return false;
      }
    }
    return true;
  }

  bool isGameOver() {
    return incorrectGuesses >= 6;
  }

  void guessLetter(String letter) {
    setState(() {
      if (!lettersGuessed.contains(letter)) {
        lettersGuessed.add(letter);
        if (!wordToGuess.contains(letter)) {
          incorrectGuesses++;
        }
        if (isGameWon()) {
          gameOver = true;
          gameStatus = "won";
        } else if (isGameOver()) {
          gameOver = true;
          gameStatus = "lost";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 242, 189),
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 40,
          title: Text('Abdelilah Hangman Game'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10.0),
                Text(
                  'Guess the word',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: "Mirt",
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 147, 208)),
                ),
                SizedBox(height: 10),
                Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      maxLines: 1,
                      softWrap: false,
                      wordToDisplay(),
                      style: TextStyle(
                          fontSize: 28,
                          fontFamily: "Mirt",
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 190, 52)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Incorrect guesses: $incorrectGuesses',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: "Mirt",
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 147, 208)),
                ),
                SizedBox(height: 10),
                Image.asset(
                  'images/hangman_$incorrectGuesses.jpg',
                  width: 200.0,
                  height: 200.0,
                ),
                SizedBox(height: 16.0),
                Wrap(
                  spacing: 4,
                  children: [
                    for (var i = 0; i < 26; i++)
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          onPressed: gameOver
                              ? null
                              : () => guessLetter(
                                  String.fromCharCode('a'.codeUnitAt(0) + i)),
                          child: Text(
                            String.fromCharCode('a'.codeUnitAt(0) + i),
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Mirt",
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  gameStatus == "won"
                      ? "Congratulations You Win!"
                      : gameStatus == "lost"
                          ? "Sorry You Lose! The word was '$wordToGuess'"
                          : "",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Mirt",
                      fontWeight: FontWeight.bold,
                      color: gameStatus == "won"
                          ? Color.fromARGB(
                              255, 0, 190, 52) // Green color for 'won'
                          : Colors
                              .red // Red color for 'lost' // Default color for empty string,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                MaterialButton(
                  color: Color.fromARGB(255, 0, 147, 208),
                  colorBrightness: Brightness.light,
                  textColor: Colors.white,
                  child: Text("Restart",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Mirt",
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () {
                    setState(() {
                      startGame();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String wordToDisplay() {
    String result = '';
    for (var i = 0; i < wordToGuess.length; i++) {
      if (lettersGuessed.contains(wordToGuess[i])) {
        result += wordToGuess[i];
      } else {
        result += '_';
      }
      result += ' ';
    }
    return result;
  }
}
