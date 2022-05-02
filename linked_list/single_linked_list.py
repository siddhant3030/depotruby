from operator import truediv


class Node:
    def __init__(self, data):
        self.data = data
        self.next_element = None


class Solution: 
    def __init__(self):
        self.head_node = None
    
    def get_head(self):
        return self.head_node

    
    def is_empty(self):
        if(self.head_node is None):  # Check whether the head is None
            return True
        else:
            return False

    def insert_at_tail(lst, value):
    # Creating a new node
        new_node = Node(value)

    # Check if the list is empty, if it is simply point head to new node
        if lst.get_head() is None:
            lst.head_node = new_node
            return

    # if list not empty, traverse the list to the last node
        temp = lst.get_head()

        while temp.next_element:
            temp = temp.next_element

    # Set the nextElement of the previous node to new node
        temp.next_element = new_node
        return

    def search_value(self, value):
        current_node = self.head

        while current_node:
            if current_node == value:
                return True
            current_node = current_node.next_element
        return False # if value not found

    def insert_at_head(self, dt):
        temp_node = Node(dt)
        temp_node.next_element = self.head_node
        self.head_node = temp_node
        return self.head_node

    def delete_at_head(lst):
    # Get Head and firstElement of List
        first_element = lst.get_head()

    # if List is not empty then link head to the
    # nextElement of firstElement.
        if first_element is not None:
            lst.head_node = first_element.next_element
            first_element.next_element = None
        return
    
    def delete_by_value(self, value):
        if lst.is_empty():  # Check if list is empty -> Return False
            print("List is Empty")
            return deleted
        current_node = lst.get_head()  # Get current node
        previous_node = None  # Get previous node

        if current_node.data is value:
            lst.delete_at_head()  # Use the previous function
            deleted = True
            return deleted

        while current_node is not None:
        # Node to delete is found
            if value is current_node.data:
            # previous node now points to next node
             previous_node.next_element = current_node.next_element
             current_node.next_element = None
             deleted = True
             break
            previous_node = current_node
            current_node = current_node.next_element
        
        if deleted is False:
            print(str(value) + " is not in list!")
        else:
            print(str(value) + " deleted!")

        return deleted


    def print_list(self):
        if(self.is_empty()):
            print("List is Empty")
            return False
        temp = self.head_node
        while temp.next_element is not None:
            print(temp.data, end=" -> ")
            temp = temp.next_element
        print(temp.data, "-> None")
        return True

    def reverse(lst):
        # To reverse linked, we need to keep track of three things
        previous = None # Maintain track of the previous node
        current = lst.get_head() # The current node
        next = None # The next node in the list

        #Reversal
        while current:
            next = current.next_element
            current.next_element = previous
            previous = current
            current = next

        #Set the last element as the new head node
        lst.head_node = previous
        return lst

    
# Python3 program to detect loop
# in the linked list
 
# Node class
 
 
class Node:
 
    # Constructor to initialize
    # the node object
    def __init__(self, data):
        self.data = data
        self.next = None
 
 
class LinkedList:
 
    # Function to initialize head
    def __init__(self):
        self.head = None
 
    # Function to insert a new
    # node at the beginning
    def push(self, new_data):
        new_node = Node(new_data)
        new_node.next = self.head
        self.head = new_node
 
    # Utility function to print it
    # the linked LinkedList
    def printList(self):
        temp = self.head
        while(temp):
            print(temp.data, end=" ")
            temp = temp.next
 
    def detectLoop(self):
        s = set()
        temp = self.head
        while (temp):
 
            # If we have already has
            # this node in hashmap it
            # means their is a cycle
            # (Because you we encountering
            # the node second time).
            if (temp in s):
                return True
 
            # If we are seeing the node for
            # the first time, insert it in hash
            s.add(temp)
 
            temp = temp.next
 
        return False

    def printMiddle(self):
        # Initialize two pointers, one will go one step a time (slow), another two at a time (fast)
        slow = self.head
        fast = self.head
 
        # Iterate till fast's next is null (fast reaches end)
        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next
         
        # return the slow's data, which would be the middle element.
        print("The middle element is ", slow.data)

    def duplicate_value(self):
        s = set()
        temp = self.head

        while(temp):
            if (temp in s):
                return True

            s.add(temp)

            temp = temp.next

        return False

            


lst = Solution()
for i in range(11):
    lst.insert_at_head(i)

lst.print_list()

a = lst.delete_at_head(lst)

print(a)

lst.print_list()






# class LinkedList:
#     def __init__(self):
#         self.head_node = None

#     def get_head(self):
#         return self.head_node

#     def is_empty(self):
#         if(self.head_node is None):  # Check whether the head is None
#             return True
#         else:
#             return False

#     # Supplementary print function
#     def print_list(self):
#         if(self.is_empty()):
#             print("List is Empty")
#             return False
#         temp = self.head_node
#         while temp.next_element is not None:
#             print(temp.data, end=" -> ")
#             temp = temp.next_element
#         print(temp.data, "-> None")
#         return True


