#!/bin/bash
# Organize source files into different folders and compile each one of them
# The organized files are moved into the "Generated" folder

compile() {
    # Ada
    ada_srcs=`find .. -name \*.adb`
    if [ ! -z "$ada_srcs" ]; then
        mkdir Ada/ Ada/bin/ Ada/obj/
        for ada_src in ${ada_srcs}
        do
            mv ${ada_src} Ada/
        done
        # Assume there is only one main function in total
        # Compile ada sources
        gnatmake -D ./Ada/obj/ -o ./Ada/bin/Program `ls Ada/*.adb`
    fi

    # C-sharp
    cs_srcs=`find .. -name \*.cs`
    if [ ! -z "$cs_srcs" ]; then
        mkdir CS/ CS/bin/
        for cs_src in ${cs_srcs}
        do
            mv ${cs_src} CS/
        done
        # Assume there is only one main function in total
        # Compile c-sharp sources
        mcs `ls ./CS/*.cs` -out:CS/bin/Program
    fi

    # Haskell
    hs_srcs=`find .. -name \*.hs`
    if [ ! -z "$hs_srcs" ]; then
        mkdir Haskell/ Haskell/bin/
        for hs_src in ${hs_srcs}
        do
            mv ${hs_src} Haskell/
        done
        # Assume there is only one main function in total
        # Compile Haskell sources
        ghc -o ./Haskell/bin/Program `ls ./Haskell/*.hs`
    fi

    # Ocaml
    ml_srcs=`find .. -name \*.ml`
    if [ ! -z "$ml_srcs" ]; then
        mkdir Ocaml/ Ocaml/bin/
        for ml_src in ${ml_srcs}
        do
            mv ${ml_src} Ocaml/
        done
        # Assume there is only one main function in total
        # Compile Ocaml sources
        ocamlopt -o Ocaml/bin/Program `ls ./Ocaml/*.ml`
    fi

    # Swift
    sw_srcs=`find .. -name \*.swift`
    if [ ! -z "$sw_srcs" ]; then
        mkdir Swift/ Swift/bin/
        for sw_src in ${sw_srcs}
        do
            mv ${sw_src} Swift/
        done
        # Assume there is only one main function in total
        # Compile Swift sources
        swiftc -o Swift/bin/Program `ls ./Swift/*.swift`
    fi

    # Rust
    rs_srcs=`find .. -name \*.rs`
    if [ ! -z "$rs_srcs" ]; then
        mkdir Rust/ Rust/bin/
        for rs_src in ${rs_srcs}
        do
            mv ${rs_src} Rust/
        done
        # Assume there is only one main function in total
        # Compile Rust sources
        rustc -o Rust/bin/Program `ls ./Rust/*.rs`
    fi

    # Go
    go_srcs=`find .. -name \*.go`
    if [ ! -z "$go_srcs" ]; then
        mkdir Go/ Go/bin/
        for go_src in ${go_srcs}
        do
            mv ${go_src} Go/
        done
        # Assume there is only one package in total
        # Compile Go sources
        go build -o Go/bin/Program `ls ./Go/*.go`
    fi

    # Python
    py_srcs=`find .. -name \*.py`
    if [ ! -z "$py_srcs" ]; then
        mkdir Python/
        for py_src in ${py_srcs}
        do
            mv ${py_src} Python/
        done
    fi

    # Ruby
    rb_srcs=`find .. -name \*.rb`
    if [ ! -z "$rb_srcs" ]; then
        mkdir Ruby/
        for rb_src in ${rb_srcs}
        do
            mv ${rb_src} Ruby/
        done
    fi

    # TODO: add Java and C++
}

# Decompress each tarball to its coresponding folder
tarballs=`find . -maxdepth 1 -name \*.tar.gz`
if [ ! -z "$tarballs" ]; then
    for tarball in `ls *.tar.gz`
    do
        mkdir ${tarball%%.*}/
        mkdir ${tarball%%.*}/Generated/
        tar -xvzf ${tarball} ${tarball%%.*}/
        cd ${tarball%%.*}/Generated/
        compile
        # TODO: execute the programs and compare results
        cd -
    done
else
    echo "No tarball file found!"
fi
