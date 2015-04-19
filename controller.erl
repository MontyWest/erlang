-module(controller).
-export([start/0]).

start() ->
	Convert = spawn(fun convertTemperature:loop/0),
	Convert ! {convert_fahrenheit, 32.0},
	Convert ! {convert_celcius, 12.0},
	Convert ! {convert_fahrenheit, 100.0},
	Convert ! {convert_celcius, 30.0},
	Convert ! {convert_fahrenheit, -50.0},
	"Conversions complete.".
