#! /bin/bash

ARCH=x86_64
OS=LINUX
COMPILER=mpif90
# COMPILER=intel
MACHINE=local

DEBUG_3DVAR=
# DEBUG_3DVAR=.dbg

. compilers/machine_modules/${MACHINE}.${COMPILER}

echo compiling 3dvar
cd 3DVar
cp ../compilers/machine_modules/${MACHINE}.${COMPILER} machine_module.sh
INC_FILE=${ARCH}.${OS}.${COMPILER}${DEBUG_3DVAR}.inc
cp ../compilers/$INC_FILE compiler.inc
if [ -f "$1" ] 
then
    echo "cp $1 3DVar/da_params.f90"
    cp $1 da_params.f90
elif [ -f ../static_files/da_params.f90 ]
then
    echo "cp ../static_files/da_params.f90 3DVar"
    cp ../static_files/da_params.f90 .
else
    echo "cp ../src/da_params.f90 3DVar"
    cp ../src/da_params.f90 .
fi
make clean
make
if [ $? -ne 0 ] ; then  echo  ERROR; exit 1 ; fi

echo preparing DAVars.txt
cd ..
make
if [ $? -ne 0 ] ; then  echo  ERROR; exit 1 ; fi
