import 'dart:io';
import 'dart:math';
import 'hangman_stages.dart';


var guessed_letters = "";
var x=guessed_letters.split('');


bool isAlpha(String str) {
  return RegExp(r'^[a-zA-Z]+$').hasMatch(str);
}

 select_word(var words){
    final _random = new Random();

     return  words[_random.nextInt(words.length)];

 }   

 print_secret_word(secret_word, guessed_letters){
      var sampleToList=secret_word.split('');

    for(var i in sampleToList) {
        if(guessed_letters.contains(i)){
            stdout.write('${i} ');

        }else{
             stdout.write(" _ ");  
        }
    }
    print('\n');

   }


 is_guess_in_secret_word( guess, secret_word){

    if( guess.length > 1 || !isAlpha(guess) ){ 
        print("Only single letters are allowed. Unable to continue...");
        exit(0);
        }
    else{
        if (secret_word.contains(guess)) {
    
            return true;
            }
        else{
            return false;
            }
       }
 }
    //return guess.toLowerCase();}

 get_unique_letters(String word){
  var sampleStringAsList = word.split('');
  var sampleStringAsSet = sampleStringAsList.toSet().toList().join('');
  return sampleStringAsSet ;
  
  }


void main(){

var words = ["tiger", "tree", "underground", "giraffe", "chair"];


var remaining_attempts = 6;

print("Welcome to the Hangman Game! Let's see if you can guess this word!\n");  //1  ok 

 // it well choose a random word from the list
String secret_word = select_word(words); //okk

print(get_hangman_stage(remaining_attempts));                          //2

print(" _ " * secret_word.length);




while (remaining_attempts > 0 && guessed_letters.length < get_unique_letters(secret_word).length){

print("Guess a letter: ");
String guess = stdin.readLineSync()!;
var guess_in_secret_word = is_guess_in_secret_word(guess, secret_word);




if (guess_in_secret_word){

    if (guessed_letters.contains(guess)){
        print("You have already guessed the letter ${guess}.");
    }  
    else{
        print("Yes! The letter ${guess} is part of the secret word");
        guessed_letters += guess;
        }
    }
else{
        print("No! The letter ${guess} is not part of the secret word");
        remaining_attempts -= 1;
    }

print(get_hangman_stage(remaining_attempts));                          //2

print("\n${remaining_attempts} attempts remaining\n");             //3

print_secret_word(secret_word, guessed_letters);                // -------

print("\n\nNumber of letters guessed: ${guessed_letters.length}\n");   //4

}


if (guessed_letters.length == (get_unique_letters(secret_word)).length)
    print("+++ Well done, you have won this game! +++\n");
else
    print("--- Sorry, you have lost this game! ---\n");

}

