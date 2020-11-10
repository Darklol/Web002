
function drawPointsFromTableData() {
    let newR;
    let i = 0;
    $(".table-row").each(function () {
        const query = $(this);
        const x = parseFloat(query.find(">:first-child").text());
        const y = parseFloat(query.find(">:nth-child(2)").text());
        const r = parseFloat(query.find(">:nth-child(3)").text());
        if(i === 0){
            newR = r;
            i = 1
        }
        const color = query.find(">:nth-child(5)").css("color");

        // insert new dot))))
        const existingContent = plot.html();
        const contentToInsert = `<circle r="4" cx="${fromRToSvgX(x, newR)}" cy="${fromRToSvgY(y, newR)}" fill="${color}"></circle>`;
        plot.html(existingContent + contentToInsert);
    });
}

drawPointsFromTableData();