#!/bin/sh

usage="Usage: $0 [-h] [-c] [-s cert_name] [-p path] -- Menage compiled tests for ios \n
    -h  show usage \n
    -c  show available certificates list \n
    -s  sign all tests \n
    -p  copy over ssh(-P 2222 root@localhost) all tests to a given path on the phone"

if [[ -z $1 ]]; then
    echo $usage
    exit
fi

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -h|--help)
    echo $usage
    exit
    ;;
    -c|--certificates)
    security find-identity -v -p codesigning
    exit
    ;;
    -s|--sign)
    CERT_NAME="$2"
    shift # past argument
    shift # past value
    ;;
    -p|--path)
    TESTS_PATH="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    echo $usage
    exit
    ;;
esac
done

if [[ ! -z $CERT_NAME ]]; then
  find pan testcases/kernel/syscalls -perm +111 -type f \
  -not -name "*.sh" -not -name "*.cgi" -not -name "*.cstemp" -exec codesign -s "$CERT_NAME" {} \;
fi

if [[ ! -z $TESTS_PATH ]]; then
  iproxy 2222 22 1> /dev/null 2> /dev/null  & IPROXY_PID=$!
  find pan testcases/kernel/syscalls -perm +111 -type f \
  -not -name "*.sh" -not -name "*.cgi" -not -name "*.cstemp" -exec sshpass -p rteam scp -P 2222 {} root@localhost:"$TESTS_PATH" \;
  kill $IPROXY_PID
fi
