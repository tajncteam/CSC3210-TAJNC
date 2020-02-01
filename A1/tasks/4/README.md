## **ARM assembler in Raspberry Pi**
___


### Part One - First Program
_____
+ Created a program called [first.s](first.s).

+ Created a shell script to compile, link and execute the program : [compile_sh](compile.sh).

+ Output
![screenshot](resources/screenshots/screen1.png)

+ [first.s](first.s) program moves a number five for the register r1, subtract one, add 4, and store the result of the operation (which is eight) on register r1.
    No output is expected during the execution of this program. The reason why is because the program is manipulating with the CPU register only. There is no code implemented to produce any output to the screen. A different approach must be used to examine what operations the program is performing.  

+ Created a shell script to compile, link and execute the program in debug mode using GNU Debugger : [compile_g.sh](compile_g.sh).
    
+ Output
![screenshot](resources/screenshots/screen2.png)

+ Listing the source inside of GNU Debugger
![screenshot](resources/screenshots/screen3.png)

+ Adding a breaking on line 11 and running the program : ![screenshot](resources/screenshots/screen4.png)

+ Examinating CPU registers (expected result for R1 register is the decimal number 8) : ![screenshot](resources/screenshots/screen5.png)

+ Expected result confirmed. Exiting from GNU debugger.![screenshot](resources/screenshots/screen6.png)


### Part Two - Arithmetic Program
_____
+ Created a program called [arithmetic1.s](arithmetic1.s).

+ Running the program in debug mode using GNU Debugger :
![screenshot](resources/screenshots/screen7.png)

+ Examinating CPU registers (expected result for R0 register is the decimal number 7) :
![screenshot](resources/screenshots/screen8.png)

+ Expected result confirmed. Exiting from GNU debugger.![screenshot](resources/screenshots/screen6.png)

+ Since we used R0 register to store the result of the operation, we can also retrieve the value of R0 by inspecting the system code returned by the application: ![screenshot](resources/screenshots/screen9.png)




   