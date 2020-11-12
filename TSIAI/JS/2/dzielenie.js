/**
 * sprawdza czy liczba jest podzielna przez inną
 * @param a liczba sprawdzana
 * @param b liczba przez którą dzielimy, domyślnie 2
 * @returns zwraca null gdy nie da się tego sprawdzić a true/false zależnie od rezultatu
 */
function dzielenie(a, b = 2){
    if (typeof a === "number"){
    if(isFinite(a) && isFinite(b))    return a % b === 0;
    else {
        console.error("infinity number");
        return null;
    }
    }else return null;
}