#!/bin/bash

# Organize source files into different folders and compile each one of them
# The organized files are moved into the "Generated" folder

# Test case file location
# Specifying value of k and n respectively (splitted by a space)
testcasesfile=../../testcases

compile() {
    # Ada
    ada_srcs=`find .. -name \*.adb`
    if [ ! -z "$ada_srcs" ]; then
        # make new directories for each type of file
        mkdir Ada/ Ada/bin/ Ada/obj/
        for ada_src in ${ada_srcs}
        do
            mv ${ada_src} Ada/
        done

        # Assume there is only one main function in total
        # Compile ada sources
        gnatmake -D ./Ada/obj/ -o ./Ada/bin/Program `ls Ada/*.adb`

        # create a new file for results
        touch ../RESULT_ADA.txt

        # a counter keep track of number of test cases passed
        passed=0

        while read LINE
        do
            # save results for each test cases
            ./Ada/bin/Program $LINE > "res_${LINE// /-}"
            # compare it with answer key
            if [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}`=="" ]] || [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}_rev`=="" ]] ; then
                # passed the test case
                passed=$((passed+1))
                # append result to result file
                echo "Case: ${LINE// /-} passed" >> ../RESULT_ADA.txt
            fi
        done < "$testcasesfile"
        echo "Total number of passed cases: $passed" >> ../RESULT_ADA.txt
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

        # create a new file for results
        touch ../RESULT_CS.txt
        # a counter keep track of number of test cases passed
        passed=0
        # compare answers and results
        while read LINE
        do
            # save results for each test cases
            ./CS/bin/Program $LINE > "res_${LINE// /-}"
            # compare it with answer key
            if [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}`=="" ]] || [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}_rev`=="" ]] ; then
                # passed the test case
                passed=$((passed+1))
                # append result to result file
                echo "Case: ${LINE// /-} passed" >> ../RESULT_CS.txt
            fi
        done < "$testcasesfile"
        echo "Total number of passed cases: $passed" >> ../RESULT_CS.txt
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

        # create a new file for results
        touch ../RESULT_HS.txt
        # a counter keep track of number of test cases passed
        passed=0
        # compare answers and results
        while read LINE
        do
            # save results for each test cases
            ./Haskell/bin/Program $LINE > "res_${LINE// /-}"
            # compare it with answer key
            if [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}`=="" ]] || [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}_rev`=="" ]] ; then
                # passed the test case
                passed=$((passed+1))
                # append result to result file
                echo "Case: ${LINE// /-} passed" >> ../RESULT_HS.txt
            fi
        done < "$testcasesfile"
        echo "Total number of passed cases: $passed" >> ../RESULT_HS.txt
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

        # create a new file for results
        touch ../RESULT_ML.txt
        # a counter keep track of number of test cases passed
        passed=0
        # compare answers and results
        while read LINE
        do
            # save results for each test cases
            ./Ocaml/bin/Program $LINE > "res_${LINE// /-}"
            # compare it with answer key
            if [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}`=="" ]] || [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}_rev`=="" ]] ; then
                # passed the test case
                passed=$((passed+1))
                # append result to result file
                echo "Case: ${LINE// /-} passed" >> ../RESULT_ML.txt
            fi
        done < "$testcasesfile"
        echo "Total number of passed cases: $passed" >> ../RESULT_ML.txt
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

        # create a new file for results
        touch ../RESULT_SW.txt
        # a counter keep track of number of test cases passed
        passed=0
        # compare answers and results
        while read LINE
        do
            # save results for each test cases
            ./Swift/bin/Program $LINE > "res_${LINE// /-}"
            # compare it with answer key
            if [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}`=="" ]] || [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}_rev`=="" ]] ; then
                # passed the test case
                passed=$((passed+1))
                # append result to result file
                echo "Case: ${LINE// /-} passed" >> ../RESULT_SW.txt
            fi
        done < "$testcasesfile"
        echo "Total number of passed cases: $passed" >> ../RESULT_SW.txt
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

        # create a new file for results
        touch ../RESULT_RS.txt
        # a counter keep track of number of test cases passed
        passed=0
        # compare answers and results
        while read LINE
        do
            # save results for each test cases
            ./Rust/bin/Program $LINE > "res_${LINE// /-}"
            # compare it with answer key
            if [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}`=="" ]] || [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}_rev`=="" ]] ; then
                # passed the test case
                passed=$((passed+1))
                # append result to result file
                echo "Case: ${LINE// /-} passed" >> ../RESULT_RS.txt
            fi
        done < "$testcasesfile"
        echo "Total number of passed cases: $passed" >> ../RESULT_RS.txt
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
        # create a new file for results
        touch ../RESULT_GO.txt
        # a counter keep track of number of test cases passed
        passed=0
        # compare answers and results
        while read LINE
        do
            # save results for each test cases
            ./Go/bin/Program $LINE > "res_${LINE// /-}"
            # compare it with answer key
            if [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}`=="" ]] || [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}_rev`=="" ]] ; then
                # passed the test case
                passed=$((passed+1))
                # append result to result file
                echo "Case: ${LINE// /-} passed" >> ../RESULT_GO.txt
            fi
        done < "$testcasesfile"
        echo "Total number of passed cases: $passed" >> ../RESULT_GO.txt
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

    # C++
    cpp_srcs=`find .. -name \*.cpp`
    if [ ! -z "$cpp_srcs"]; then
        mkdir Cpp/ Cpp/bin
        for cpp in ${cpp_srcs}
        do
            mv ${cpp} Cpp/
        done
        # assume using c++11
        g++ -g -std=c++11 `ls ./Cpp/*.cpp` -o ./Cpp/bin/Program

        # create a new file for results
        touch ../RESULT_CPP.txt
        # a counter keep track of number of test cases passed
        passed=0
        # compare answers and results
        while read LINE
        do
            # save results for each test cases
            ./Cpp/bin/Program $LINE > "res_${LINE// /-}"
            # compare it with answer key
            if [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}`=="" ]] || [[ `diff -B res_${LINE// /-} ../../ANSWER_KEY/ans_${LINE// /-}_rev`=="" ]] ; then
                # passed the test case
                passed=$((passed+1))
                # append result to result file
                echo "Case: ${LINE// /-} passed" >> ../RESULT_CPP.txt
            fi
        done < "$testcasesfile"
        echo "Total number of passed cases: $passed" >> ../RESULT_CPP.txt

    fi

    # TODO: add Java

}

# compile the answer key program
gcc -o csc254_a1 ./csc254_a1.c

# execute the c program for generating answer key
mkdir ANSWER_KEY/
while read LINE
do
    ./csc254_a1 $LINE > "./ANSWER_KEY/ans_${LINE// /-}"
    # reverse the order
    tac "./ANSWER_KEY/ans_${LINE// /-}" > "./ANSWER_KEY/ans_${LINE// /-}_rev"
done < ./testcases

# Decompress each tarball to its coresponding folder
tarballs=`find . -maxdepth 1 -name \*.tar.gz`
if [ ! -z "$tarballs" ]; then
    for tarball in `ls *.tar.gz`
    do
        echo $tarball
        mkdir ${tarball%%.*}/
        mkdir ${tarball%%.*}/Generated/
        tar -xf ${tarball} ${tarball%%.*}/
        cd ${tarball%%.*}/Generated/
        compile
        cd -
    done
else
    echo "No tarball file found!"
fi
