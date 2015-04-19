-module(convertTemperature).
-export([loop/0]).

convert_to_celius(F) ->
	(float(F) - 32.0) * (5/9).

convert_to_fahrenheit(C) ->
	(float(C) * (9/5)) + 32.0.

loop() ->
	Display = spawn(fun displayTemperature:loop/0),
	receive
		{convert_fahrenheit, F} ->
			Display ! {temperature, {convert_to_celius(F), float(F)}},
			loop();
		{convert_celcius, C} ->
			Display ! {temperature, {float(C), convert_to_fahrenheit(C)}},
			loop();
		_ ->
			Display ! "Can't convert",
			loop()
	end.