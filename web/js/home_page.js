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
        r = $('#r-value').children("option:selected").val();
        y = $('#y-value').val().replace(",", ".");
        if (validateR() && validateY() && validateX()) {
            sendSecretForm();
        }
    })

    function sendSecretForm() {
        $('#x').val(x);
        $('#y').val(y);
        $('#r').val(r);
        $('#secret-form').submit();
    }



}

