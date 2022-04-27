class Solution:
    def twoSum(self, nums, target: int):
        for i in range(len(nums)):
            for j in range(i + 1, len(nums)):
                if nums[j] == target - nums[i]:
                    return [i, j]

    def twoSumhash(self, nums, target: int):
        hashmap = {}
        for i in range(len(nums)):
            hashmap[nums[i]] = i
        for i in range(len(nums)):
            complement = target - nums[i]
            if complement in hashmap and hashmap[complement] != i:
                return [i, hashmap[complement]] 

    def twoSumhashe(self, nums, target: int):
        hashmap = {}
        for i in range(len(nums)):
            complement = target - nums[i]
            print(complement)
            if complement in hashmap:
                return [i, hashmap[complement]]
            hashmap[nums[i]] = i
            

obj = Solution()
nums = [5, 7, 3, 4, 6, 7, 9]
target = 12

a = obj.twoSumhashe(nums, target)
print(a)