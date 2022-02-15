#!/bin/sh
(
  cd `dirname $0`
  cp ./FMOD/Build/GUIDs.txt ../files/audio/
  cp ./FMOD/Build/Desktop/mod_voices.bank ../files/audio/
)
