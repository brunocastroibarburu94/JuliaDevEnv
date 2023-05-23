# Julia Development Environment
Empty template for a new project using Julia, this version is using Julia 1.8.5-bullseye, ammend Dockerfile to change to the version of Julia you want to use.

### Creating an SSH key
```bash
ssh-keygen -t ed25519 -C "your@email.com"
chmod 400 ~/.ssh/id_ed25519 # Set read only permissions for  your key (surface it in /root/.ssh) it saves time as is the default configuration.
git remote set-url origin git@github.com:brunocastroibarburu94/JuliaDevEnv.git
https://github.com/

```

### Package Management ###
When developing using Docker, all the packages from the Manifest.toml will be installed during the build process.

To add/remove/update additional packages when developing, run a docker container and using the bash command line type
```bash
make julia
```
This will open a julia console using the project under "./project/". Press "]" to open the Pkg REPL and then proceed to add/remove/update packages.
```bash
add JuMP
```

### Executing files
If you want to run the julia script from a command line then just do
```bash
/path/to/julia script-name.jl
```
In the shell of your choice.

If you want to run it from the julia repl then you want something like so:
```bash
julia> include("path/to/script-name.jl")
```

### Debbugging
When using VScode as your editor, there are plugins to easily put breakpoints in your code.<br>

When running Julia from a command line do the following.
1. Edit the code in the file you want to inspect
```julia
# Some Code 
using Infiltrator
# Some more Code
@infiltrate true 
```
1. Open a Julia REPL console
```bash
make julia
```
1. Run the file from your REPL console
```julia
include("./src/main.jl")
```

Unlike Python, at the moment there is no way of executing a Julia script heat a breakpoint and open a console, the two options above are the only ways (I know of) to enter a debugging environment.

### Creating a new package using PkgTemplates
Creation of the package.
```julia
using PkgTemplates
t = Template(;
           user="youremail",
           authors=["Your-Name"],
           plugins=[
               License(name="MIT"),
               Git(),
               GitHubActions(),
           ],
           dir="/root"
       )
# This creates the package under the folder /root/ProjectName (modify the dir input and project name as appropriate)
t("ProjectName")
```
> For this to work you need to 1. create the .env file and fill the environment variables from .env.template. 2 You need to have the gitconfig file configured. 3. You may need to have SSH key to GitHub and mount the files into the container (the file local_container.sh has the docker run already configured for this so modify as appropriate).

### Trigger Unit Tests of the new package
```bash
julia
```

```julia
# Press ] to enter into REPL mode and type the following:
activate ../ProjectName
test
```
### Using the new package

```julia
# Press ] to enter into REPL mode and type the following:
activate ../ProjectName
# Press ctrl+c ] to exit REPL mode and type the following:
using ProjectName # This now should work
ProjectName.yourModuleFunction() # This should be replaced with a function of your module
```