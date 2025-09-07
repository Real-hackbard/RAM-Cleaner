# RAM-Cleaner:

</br>

```ruby
Compiler    : Delphi7 (or Higher)
Components  : jsMaxMem.pas, WinSvc.pas
Discription : Memory Cleaner
Last Update : 09/2025
License     : Freeware
```

</br>

### Simple app to free up your computer's memory:
MemoryCleaner is a tool for freeing up storage space on a computer. It's a free app with a simple interface that makes it easy for users of all skill levels to navigate. It also has limited scheduling features for some automation.

</br>

![RAM Cleaner](https://github.com/user-attachments/assets/ca0bf564-d2e3-4fc2-8948-1b55d70f7703)

</br>

Like other similar apps like Memory Cleaner: Ram Booster and Windows Memory Cleaner, MemoryCleaner aims to provide a faster user experience by freeing up memory. It can reduce boot times and increase the speed at which the computer performs tasks.

### Entfernen von Speicherplatz-Clutter:
When a computer slows down, one of the most common causes is a buildup of memory clutter from unnecessary programs. These programs are often things the user no longer needs or wasn't aware of in the first place. MemoryCleaner helps free up this memory, which in turn creates the perception of a speed boost, as the available memory helps the device regain some of its original speed.

### Simple User Interface:
MemoryCleaner's user interface is extremely simple, with the main window consisting of a single button to start the memory cleaning process. There are also additional controls for scheduling functions, but they contain only what is necessary to use the software.

### Physical Memory Defragmentation:
This feature comes from the problem represented by PR16405. As time passes, our physical memory starts to get fragmented. Eventually, even though there might be a significant amount of memory free in total, it is fragmented so that a request for a large piece of contiguous memory will fail.

Contiguous memory is often required for device drivers where the device uses DMA. The normal work-around is to ensure that all device drivers initialize early (before memory is fragmented) and hold onto their memory. This is a harsh restriction, particularly for embedded systems that might want to use different drivers depending on the actions of the user -- starting all possible device drivers simultaneously may not be feasible.

We have done work on the physical memory allocation algorithms in the 6.4.0 release which significantly reduces the amount of fragmentation that occurs. However, no matter how good your algorithms might be, certain usage patterns can lead to fragmentation.

The idea behind this feature is to defragment physical memory as necessary to support requests for contiguous Memory.

### Locate Memory Leaks:
In computer science, a memory leak is a type of resource leak that occurs when a computer program incorrectly manages [memory allocations](https://en.wikipedia.org/wiki/Memory_management) in a way that memory which is no longer needed is not released. A memory leak may also happen when an object is stored in memory but cannot be accessed by the running code (i.e. [unreachable memory](https://en.wikipedia.org/wiki/Unreachable_memory)). A memory leak has symptoms similar to a number of other problems and generally can only be diagnosed by a programmer with access to the program's source code.

A related concept is the "space leak", which is when a program consumes excessive memory but does eventually release it. Because they can exhaust available system memory as an application runs, memory leaks are often the cause of or a contributing factor to [software aging](https://en.wikipedia.org/wiki/Software_aging).

### Minor leaks:
If a program has a memory leak and its memory usage is steadily increasing, there will not usually be an immediate symptom. In modern operating systems, normal memory used by an application is released when the application terminates. This means that a memory leak in a program that only runs for a short time may not be noticed and is rarely serious, and slow leaks can also be covered over by program restarts. Every physical system has a finite amount of memory, and if the memory leak is not contained (for example, by restarting the leaking program) it will eventually cause problems for users.

### Thrashing:
Most modern consumer desktop operating systems have both [main memory](https://en.wikipedia.org/wiki/Computer_data_storage#Primary_storage) which is physically housed in RAM microchips, and secondary storage such as a hard drive. Memory allocation is dynamic – each process gets as much memory as it requests. Active pages are transferred into main memory for fast access; inactive pages are pushed out to secondary storage to make room, as needed. When a single process starts consuming a large amount of memory, it usually occupies more and more of main memory, pushing other programs out to secondary storage – usually significantly slowing performance of the system. Even if the leaking program is terminated, it may take some time for other programs to swap back into main memory, and for performance to return to normal. The resulting slowness and excessive accessing of secondary storage is known as [thrashing](https://en.wikipedia.org/wiki/Thrashing_(computer_science)).
