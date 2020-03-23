## **Parallel Programming Skills**
### Parallel Programming Patterns
____

### **Part1**
___

+ **What is race condition?**

    + It's a behavior that can happen on electronics, software, or another system in which the output depends on the sequence of events. When race conditions arise in software, in case the events do not occur as the developer wanted, a fault happens.

+ **Why race condition is difficult to reproduce and debug?**
    + Because the software bug can disappears or alters its behavior when an attempt to debug the error is made. When trying to recreate the bug or using a debugger, the error may change or even disappear.

+ **How can it be fixed? Provide an example from your Project_A3 (see spmd2.c)**
    + You can use synchronization to protect data conflicts but synchronization is an expensive operation. As an alternative, as a developer, you can change how data is accessed to minimize the need for synchronization. As an example, let's use the issue that happened during the project A2 for the program: spmd2.c. He had a scenario where multiple threads were updating one shared variable (id) which is an example of race condition. To fix this issue, we changed the code to make the variable id private for each thread.

+ **Summaries the Parallel Programming Patterns section in the “Introduction to Parallel Computing_3.pdf” (two pages) in your own words (one paragraph, no more than 150
words).**
    + Parallel Programming Patterns provides a "cookbook" as a guide for developers to achieve parallel computing. There are two main categories for parallel programming patterns: Strategies and Concurrent Execution Mechanisms. Strategies define which algorithm to be used and which implementation strategy will be used during the development cycle. Concurrent Execution Mechanisms are divided into two main categories: Process/Thread control and Coordination. Process & thread control manage how the processing units running on CPU are controlled at run time. Coordination defines the number of parallel tasks desired to complete the parallel computation task. For coordination patterns, we also have two main sub-categories: message passing and mutual exclusion. In the message-passing model,  parallel processes exchange data through passing messages to one another. The mutual exclusion model prevents simultaneous access to a shared resource. Hybrid computation is becoming a popular parallel implementation widely using for a cluster of computers.


+ **In the section “Categorizing Patterns” in the “Introduction to Parallel Computing_3.pdf” compare the following:**

    + ***Collective synchronization (barrier) with Collective communication (reduction)***
        + All the processes are reached to a specific point before executing. 

        + Acts as a reduction since once the process of the communicator collects data from all other processes and performs an operation to find the result. 

        + Blocks all the processes until a specific synchronization point is being reached.

        + It acts as a barrier since it blocks the process until all other processes are being reached to synchronization point successfully.

    + ***Master-worker with fork join***
        + A master or main process is being divided into small chunks which inturn being distributed to several worker processes wherein in Fork-Join pattern which is used to execute parallel lightweight processes and threads.

+ **Dependency: Using your own words and explanation, answer the following:**

    + ***Where can we find parallelism in programming?***
        + Techniques to make programs faster by performing several computations at the same time. The most common use is in web search engines, applications, and multimedia technologies.        

    + ***What is dependency and what are its types (provide one example for each)?***
        + When one operation depends on an earlier operation to complete and produce a result before this later operation can be performed.

        + **Types of Dependencies:** 
            + **Control Flow :** How different program instructions affect each other.
            + **Data :** How different pieces of data are related and affect each other during execution.
            + **Loop :** Almost always involves the study array access patterns.

    + **When a statement is dependent and when it is independent (Provide two examples)?**
        + **Dependent :** When the order of execution of two statements matter.
            + **Example :**
                ```c
                int x=1;
                int y=2;
                ```
        + **Independent :** When the order of execution of two statements not matter.
            + **Example :**
                ```c
                int x=1;
                int y=x;
                ```
    + **When can two statements be executed in parallel?**
        + It can happen when the order of their execution does not affect the computation outcome. 

    + **How can dependency be removed?**
        + Changing the program in order to rearrange statements or eliminate statements.

    + **How do we compute dependency for the following two loops and what type/s of dependency?**

    ```c
    for (i=0; i<100; i++) {        
        a[i] = i;   // statement 1
    }
    ```

    ```c
    for (i=0; i<100; i++) {
        a[i] = i;     // statement 1
        b[i] = 2*i;   // statement 2
    }
    ```

    + The dependency for the following two loops can be calculated by checking the resources that are shared inside of the instructions set In this case, variables i and the array a[i]. Both are modified in both loops.

    On the first loop, for the instruction S1:a[i] = i:
