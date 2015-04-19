-module(displayTemperature).
-export([loop/0]).

loop() ->
	receive
		{temperature, {C, F}} ->
			io:fwrite("Celcius: ~.2f, Fahrenheit: ~.2f ~n", [C, F]),
			loop();
		_ ->
			io:fwrite("Can't display~n"),
			loop()
	end.

