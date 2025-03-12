#! /bin/bash

VAR3D_BRANCH=Multivariate
HOME_3dvar=$PWD

cd $HOME_3dvar
git clone -b fix-local git@github.com:exactlab/3dVarBio.git 3DVar
cd 3DVar
git checkout -b $VAR3D_BRANCH origin/$VAR3D_BRANCH
