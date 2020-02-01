#!/bin/bash

    if [ "$1" != "" ] 
      then
          as -o "$1".o "$1".s

          if [ $? -eq 0 ]
            then 
                ld -o "$1" "$1".o

                if [ $? -eq 0 ]
                  then 
                      ./"$1"
                else
                    echo "Error during link process. Please check your code and try it again"
                fi
          else
              echo "Error during compile. Please check your code and try it again"
          fi
    else
        echo "Use $0 <assembler program>. Do not include the file extension."
    fi


    
