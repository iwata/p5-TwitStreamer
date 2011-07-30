#!/bin/sh

cd $1
cpanm Module::Install
cpanm --installdeps -l extlib --notest .
