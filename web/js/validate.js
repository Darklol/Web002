function checkY(){
    if (y === undefined) {
        alert("Please choose the Y");
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

function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}