
class Node(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    def minDepth(self, root):
        if not root:
            return 0
        queue = [root]
        level = 1
        
        while queue:
            for i in range(len(queue)):
                cur = queue.pop(0)
                if not cur:
                    continue
                if cur.left is None and cur.right is None:
                    return level
                if cur.left:
                    queue.append(cur.left)
                if cur.right:
                    queue.append(cur.right)
            level += 1
        
        return level

root = Node(10)

root.left = Node(34)
root.right = Node(89)
root.left.left = Node(45)
root.left.right = Node(50)

obj = Solution()

a = obj.minDepth(root)
print(a)

