#!/usr/bin/env bash
#First parameter: git username
#Second parameter: -t -> do not use tags

trap exit ERR

if [ "$2" != "-t" ] ; then
	echo "USE TAGS"
	TAG_LIBTIME=v1.0.2
	TAG_TIME2=v2.0.0
fi

echo "--------------"
git clone https://$1@github.com/ASTRO-EDU/libtimeanalysis.git
cd libtimeanalysis
if [ "$2" != "-t" ]; then
	git checkout $TAG_LIBTIME
else
	echo "Use master version"
fi
cd ..

echo "--------------"
git clone https://$1@github.com/ASTRO-EDU/agiletimeanalysis2.git
cd agiletimeanalysis2
if [ "$2" != "-t" ]; then
        git checkout $TAG_TIME2
else
        echo "Use master version"
fi
cd ..

