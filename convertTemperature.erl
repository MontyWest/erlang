-module(convertTemperature).
-export().
-import(displayTemperature,[loop/0]).

Display = spawn(fun displayTemperature:loop/0).

ConvertToCelcius = 
	fun(F) ->
		(float(F) + 32.0) * (5/9).
	end.

ConvertToFahrenheit = 
	fun(C) ->
		(float(C) * (9/5)) + 32.0.
	end.

loop() ->
	receive
		{convertToCelius, F} ->
			Display ! 
				{temperature, {ConvertToCelcius(F), float(F)}};
		{convertToFahrenheit, C} ->
			Display !
				(temperature, {float(C), ConvertToFahrenheit(C)});
		_ ->
			Display ! "Can't convert";
	end.