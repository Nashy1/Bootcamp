// listen for button clicks
document.getElementById("placeOrder").addEventListener("click", placeOrder);

/**
 * gets form values
 * calculates prices
 * produces output
 */
function placeOrder() {
    // get form values
    var numPizzas = document.getElementById("numPizzas").value;
    var typePizza = document.getElementById("typePizza").value;
    var deliveryCity = document.getElementById("deliveryCity").value;
    var birthday = document.getElementById("birthday").value;

    // get the pizza price
    var orderPrice = calculatePrice(numPizzas, typePizza);

    // get the delivery price
    var deliveryPrice = calculateDelivery(orderPrice, deliveryCity,birthday);

    // create the output
    var theOutput = "<p>Thank you for your order.</p>";

    // todo: output the delivery price, if there is one
    if (deliveryPrice === 0){
        theOutput += "<p>Your delivery is free </p>";
    } else{
        theOutput += "<p>Your total is: $" + deliveryPrice;
    }

    theOutput += "<p>Your total is: $" + (orderPrice + deliveryPrice);

    // display the output
    document.getElementById("displayTotal").innerHTML = theOutput;
}

/**
 * calculates pizza price
 */
function calculatePrice(numPizzas, typePizza) {
    var orderPrice = Number(numPizzas) * 10;
    var extraCharge = 0;
    if(typePizza==="supreme"){
        extraCharge=Number(numPizzas)*2
    }
    // todo: calculate extraCharge, if there is one.
    
    orderPrice += extraCharge;
    return orderPrice;
}

/**
 * calculates delivery price
 */
function calculateDelivery(orderPrice, deliveryCity) {
    var deliveryPrice = 0;
    if ((deliveryCity === "AnyTown") && (orderPrice > 10) || (birthday === "yes")){
        deliveryPrice= 0;
    } else {
        deliveryPrice= 5;
    }
    // todo: calculate delivery price, if there is one
    
    return deliveryPrice;
}
