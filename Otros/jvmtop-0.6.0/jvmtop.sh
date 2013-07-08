#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$JAVA_HOME/bin/java $JAVA_OPTS -cp $DIR/jvmtop.jar:$JAVA_HOME/lib/tools.jar com.jvmtop.JvmTop $1

