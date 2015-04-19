-module(convertTemperature).
-export([loop/0]).

convert_to_celius(F) ->
	(float(F) + 32.0) * (5/9).

convert_to_fahrenheit(C) ->
	(float(C) * (9/5)) + 32.0.

loop() ->
	Pid = spawn(fun displayTemperature:loop/0),
	receive
		{convert_fahrenheit, F} ->
			Pid ! {temperature, {convert_to_celius(F), float(F)}},
			loop();
		{convertT_celcius, C} ->
			Pid ! {temperature, {float(C), convert_to_fahrenheit(C)}},
			loop();
		_ ->
			Pid ! "Can't convert",
			loop()
	end.