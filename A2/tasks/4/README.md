## **ARM assembler in Raspberry Pi**
___

### Part One - Second program
___

+ Created a program called [second.s](second.s).

+ Compile the source code
    ![screenshot](resources/screenshots/screenshot1.png)

+ Link the object file
    ![screenshot](resources/screenshots/screenshot2.png)

+ Execute the program
    ![screenshot](resources/screenshots/screenshot3.png)

     No output is expected during the execution of this program. The reason why is because the program is manipulating with the CPU register and memory address only. There is no code implemented to produce any output to the screen. A different approach must be used to examine what operations the program is performing.

+ Assemblying generating debugging information (-g flag)
    ![screenshot](resources/screenshots/screenshot4.png)


+ Link the object file
    ![screenshot](resources/screenshots/screenshot5.png)


+ Invoke GNU Debugger
    ![screenshot](resources/screenshots/screenshot6.png)

+ Adjust the list size and print the source code of the program
    ![screenshot](resources/screenshots/screenshot7.png)

+ Add a breaking on line 22 and execute the program
    ![screenshot](resources/screenshots/screenshot8.png)


+ Retrieve the memory address for a, b and c variables
    ![screenshot](resources/screenshots/screenshot9.png)

+ Examine the values of a, b and c before line 22 (store instruction)
    ![screenshot](resources/screenshots/screenshot10.png)

    + a = 0x2 (2d)
    + b = 0x5 (5d)
    + c = 0x0 (0d)

+ Step through one instruction and re-examine the value of c again
    ![screenshot](resources/screenshots/screenshot11.png)
    + As expected, the value of C was changed from zero to 0x7 (7d). The value is the result of the additional of A and B variables. 

+ Inspect also the values of R1 and R2 register 
    ![screenshot](resources/screenshots/screenshot12.png)
    
    + R1 = 0x7 (7d)
    + R2 = 0x200ac (memory address of C variable)

### Part Two - Second program
___

+ Created a program called [arithmetic2.s](arithmetic2.s).

+ Assemblying generating debugging information (-g flag) and linking the object file
    ![screenshot](resources/screenshots/screenshot13.png)


+ Invoke GNU Debugger, adjust the list size, print the source
    ![screenshot](resources/screenshots/screenshot14.png)


+ Add a breaking on line 29 and execute the program
    ![screenshot](resources/screenshots/screenshot15.png)

+ Examine the values of val1, val2 and val2
    ![screenshot](resources/screenshots/screenshot16.png)

    + val1 = 0x6 (6d)
    + val2 = 0xb (11d)
    + val3 = 0x10 (16d)


+ Inspect the value of R1 rgister to confirm the result of the computation
    ![screenshot](resources/screenshots/screenshot17.png)

    + r1 =>  11 + 9 + 16 - 6 = 30d (0x1e)






