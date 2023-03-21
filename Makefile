run:
	julia --project=./project ./src/main.jl 

julia:
	julia --project=./project

test:
	julia --project=./project ./src/main.jl

sync:
	julia --project=./project -e 'using Pkg; Pkg.instantiate()'

pluto:
	julia --project=./project ./src/launch_pluto.jl