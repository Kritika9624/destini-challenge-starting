import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain sb = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    sb.getStory(),
                    // 'Story text will go here.',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    // foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 0),
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(4.0),
                    // ),
                  ),
                  onPressed: () {
                    //Choice 1 made by user.
                    setState(() {
                      sb.nextStory(1);
                    });
                  },
                  // color: Colors.red,
                  child: Text(
                    sb.getChoice1(),
                    // 'Choice 1',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: sb.buttonShouldBeVisible(),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(vertical: 32, horizontal: 0),
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(4.0),
                      // ),
                    ),
                    onPressed: () {
                      //Choice 2 made by user.
                      setState(() {
                        sb.nextStory(2);
                      });
                    },
                    // color: Colors.blue,
                    child: Text(
                      sb.getChoice2(),
                      // 'Choice 2',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
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

//Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/