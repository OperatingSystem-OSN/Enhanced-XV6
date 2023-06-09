# Assignment 4 : Enhancing XV-6

# *Operating Systems and Networks, Monsoon 2022*

---

xv6 is a simplified operating system developed at MIT. Its main purpose is to explain the main concepts of the operating system by studying an example kernel. xv6 is a re- implementation of Dennis Ritchie's and Ken Thompson's Unix version 6 (v6). xv6 loosely follows the structure and style of v6, but is implemented for a modern RISC-V multiprocessor using ANSI C.

---

### Enhanced by:
*Yash Shivhare (2021101105)*

---

## System calls and their Implementation:

---

### System call 1 : trace

Added the system call trace and an accompanying user program strace . The
command will be executed as follows :

strace mask command [args]

strace runs the specified command until it exits.

It intercepts and records the system calls which are called by a process during its
execution and print the following details regarding system call:

1. The process id
2. The name of the system call
3. The decimal value of the arguments
4. The return value of the syscall.

*Implementation:*

1. Added a new variable trace_mask in struct proc in kernel/proc.h and initialised it to 0 in allocproc() in kernel/proc.c and making sure that child process inherits the mask value from parent process.
2. Added a user function strace.c in user and added entry(”trace”) in user/usys.pl
3. Made necessary changes kernel/syscall.c, kernel/syscall.h and changed certain part of syscall() so that system call which we want to trace is traced :    
4. Implemented a function sys_trace() in kernel/sysproc.c to set trace_mask value given by user
---

### System Call 2 : sigalarm and sigreturn :

A feature that periodically alerts a process as it uses CPU time

Added a new sigalarm(interval, handler) system call. If an application
calls alarm(n, fn) , then after every n "ticks" of CPU time that the program consumes,
the kernel will cause application function fn to be called. When fn returns, the
application will resume where it left off.

Added another system call sigreturn() , to reset the process state to before the handler was called.

*Implementation:*

1. Added new variables in ticks, ticks_after, alarm in struct proc in kernel/proc.h and initialised them to 0 in allocproc() in kernel/proc.c.
2. Implemented a function sys_sigreturn() and sys_sigalarm() in kernel/sysproc.c
3. Changing values of ticks and ticks_after in usertrap() in kernel/trap.c and changing alarm variable in proc to 0 and reset it to 1 in sigreturn because incase of handler function runs for more time than ticks after which handler should be ran.
---

## *Scheduling Types and implementation*

(By default *Round Robin* is implemented in xv6 with time slice of 1 tick)

---

### 1. FCFS ( First Come First Service ) :

---

A policy that selects the process with the lowest creation time (creation time refers to the tick number when the process was created). The process will run until it no longer needs CPU time.

1. Added a variable runtime in struct proc in kernel/proc.h
2. Initialised runtime variable to ticks in allocproc() function in  kernel/proc.c 
3. Implemented scheduling functionality in scheduler() function in kernel/proc.c, where the runnable process of lowest runtime is selected from all processes.
4.  Used pre-processor directives to declare the alternate scheduling policy in scheduler() in kernel/proc.c.
5. yield() function in  kerneltrap() and usertrap() functions in kernel/trap.c is disabled to disable timer interrupts thus disabling preemption.
---

### 2. Lottery Based Scheduler (LBS) :

---

A preemptive schedule that assigns a time slice to the process randomly in proportion to the number of tickets it owns. That is the probability that the process runs in a given time slice is proportional to the number of tickets owned by it.

1. Implemented a new system call settickets , which sets the number of tickets of calling process. By default each process should get 1 ticket , calling this routine changes the number of tickets . Also the child process inherits the number of tickets from parent process.
2. Added a new variables tickets in struct proc in kernel/proc.h
3. Initialised tickets to 1 in allocproc() in kernel/proc.c and made a function sys_settickets() in kernel/sysproc.c
4. Declared a global variable totalticket in kernel/proc.c and initialised it to 0 in initproc() in kernel/proc.c and adding tickets of process when it’s state is changing is to *RUNNABLE* and subtracting it when it’s state is changing to *RUNNING*
5. Implemented scheduling functionality in scheduler() function in kernel/proc.c . We call a rand function which selects a golden ticket between 1 and total tickets of runnable process and from this ticket we choose which process range ticket this ticket belong to.
---

## 3. Priority Based Scheduler (PBS):

---

A non-preemptive priority-based schedules that selects the process with the highest priority for execution. In case two or more processes have the same priority, we use the number of times the process has been scheduled to break the tie. If the tie remains, use the start-time of the process to break the tie(processes with lower start times should be scheduled further)

1. Made a new system call set_priority() and added sys_set_priority() function in kernel/sysproc.c which reschedules the processes if priority of processes increases.
2. Added a new user program setpriority.c in user
3. Added variables priority, runtime , waittime, nsched in struct proc in kernel/proc.h
4. Initialised priority to 60 and runtime, waittime, nsched to 0 in allocproc() in kernel/proc.c
5. yield() function in  kerneltrap() and usertrap() functions in kernel/trap.c is disabled to disable timer interrupts thus disabling preemption.
6. Implemented scheduling functionality in scheduler() function in kernel/proc.c, where the runnable process according to algorithm is chose.
7. Used pre-processor directives to declare the alternate scheduling policy in scheduler() in kernel/proc.c. 

1. To calculate dynamic priority of process in kernel/proc.c
---
---
## Comparison Between different scheduling mechanism

---

| Scheduler | Avg. Running time | Avg. Waiting time |
| --- | --- | --- |
| Round Robin (default) | 13 | 152 |
| FCFS | 25 | 112 |
| LBS | 13 | 150 |
| PBS | 13 | 125 |
We can clearly see RR has the highest avg. waot time since all the proccesses circle around and none gets executed at once.
We can also see that PBS has the lowest run time since the lower the time the more the priority it would get leading to lower average run time.
The above running time and scheduling time are calculated by running user/schedulertest.c on 1 CPU.

---
