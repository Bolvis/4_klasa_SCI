primeNums = [3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
file = open("./Dane_PR2/pary.txt")
wholeText = file.read()
pairs = wholeText.split("\n")
pairs.remove("")

def goldbach(number):
    prime_one = 0
    prime_two = 0
    for num_1 in primeNums:
        for num_2 in primeNums:
            if num_1 + num_2 == number and num_1 - num_2 <= prime_one + prime_two:
                prime_one = num_1
                prime_two = num_2
    return prime_one, prime_two


def calc_pairs(int_and_str):
    num = int(int_and_str.split(" ")[0])
    if num % 2 == 0:
        num1, num2 = goldbach(num)
        print(f"{num} {num2} {num1}")


def calc_letters(int_and_str):
    word = int_and_str.split(" ")[1]
    count = 1
    temp_count = 1
    index = 0
    for i in range(len(word)-1):
        if word[i] == word[i + 1]:
            temp_count += 1
        else:
            temp_count = 1
        if temp_count > count:
            count = temp_count
            index = i
    print(word[index] * count, str(count))


def smallest():
    lis_of_equal = list()
    for PAIR in pairs:
        int_and_str = PAIR.split(" ")
        if int(int_and_str[0]) == len(int_and_str[1]):
            lis_of_equal.append(int_and_str)
    result = lis_of_equal[0]
    for item in lis_of_equal:
        if int(item[0]) < int(result[0]) or (int(item[0]) == int(result[0]) and item[1] < result[1]):
            result = item
    print(f"{result[0]} {result[1]}")


for pair in pairs:
    calc_pairs(pair)

for pair in pairs:
    calc_letters(pair)

smallest()
