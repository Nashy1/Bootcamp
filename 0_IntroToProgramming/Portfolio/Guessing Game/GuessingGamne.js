
      var y = Math.floor(Math.random() * 10 -1);
      var guess = 1;
  
      document.getElementById("submitguess").onclick = function(){
  
          
          var x = document.getElementById("guessField").value;
  
          if(x == y)
          {    
            alert("CONGRATULATIONS!!! YOU GUESSED IT RIGHT IN "
                  + guess + " GUESS ");
          }
          else if(x > y) /* if guessed number is greater than actual number*/
          {    
            guess++;
            alert("OOPS SORRY!! TRY A SMALLER NUMBER");
          }
          else
          {
            guess++;
            alert("OOPS Sorry!! Try a Greater number")
          }
        }
