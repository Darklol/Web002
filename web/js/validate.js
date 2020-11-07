// validateY and validateX just for index, not for graphics!

function validateY(){
    if (y == undefined) {
        alert("Please enter the Y");
        return false;
    } else if (!isNumeric(y)) {
        alert("Y should be a number");
        return false;
    } else if (!((y > -3) && (y < 3))) {
        alert("y is out of range");
        return false;
    } else {
        return true;}
}

function validateX() {
    if (isNumeric(x)) {
        // alert("X is good")
        return true;
    }
    else {
        alert("Please choose the X");
        return false;
    }
}

function validateR(){
    if (r==1.0 || r==1.5 || r==2.0 || r==2.5 || r==3.0){
        return true;
    }else {
        alert('Please choose a R-value instead of sending some bad value!!');
        return false;
    }

}

function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}