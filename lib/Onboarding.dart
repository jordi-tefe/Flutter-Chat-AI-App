import 'package:jordi_gpt/MyHomePage.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
          Column(
            children: [
              Text(
                'Your AI Assistant',
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                     SizedBox(height: 16,
                     width: 10,),
                Text(
                  'Using This Software, You can ask you a questions and receive articles using artificial intellegence assistant',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.primary
                  
                ),
                
                )
            ],
          ),
               SizedBox(height: 32,),
               Image.asset('assets/onboarding.png'),
               SizedBox(height: 32,),
               
               ElevatedButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute
                    (builder: (context)=>const MyHomePage()),
                    (route) =>false);


                },
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  padding: EdgeInsets.symmetric( vertical: 16,horizontal: 32)
                ),
                 child: Row(
                 mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Continue',
                    style: TextStyle(
                      color: Colors.white
                    ),),
                    SizedBox(height: 8,),
                    Icon(Icons.arrow_forward,
                    color: Colors.white,),
                    
                  ],
                 ))
          
                ],
              ),
        ));
  }
}
