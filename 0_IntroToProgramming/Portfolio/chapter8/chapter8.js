var dreamCar = {
    make: "Oldsmobile",
    model: "98",
    color: "brown",
    year: 1983,
    bodyStyle: "Sport Car",
    price: 4500
    }
   // alert ("The type of dream car is: " + typeof dreamCar);
    document.getElementById("pricetag").innerHTML= dreamCar.price;
    document,getElementById("modelayer").innerHTML= dreamCar.model;
    document.getElementById("body").style.backgroundColor= dreamCar.color;
    document.getElementById("body").innerHTML= dreamCar.make + " " + dreamCar.model;