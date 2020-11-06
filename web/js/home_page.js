let x;
let y;
let r;
window.onload = function () {
// When you check one X button, the other will be canceled. And the r will be set
    $('.X-button').click(function () {
        $('.X-button').removeClass('active');
        $(this).addClass('active');
        x = $(this).text();
    });

    $('#submit-button').click(function () {
        r = $('#r-value').val();
        y = $('#y-value').val().replace(",", ".");
        if (validateR() && validateY() && validateX()) {
            $.ajax({
                type: "GET",
                url: "controller",
                data: {
                    "x-value": x,
                    "y-value": y,
                    "r-value": r
                },
                success: function () {
                    if (getUrlContext() !== "answer.jsp") {
                        document.location.href = "answer.jsp";
                    } else {
                        document.location.reload();
                    }
                }

            })
        }
    })


}

