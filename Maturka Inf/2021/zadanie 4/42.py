file = open("znajomi_2.txt")
text = file.read()
lines = text.split("\n")
if "" in lines:
    lines.remove("")
persons = [i for i in range(0, int(lines[0]))]

for i in range(1, len(lines)):
    line = lines[i].split(" ")
    if "" in line:
        line.remove("")
    for j in range(1, len(line)):
        if int(line[j]) in persons:
            persons.remove(int(line[j]))

if 0 < len(persons):
    for person in persons:
        print(person, end=" ")
else:
    print(-1)
