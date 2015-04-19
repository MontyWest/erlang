-module(displayTemperature).
-export([loop/0]).

loop() ->
	receive
		{temperature,{C, F}} ->
			io:fwrite("Celcius: ~g, Fahrenheit: ~g ~n"),
			loop();
		_ ->
			io:fwrite("Can't display~n"),
			loop()
	end.

