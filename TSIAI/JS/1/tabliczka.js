/**
 * funkcja tworzy tabliczkę mnożenia o określonej liczbie wierszy i kolumn
 * @param maxY - ostatnia liczba w pierwszej kolumnie
 * @param maxX - ostatnia liczba w pierwszym wierszu
 * @param minY - perwsza liczba w pierewszej kolumnie
 * @param minX - pierwsza liczba w pierwszym wierszu
 */
function tabliczka(maxY = 10, maxX = 10, minY = 0, minX = 0) {
    const body = document.getElementsByTagName('body')[0];
    const tbl = document.createElement('table');
    const tbdy = document.createElement('tbody');
    minX -= 1;
    minY -= 1;

    const title = document.createElement('h1');
    title.textContent = "Tabliczka Mnożenia\n";
    body.appendChild(title);

    for (let y = minY; y <= maxY; y++) {
        const tr = document.createElement('tr');
        for (let x = minX; x <= maxX; x++) {
            const td = document.createElement('td');
            switch (true){
                case y === minY && x === minX:
                    td.textContent =  " ";
                    td.setAttribute('class', 'zero');
                    break;
                case y === minY:
                    td.textContent = x.toString();
                    td.setAttribute('class', 'top');
                    break;
                case x === minX:
                    td.textContent = y.toString();
                    td.setAttribute('class', 'left');
                    break;
                default:
                    td.textContent = (x * y).toString();
                    td.setAttribute('class', 'tbody');
            }
            tr.appendChild(td);
        }
        tbdy.appendChild(tr);
    }
    tbl.appendChild(tbdy);
    body.appendChild(tbl)
}

