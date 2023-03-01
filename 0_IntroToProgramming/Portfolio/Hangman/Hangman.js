var words = [
    "javascript",
    "monkey",
    "amazing",
    "pancake",
    "lava",
    "brown",
    "red",
    "zero"
];
var word = pickWord();
var answerArray = setupAnswerArray();
var remainingLetters = word.length;
var numberOfGuess = 20;
while (remainingLetters > 0 && numberOfGuess > 0) {
    showPlayerProgess();
    var guess = prompt("Guess a letter, or click Cancel to stop playing " + numberOfGuess + " number of guess left.")
    numberOfGuess--;



    if (guess === null) {
        break;
    } else if (guess.length !== 1) {
        alert("Plaese enter a single letter.");
    } else {
        var cGuesses = updateGameState();
        remainingLetters -= cGuesses;
    }
}
showAnswerAndCongretulatePlayer();


function pickWord() {
    return words[Math.floor(Math.random() * words.length)];
}
function setupAnswerArray() {
    var answerArray = [];
    for (var i = 0; i < word.length; i++) {
        answerArray[i] = "_";
    }
    return answerArray;
}
function showPlayerProgess() {
    alert(answerArray.join(" "));

}




function updateGameState() {
    var cGuess = 0;
    for (var a = 0; a < word.length; a++)
        if (word[a] === guess) {
            if (answerArray[a] === "_") {
                answerArray[a] = guess;
                cGuess++;
            } else {
                alert("You have already guessed the letter");
                guess = " ";
            }
        }
    return cGuess;

}
function showAnswerAndCongretulatePlayer() {
    if (remainingLetters == 0) {
        alert(answerArray.join(" "));
        alert("Good job! The answer was " + word);
    } else {
        alert("Sorry you have ran out of Guess");

    }

}
