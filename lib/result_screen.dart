import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget{
  // These values are passed from quiz screen when we navigate here
  final int score;
  final int totalQuestions;
  // Constructor - this is how ResultScreen receives score and totalQuestions
  ResultScreen({required this.score, required this.totalQuestions});

  // Color Pallet
  static const Color khaki = Color(0xFFE5F66D);
  static const Color softLavender = Color(0xFFC8BCF1);
  static const Color highlightC = Color(0xff25e4de);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softLavender,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(score < 5)
                Image.asset('assets/images/Downfall.png', height: 400,)
              else
                Image.asset('assets/images/Winners.png', height: 400,),

              SizedBox(height: 20,),

              // Title text
              Text(
                'Quiz \n Completed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  height: 1.2,
                ),
              ),

              SizedBox(height: 12,),

              // Show the score
              Text(
                'You scored $score out of $totalQuestions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                  color: Colors.black,
                  backgroundColor: highlightC,
                ),
              ),

              SizedBox(height: 40,),

              // Play Again Button
              ElevatedButton(
                onPressed: () {
                  // Go back to brand new QuizScreen, starting fresh
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen()),
                  );
                },

                style: ButtonStyle(
                  backgroundColor:WidgetStatePropertyAll(khaki),
                  foregroundColor: WidgetStatePropertyAll(Colors.black),
                  elevation: WidgetStatePropertyAll(2),
                  fixedSize:WidgetStatePropertyAll(Size(200, 60)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: Text(
                  'Play Again',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight(1000),
                  ),
                ),
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
