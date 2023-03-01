// document.getElementById("lefteye").style.backgroundColor ="purple";
// document.getElementById("head").style.transform= "rotate(15deg)";
// document.getElementById("mouth").style.borderRadius = "4px";
// document.getElementById("body").style.border = "2px black solid";
// document.getElementById("righteye").style.border ="4px yellow dotted";
// document.getElementById("leftarm").style.backgroundColor ="#FF00FF";
// document.getElementById("body").style.color = "#FF0000";
// document.getElementById("head").style.borderTop ="5px black solid";
// document.getElementById("nose").style.borderRadius="100%"
// document.getElementById("rightarm").style.backgroundColor="green";
// document.getElementById("mouth").style.backgroundColor="pink";
var rightEye = document.getElementById("righteye");
var leftEye = document.getElementById("lefteye");
var leftArm = document.getElementById("leftarm");
var bodyS= document.getElementById("body");
leftArm.addEventListener("click", moveUpDown3);
leftEye.addEventListener("click", moveUpDown2);
rightEye.addEventListener("click", moveUpDown);
bodyS.addEventListener("click",changeColor);
function moveUpDown(e) {
    var robotPart = e.target;
    var left = 0;     
    var animation = setInterval(frame, 50);
    function frame() {
        robotPart.style.left = left + "%";
        left++;
        if (left === 20) {
            clearInterval(animation)
        }
    }

}

function moveUpDown2(e) {
    var robotPart2 = e.target;
    var left = 0;
    var animation = setInterval(frame, 50);
    function frame() {
        robotPart2.style.left = left + "%";
        left++;

        if (right === 70) {
            clearInterval(animation)
        }
    }

}
function moveUpDown3(e) {
    var robotPart3 = e.target;
    var top = 0;
    var animation = setInterval(frame, 70)
    function frame() {
        robotPart3.style.top = top + "%";
        top++;
        if (top === 50) {
            clearInterval(animation)
        }
    }
}
function changeColor(e){
    var robotPart4= e.target;
    var num =0;
    var animation = setInterval(frame,50);
    function frame(){
        robotPart4.style.backgroundColor="blue";
        if (num ===50){
            clearInterval(animation)
        }
    }
}
