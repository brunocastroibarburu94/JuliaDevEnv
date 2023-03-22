run:
	julia --project=./project ./src/main.jl 

julia:
	julia --project=./project

createPackage:
	julia --project=./project ./src/new_package.jl

test:
	julia --project=./project ./src/main.jl

sync:
	julia --project=./project -e 'using Pkg; Pkg.instantiate()'

pluto:
	julia --project=./project ./src/launch_pluto.jl

setgit:
	git config --global user.email ${GITHUB_EMAIL}
	git config --global user.name ${GITHUB_NAME}