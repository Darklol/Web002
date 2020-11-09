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
        return $('#r-value').children("option:selected").val();
}


function getUrlContext() {
    const link = document.location.href.split('/');
    return link[3];
}

function clickPlotHandler(e) {
    alert('some trifling')
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
    // $.ajax({
    //     type: "GET",
    //     url: "controller",
    //     data: {
    //         "x-value": xValue,
    //         "y-value": yValue,
    //         "r-value": rValue
    //     },
    //     success: function () {
    //         if (getUrlContext() !== "answer.jsp") {
    //             document.location.href = "answer.jsp";
    //         } else {
    //             document.location.reload();
    //         }
    //     }
    // })

}

plot.click(clickPlotHandler);

function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

function getRfromURL() {
    let params = {};
    let parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        params[key] = value;
    });
    return params["r"];
}
