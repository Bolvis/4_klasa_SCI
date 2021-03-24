file = open("galerie_przyklad.txt")
text = file.read()
lines = text.split("\n")

biggest = float("-inf")
biggest_name = ""
smallest = float("inf")
smallest_name = ""

for line in lines:
    items = line.split(" ")
    sizes = []
    for i in range(2, len(items) - 1, 2):
        size = int(items[i]) * int(items[i+1])
        if not sizes.__contains__(size) and size != 0:
            sizes.append(size)
    if len(sizes) > biggest:
        biggest = len(sizes)
        biggest_name = items[1]
    if len(sizes) < smallest:
        smallest = len(sizes)
        smallest_name = items[1]

print(biggest_name, biggest)
print(smallest_name, smallest)
