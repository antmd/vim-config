
#!/bin/bash
#{{{
ScriptName=`basename $0`
TmpFile=`mktemp /tmp/${ScriptName}.XXXXXX` || exit 1
TmpFile="${TmpFile}.swift"
cat > $TmpFile <<EOF
#!/usr/bin/swift -sdk $(xcrun --show-sdk-path --sdk macosx) -assert-config Debug -o - -i 
EOF

cat >> $TmpFile <<'EOF'
// --------------------------------------------------------------------------------\
// SWIFT BEGIN                                                                      |>
// --------------------------------------------------------------------------------/
//}}}

// 
// <+FILE NAME+>
// 
// Created by <+AUTHOR+> on <+DATE+>
// Copyright (c) <+call:strftime("%Y")+> <+COMPANY+>. All rights reserved.
// 

println("Starting <+FILE NAME ROOT+>")

import Foundation

for argument in Process.arguments {
    switch argument {
    case "-h":
        println("HELP!");
    default:
        println("argument = \(argument)");
    }
}

<+CURSOR+>

//{{{
// --------------------------------------------------------------------------------\
// SWIFT END                                                                        |>
// --------------------------------------------------------------------------------/
EOF

chmod ug+x $TmpFile
$TmpFile "$@"
rm $TmpFile
# vim: filetype=swift:foldmethod=marker:foldlevel=0
#}}}
