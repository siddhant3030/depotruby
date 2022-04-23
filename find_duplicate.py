from multiprocessing.reduction import duplicate
import numbers


class FindDuplicate:
    def find_duplicate(arr):
        arr = [3, 6, 4, 2, 3, 6, 8, 9]
        duplicate = None

        for i in range(len(arr)):
            for j in range(i+1, len(arr)):
                if arr[i] == arr[j]:
                    duplicate = arr[i]
                    break



    def find_duplicate_better_solution(arr):
        arr = [3, 6, 4, 2, 3, 6, 8, 9]
        for i in range(len(arr)):
            if arr[i] == duplicate:
                print(i)