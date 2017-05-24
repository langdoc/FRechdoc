#!/bin/bash

for wav in `ls MONO*WAV | egrep 'MONO\-\d\d\d\.WAV+'`
do
  output=$(echo $wav | sed 's/.WAV/-song1.WAV/g')
  sox $wav song1/$output trim 0 284
done

for wav in `ls song1/MONO*song1*WAV`
do
  output=$(echo $wav | sed 's/.WAV/.eaf/g')
  aeneas_execute_task \
     $wav \
     song1.txt \
     "task_language=ukr|os_task_file_format=eaf|is_text_type=plain" \
     $output
done
