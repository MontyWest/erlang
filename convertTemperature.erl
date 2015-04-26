-module(convertTemperature).
-export([loop/0]).

% Converts fahrenheit to celcius
convert_to_celius(F) ->
	(float(F) - 32.0) * (5/9).

% Converts celcius to fahrenheit
convert_to_fahrenheit(C) ->
	(float(C) * (9/5)) + 32.0.

loop() ->
	% Spawn the display actor
	Display = spawn(fun displayTemperature:loop/0),
	receive
		% On receiving a convert_fanrenheit message, converts passed temp to celicus
		% and message it to display
		{convert_fahrenheit, F} ->
			Display ! {temperature, {convert_to_celius(F), float(F)}},
			loop();
		% On receiving a convert_celcius message, converts passed temp to fahrenheit
		% and message it to display
		{convert_celcius, C} ->
			Display ! {temperature, {float(C), convert_to_fahrenheit(C)}},
			loop();
		_ ->
			Display ! "Can't convert",
			loop()
	end.