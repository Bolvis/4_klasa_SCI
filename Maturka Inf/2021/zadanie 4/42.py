file = open("znajomi_2.txt")
text = file.read()
lines = text.split("\n")
if lines.__contains__(""):
    lines.remove("")
osoby = [i for i in range(0, int(lines[0]))]

for i in range(1, len(lines)):
    line = lines[i].split(" ")
    if line.__contains__(""):
        line.remove("")
    for j in range(1, len(line)):
        if osoby.__contains__(int(line[j])):
            osoby.remove(int(line[j]))

if 0 < osoby.__sizeof__():
    for osoba in osoby:
        print(osoba, end=" ")
else:
    print(-1)
