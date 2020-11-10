
function getResult(x,y,r){
    //Quarter part
    let firstQuarter = x >= 0 && y >= 0;
    let thirdQuarter = x <= 0 && y <= 0;
    let fourthQuarter = x >= 0 && y <= 0;
    //check part
    return (fourthQuarter && (x<=r/2) && (y>=-r)) ||
        (thirdQuarter && (x*x + y*y <= r*r/4)) ||
        (firstQuarter && (y <= -x + r/2));
}
function drawPointsFromTableData() {
    let newR;
    let rFlag = false;
    $(".table-row").each(function () {
        const query = $(this);
        const x = parseFloat(query.find(">:first-child").text());
        const y = parseFloat(query.find(">:nth-child(2)").text());
        const r = parseFloat(query.find(">:nth-child(3)").text());
        // let color = query.find(">:nth-child(5)").css("color");
        if(!rFlag){
            newR = r;
            rFlag = true;
        }
        const existingContent = plot.html();
        const contentToInsert1 = `<circle r="4" cx="${fromRToSvgX(x, newR)}" cy="${fromRToSvgY(y, newR)}" fill="green"></circle>`;
        const contentToInsert2 = `<circle r="4" cx="${fromRToSvgX(x, newR)}" cy="${fromRToSvgY(y, newR)}" fill="red"></circle>`;
        if (getResult(x,y,newR)){
            plot.html(existingContent + contentToInsert1);
        }else {
            plot.html(existingContent + contentToInsert2);
        }



        // insert new dot))))

        // plot.html(existingContent + contentToInsert);
    });
}

drawPointsFromTableData();