#!/bin/bash

LINKPKG=""

for i in "$@"
do
case $i in
    --linkpkg=*)
    LINKPKG="${i#*=}"
    shift # past argument=value
    ;;
    *)
          # unknown option
    ;;
esac
done
echo "LINKPKG    = ${LINKPKG}"
[ -e ForeignCode.mli ] && rm ForeignCode.mli
[ -e ForeignCode.mlf ] && rm ForeignCode.mlf
[ -e UniK.mli ] && rm UniK.mli
[ -e UniK.mlf ] && rm UniK.mlf
agda-ocaml --mlf --cmx --linkpkg=${LINKPKG} UniK.agda
mv ForeignCode.cm* _build
mv ForeignCode.o _build
rm ForeignCode.ml
mv UniK.cm* _build
mv UniK.o _build



