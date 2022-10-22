paru -S juliaup --noconfirm --needed
juliaup add release
julia -e 'using Pkg; Pkg.add("LanguageServer")'
