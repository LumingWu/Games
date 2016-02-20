fun N(L) = List.nth(L, 0);
fun T(L) = List.nth(L, 1);
fun K(L) = List.nth(L, 2);
fun second(_, y) = y;
fun F(L, G) = second(List.nth(L, G - 1));
fun max(x, y) = if x > y then x
	else y;
	
fun fun_recursion(game, token, score, played, setting, funs) =
	if played andalso game = N(setting) andalso F(funs, game) < 0 then score
	else if token = 0 then
		if game < N(setting) then
			if played then
				if token + K(setting) > T(setting) then fun_recursion(game + 1, T(setting), score, false, setting, funs)
				else fun_recursion(game + 1, token + K(setting), score, false, setting, funs)
			else -1000 (* Look at the caps in the document *)
		else score
	else if played andalso game < N(setting) then
		if token + K(setting) > T(setting) then max(fun_recursion(game, token - 1, score + F(funs, game), true, setting, funs), fun_recursion(game + 1, T(setting), score, false, setting, funs))
		else max(fun_recursion(game, token - 1, score + F(funs, game), true, setting, funs), fun_recursion(game + 1, token + K(setting), score, false, setting, funs))
	else fun_recursion(game, token - 1, score + F(funs, game), true, setting, funs);

fun total_fun(N, T, K, L) =
	fun_recursion(1, T, 0, false, [N, T, K], L); 
