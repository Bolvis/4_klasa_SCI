function kwadratowe(a, b, c = 0){
    if(typeof  a === "number" && typeof b === "number" && typeof c === "number" && a !== 0){
        draw(a,b,c);
        const delta = Math.pow(b,2) - (4*(a*c));
        if(delta >= 0){
            const x1 = (-1 * b + Math.sqrt(delta))/2*a;
            const x2 = (-1 * b - Math.sqrt(delta))/2*a;
            return [x1, x2]; 
        }else return false;
    }else return false;
}

function draw(a,b,c){
    const ctx = document.getElementById("myChart");
    const data = {
        labels: range(-50,50),
        datasets: [{
            label: "f(x) = x",
            function: function(x) {
                return (a * Math.pow(x,2)) + ( b * x ) + c
            },
            borderColor: "rgba(75, 192, 192, 1)",
            data: [],
            fill: false
        },]
    };

    Chart.pluginService.register({
        beforeInit: function(chart) {
            const data = chart.config.data;
            for (let i = 0; i < data.datasets.length; i++) {
                for (let j = 0; j < data.labels.length; j++) {
                    const fct = data.datasets[i].function,
                        x = data.labels[j],
                        y = fct(x);
                    data.datasets[i].data.push(y);
                }
            }
        }
    });

    const myBarChart = new Chart(ctx, {
        type: 'line',
        data: data,
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

}

function range(min, max) {
    const len = max - min + 1;
    const arr = new Array(len);
    for (let i=0; i<len; i++) {
        arr[i] = min + i;
    }
    return arr;
}
