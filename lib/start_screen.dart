import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  // Color Pallet
  static const Color khaki = Color(0xFFE5F66D);
  static const Color softLavender = Color(0xFFC8BCF1);
  static const Color Lavender = Color(0xD3AB4AEF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: softLavender,

      body: Center( // centered Horizontally
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // center vertically
          children: [
            Image.asset('assets/images/curiosity_brain.png', // image used from STORYSET.
              height: 380,),
            SizedBox(height: 12,),

            Text(
              'Think you know it all? \n Prove it.',
              textAlign: TextAlign.center,
              style: TextStyle( //Styling related to text
                  fontSize: 37,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  height: 1.3,
              ),
            ),

            SizedBox(height: 36,), // empty spaces between children.
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen()),
                  );
                  //print('Get Started Tapped!'); // I used it to check whether the button is working or not.
                },

              style: ButtonStyle(
                backgroundColor:WidgetStatePropertyAll(khaki),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
                elevation: WidgetStatePropertyAll(2),
                fixedSize:WidgetStatePropertyAll(Size(400, 50)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

                child: const Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  // By default a row takes up the whole horizontal space available, even if the actual content is smaller
                  // This shrinks tightly around just icon + gap + text.
                  children: [
                    Icon(Icons.lightbulb_outline, size: 22,),
                    SizedBox(width: 8,), // adds space between icon and text width here and not height
                    Text(
                      'Get Started!',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight(1000),
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
            )
          ],
        ),
      )
    );
  }
}