a[i] is dependent on variable i and a[i] value will be changed only after reading i value, the dependency type is real dependency.

    On the second loop, for the instruction  S1:a[i]= i, the dependency type is real dependency. For the instruction S2: b[i] = 2*i the dependency type is also real dependency.


### **Part2**
___
+ **2.0 INTEGRATION USING THE TRAPEZOIDAL RULE**
    + **#pragma omp parallel for private(i) shared (a, n, h, integral)**
    + **#pragma omp parallel for private(i) shared (a, n, h) reduction(+: integral)** 
        + Variables can have either shared or private context in a parallel environment. Variables in shared context are visible to all threads running in associated parallel regions. Variables in private context are hidden from other threads. Each thread has its own private copy of the variable, and modifications made by a thread to its copy are not visible to other threads.

        + private : The private clause declares the variables in the list to be private to each thread in a team.

        + shared : The shared clause declares the variables in the list to be shared among all the threads in a team. All threads within a team access the same storage area for shared variables.

        + reduction : The reduction clause performs a reduction on the scalar variables that appear in the list, with a specified operator.     


    + Created a program trap-notworking.c [trap-notworking.c](trap-notworking.c).

    + Compiled and linked the program.
    ![screenshot](resources/screen1.png)

    + Created a program trap-working.c [trap-working.c](trap-working.c).

    + Compiled and linked the program.
    ![screenshot](resources/screen2.png)

    + Program execution
    ![screenshot](resources/screen3.png)

    + Running trap-notworking four times to emphasize the issue:
    ![screenshot](resources/screen4.png)

    **Note:**
        + The clause ***reduction(+: integral)*** solved the shared memory issue. The OpenMP reduction clause lets you specify one or more thread-private variables that are subject to a reduction operation at the end of the parallel region.


+ **3.0 Coordination: Synchronization with a Barrier**
    + **#pragma omp barrier :** The omp barrier directive identifies a synchronization point at which threads in a parallel region will wait until all other threads in that section reach the same point. Statement execution past the omp barrier point then continues in parallel.

    + Created a program barrier.c [barrier.c](barrier.c).

    + Compiled and linked the program.
    ![screenshot](resources/screen5.png)

     + Program execution (without barrier directive - line 33)
     ```c
     // #pragma omp barrier
     ```
    ![screenshot](resources/screen6.png)
    **Note:** The output of the printf statement can be observed during the parallel execution. The program output the words "BEFORE" and "AFTER" in sequential order for each thread (4 threads).

     + Program execution (with barrier directive - line 33)
     ```c
      #pragma omp barrier
     ```

    ![screenshot](resources/screen7.png)
    **Note:** Differently from the first execution, we can observe that all threads only execute the second printf statement (print "AFTER") only after all threads reach the barrier.

+ **4.0 Program Structure: The Master-Worker Implementation Strategy**
    + Created a program masterWorker.c [masterWorker.c](masterWorker.c).

    + Compiled and linked the program.
    ![screenshot](resources/screen8.png)

     + Program execution (without parallel directive - line 25)
     ```c
     // #pragma omp parallel
     ```
     ![screenshot](resources/screen9.png)
     **Note:** Only the result of if statement is executed by the programa (printf("Greetings from the master, # %d of %d threads\n",id, numThreads)). It means that thread id is always zero.

     + Program execution (with parallel directive - line 25)
     ```c
      #pragma omp parallel
     ```
     ![screenshot](resources/screen10.png)
     **Note:** Now both if and else statements are executed by the program. It means that thread is changing (parallel execution).







 

