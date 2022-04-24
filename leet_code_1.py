class Graph:
    def __init__(self, Nodes):
        self.nodes = Nodes
        self.adj_list = {}

        for node in self.nodes:
            self.adj_list[node] = []
        
    def print_adj_list(self): 
        for node in self.nodes:
            print(node, "->", self.adj_list[node])

    def add_edge(self, v1, v2):
        if v1 in self.adj_list.keys() and v2 in self.adj_list.keys():
            self.adj_list[v1].append(v2)
            self.adj_list[v2].append(v1)
            return True

    def degree_of_edges(self, node):
        deg = len(self.adj_list[node])
        return deg