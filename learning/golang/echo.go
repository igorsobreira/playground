package main

import (
    "flag"
    "os"
)

var omitNewline = flag.Bool("n", false, "omit final newline")

func main() {
    flag.Parse()
    
    s := ""

    for i:=0; i<flag.NArg(); i++ {
        if i != 0 {
            s += " "
        }
        s += flag.Arg(i)
    }

    if !*omitNewline {
        s += "\n"
    }
    
    os.Stdout.WriteString(s)

}
