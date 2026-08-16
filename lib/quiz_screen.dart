import 'package:flutter/material.dart';
import 'questions.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {

  int currentQuestionNumber = 0;
  int optionSelected = -1;
  int score = 0;
  bool answered = false;

  // Color Pallet
  static const Color khaki = Color(0xFFE5F66D);
  static const Color softLavender = Color(0xFFC8BCF1);
  static const Color Lavender = Color(0xD3AB4AEF);

  @override
  Widget build(BuildContext context){

    Question currentQuestion = quizQuestions[currentQuestionNumber];
    List<Widget> optionWidgets = []; // a list that contains only widgets
                                    // i.e UI related elements.
    for(int i = 0; i < currentQuestion.options.length; i++)
      {
        Color borderColor = Colors.grey;
        Color backgroundColor = Colors.white;
        // updating the color if and only if it is answered
        if(answered == true)
          {
            if(i == currentQuestion.correctAnswerIndex) // option selected by user is correct
              {
                borderColor = Colors.green;
                backgroundColor = Colors.green.shade50;
              }
            else if (i == optionSelected) // user selected a option which is incorrect
              {
              borderColor = Colors.red;
              backgroundColor = Colors.red.shade50;
              }
          }
        optionWidgets.add(
            GestureDetector( // invisible tap listener
              onTap: answered
                  ?  null  // answered is true nothing needs to be done
                  : () {
                setState(() {
                  optionSelected = i;
                  answered = true;
                  if(optionSelected == currentQuestion.correctAnswerIndex){
                    score = score + 1;
                  }
                });
              },
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  Container( // actual visible thing that listener is wrapped around.
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // shape: BoxShape.rectangle, rely only on borderRadius.
                      color: backgroundColor,
                      border: Border.all(width: 2, color: borderColor),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      currentQuestion.options[i],
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Colors.grey.shade900,
                        height: 1.3,
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),
                ],
              ),
            ),
        );
      }

    return Scaffold(
      backgroundColor: softLavender,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CompquiZ ",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.laptop, size: 30),
          ],
        ),
        backgroundColor: Lavender,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row( // contains the question number and progress bar
                children: [
                  Text(
                    'Q. ${currentQuestionNumber + 1}',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey.shade800,
                    ),
                  ),

                  SizedBox(width: 12,),

                  Expanded( // LinearProgressIndicator has no natural width of its own such as text
                            // without expanded --> it will give error or collapse to zero width.
                      child: LinearProgressIndicator(
                        value: (currentQuestionNumber + 1) / quizQuestions.length,
                        backgroundColor: Colors.grey.shade300,
                        //color: Color(0xEF9760EA),
                        color: khaki,
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(10),
                      ),
                  ),
                ],
              ),

              SizedBox(height: 18,),

              Text(
                currentQuestion.question,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),

              SizedBox(height: 30,),

              ...optionWidgets, // adding options to the screen

              Spacer(),

              // now "next" button.
              Center(
                child: ElevatedButton(
                    onPressed: answered ? () {
                      if(currentQuestionNumber < quizQuestions.length - 1){
                        setState(() {
                          currentQuestionNumber = currentQuestionNumber + 1;
                          answered = false;
                          optionSelected = -1;
                        });
                      }
                      else{
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                  score: score,
                                  totalQuestions: quizQuestions.length,
                                ),
                            ),
                        );
                      }
                    }
                    : null,

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
                      'Next',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight(1000),
                      ),
                    ),
                ),
              ),

              SizedBox(height: 10,),

              // explanation for the answer:

              if(answered && currentQuestion.info != null)
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explanation:',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4,),
                      Text(
                        currentQuestion.info!,
                        // ! -> its telling dart that currentQuestion.info is guaranteed non-null String
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Column: arranges things one after another, top to bottom
//         that's why the widgets go down instead of overlapping
// Stack: layers things directly on top of each other, like transparent sheets
