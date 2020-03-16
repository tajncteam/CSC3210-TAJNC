## **ARM assembler in Raspberry Pi**
___

### Part One - Fourth program
___

+ Created a program called [fourth.s](fourth.s).

+ Compiling the source code:
    ![screenshot](resources/screen1.png)

+ Invoking GNU Debugger:
    ![screenshot](resources/screen2.png)

+ Adding a breaking on line 7 and executing the program:
    ![screenshot](resources/screen3.png)

+ Examining CPSR and memory information before execution:
    ![screenshot](resources/screen4.png) 


+ Examining CPSR information after execution of CMP instruction:
    ![screenshot](resources/screen5.png)

    ```
     cpsr : 0x60000010
             |_________ 0 1 1 0
                        | | | |
                        | | | |_____ overflow bit
                        | | |_______ carry bit
                        | |_________ zero bit
                        |___________ negative bit
	```

+ Examining Y value after execution of JUMP instruction:
    ![screenshot](resources/screen6.png)

    + Y = 1d


### Part Two - Fourth_better program
___

+ Created a program called [fourth_better.s](fourth_better.s).

+ Compiling the source code:
    ![screenshot](resources/screen7.png)

+ Invoking GNU Debugger:
    ![screenshot](resources/screen8.png)

+ Adding a breaking on line 19 and executing the program:
    ![screenshot](resources/screen9.png)

+ Examining CPSR and memory information before execution:
    ![screenshot](resources/screen10.png) 

+ Examining CPSR information after execution of CMP instruction:
    ![screenshot](resources/screen11.png)

    ```
     cpsr : 0x60000010
             |_________ 0 1 1 0
                        | | | |
                        | | | |_____ overflow bit
                        | | |_______ carry bit
                        | |_________ zero bit
                        |___________ negative bit
	```    

+ Examining Y value after execution of JUMP instruction:
    ![screenshot](resources/screen12.png)

    + Y = 1d    


### Part Three - ControlStructure1 program
___

+ Created a program called [ControlStructure1.s](ControlStructure1.s).

+ Compiling the source code:
    ![screenshot](resources/screen13.png)

+ Invoking GNU Debugger:
    ![screenshot](resources/screen14.png)

+ Adding a breaking on line 17 and executing the program:
    ![screenshot](resources/screen15.png)

+ Examining CPSR and memory information before execution:
    ![screenshot](resources/screen16.png) 

+ Examining CPSR information after execution of CMP instruction:
    ![screenshot](resources/screen17.png)

    ```
     cpsr : 0x80000010
             |_________ 1 0 0 0
                        | | | |
                        | | | |_____ overflow bit
                        | | |_______ carry bit
                        | |_________ zero bit
                        |___________ negative bit
	```    
+ Examining Y value after execution of JUMP instruction:
    ![screenshot](resources/screen18.png)

    + Y = 0h    


