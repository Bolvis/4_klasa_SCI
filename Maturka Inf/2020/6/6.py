file = open("./../Dane_PR2/statek.txt")
text = file.read()
lines = text.split("\n")
lines.remove("")


def first():
    towar = [0, 0, 0, 0, 0]
    biggest = 0
    name = 0
    for index in range(len(lines)):
        if index > 0:
            line = lines[index]
            data = line.split("\t")
            if data[3] == "Z":
                if data[2] == 'T1':
                    towar[0] += 1
                if data[2] == 'T2':
                    towar[1] += 1
                if data[2] == 'T3':
                    towar[2] += 1
                if data[2] == 'T4':
                    towar[3] += 1
                if data[2] == 'T5':
                    towar[4] += 1
    for index in range(len(towar)):
        if towar[index] > biggest:
            biggest = towar[index]
            name = index + 1
    print(str(biggest) + " T" + str(name))

first()
