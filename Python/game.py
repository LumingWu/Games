class Game:
    def __init__(self):
        self.N = 4
        self.T = 3
        self.K = 0
        self.L = {}
g = Game();
def num(N):
    g.N = N    
def cap(T):
    g.T = T    
def refill(K):
    g.K = K    
def fun(G, V):
    g.L[G] = V
def total_fun_recursion(game, token, fun, played):
    if played and game == g.N and g.L[game] < 0:
        return fun;
    if token == 0:
        if game < g.N:
            if played:
                if token + g.K > g.T:
                    return total_fun_recursion(game + 1, g.T, fun, False)
                return total_fun_recursion(game + 1, token + g.K, fun, False)
            return float("-inf")
        return fun         
    if played and game < g.N:
        if token + g.K > g.T:
            return max(total_fun_recursion(game, token - 1, fun + g.L[game], True),
                       total_fun_recursion(game + 1, g.T, fun, False))
        return max(total_fun_recursion(game, token - 1, fun + g.L[game], True),
                   total_fun_recursion(game + 1, token + g.K, fun, False))
    return total_fun_recursion(game, token - 1, fun + g.L[game], True)    
def total_fun():
    print(total_fun_recursion(1, g.T, 0, False))
