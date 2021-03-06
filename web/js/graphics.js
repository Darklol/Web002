// let CANVAS_WIDTH = 300;
// let CANVAS_HEIGHT = 300;
// let CANVAS_R_VALUE = 120;
// let DEFAULT_R_VALUE = 2;
let plot = $(".graphics svg");

function fromRToSvgX(x, r) {
    return x / r * 120 + 300 / 2;
}

function fromRToSvgY(y, r) {
    return 300 / 2 - y / r * 120;
}

function fromSvgToRX(x, r) {
    return r * (x - 300 / 2) / 120;
}

function fromSvgToRY(y, r) {
    return r * (300 / 2 - y) / 120;
}


function getRValue() {
    const rTest = $('#r-value').children("option:selected").val();
    let rValue;

    // if there is answer page without form
    if (rTest === undefined) {
        rValue = parseFloat($(".table-row").first().find(">:nth-child(3)").text());
        // if somebody send get request to /controller then table will be empty

    } else {
        rValue = $('#r-value').children("option:selected").val();
    }
    return rValue;
}

function clickPlotHandler(e) {
    const offset = $(this).offset();
    const x = e.pageX - offset.left;
    const y = e.pageY - offset.top;
    // alert(x+y);
    const rValue = getRValue();

    if (rValue !== null) {
        const xValue = fromSvgToRX(x, rValue);
        const yValue = fromSvgToRY(y, rValue);

        sendSecretForm();

        // document.location.reload();
        function sendSecretForm() {
            $('#x').val(xValue);
            $('#y').val(yValue);
            $('#r').val(rValue);
            $('#secret-form').submit();
        }
    }

}

plot.click(clickPlotHandler);
