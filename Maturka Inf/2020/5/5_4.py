file = open("5_4.txt")
text = file.read()
lines = text.split("\n")
lines.remove("")
languages_num = []
languages_name = []
family_name = []
for index in range(len(lines)):
    line = lines[index].split("\t")
    num = line[2].split(",")
    num = float(num[0]) + (float(num[1])/100)
    if languages_name.count(line[0]) == 0:
        languages_name.append(line[0])
        family_name.append(line[1])
        languages_num.append(num)
    else:
        for name_index in range(len(languages_name)):
            if languages_name[name_index] == line[0]:
                languages_num.insert(name_index,languages_num.pop(name_index) + num)
new_file = open("5_4_py_result.txt","w")
for index in range(len(languages_name)):
    new_file.write(languages_name[index] + "\t" +family_name[index] + "\t" + str(round(languages_num[index],1)) + "\n")
#plik jest na tyle mały, że można przepisać te 6 języków ręcznie