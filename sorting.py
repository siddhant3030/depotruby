class Sorting:
    def bubble_sort(list):
        for i in range(len(list) - 1, 0, -1):
            for j in range(i):
                if list[j] > list[j+1]:
                    temp = list[j]
                    list[j] = list[j+1]
                    list[j+1] = temp

    def selection_sort(list):
        for i in range(len(list) - 1):
            min_index = i
            for j in range(i+1, len(list)):
                if list(j) < list(min_index):
                    min_index = j
            if i != min_index:
                temp = list[i]
                list[i] = list[i+1]
                list[i+1] = temp

    def insertion_sort(list):
        for i in range(1, len(list)):
            temp = list[i]
            j = i - 1
            while temp < list[j] and j > -1:
                list[j+1] = list[j]
                list[j] = temp
                j -= 1
        return list