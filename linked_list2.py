class ListNode(object):
	def _init_(self,val=0):
		self.data = val
		self.next = None

def createLinkList(arr):
	if not arr:
		return None
	dummy = ListNode()
	root = dummy
	
	for ele in arr:
		root.next = ListNode(ele)
		root = root.next
		
	return dummy.next
	

def display(root):
	
	while root:
		print(root.data, "->")
		root = root.next
		
# arr = [1,2,3,4]		
# root = createLinkList(arr)
	
# display(root)

arr = [1, 2, 3, 5, 8]		
root = createLinkList(arr)
display(root)