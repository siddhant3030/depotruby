class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        def dfs(root, depth):
            if not root: return depth
            return max(dfs(root.left, depth + 1), dfs(root.right, depth + 1))
                       
        return dfs(root, 0)


    def maxDepth(self, root: TreeNode) -> int:
    
        if not root: return 0
    
        queue = [(root, 1)]
        self.res = 0
    
        while queue:
            root, nums = queue.pop(0)
        
            if not root.left and not root.right:
                self.res = max(self.res, nums)
            
            if root.left:
                queue.append((root.left, nums + 1))
            
            if root.right:
                queue.append((root.right, nums + 1))
            
        return self.res