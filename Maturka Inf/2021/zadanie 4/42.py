file = open("znajomi_1.txt")
text = file.read()
lines = text.split("\n")
if lines.__contains__(""):
    lines.remove("")
persons = [i for i in range(0, int(lines[0]))]

for i in range(1, len(lines)):
    line = lines[i].split(" ")
    if line.__contains__(""):
        line.remove("")
    for j in range(1, len(line)):
        if persons.__contains__(int(line[j])):
            persons.remove(int(line[j]))

if 0 < persons.__sizeof__():
    for person in persons:
        print(person, end=" ")
else:
    print(-1)
