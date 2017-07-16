# Shuwen's Piano Class Arrangement
## Introduction
Shuwen ([Zhang, Shuwen](http://imslp.org/wiki/Category:Zhang,_Shuwen)) got a new job at Zhejiang Music Conservatory to teach piano 1 on 1 class.

However, shuwen need a solution to arrange class for his students, and he did it mannuly which cost him a long time to solve. Then, I give it a simple solution to find a seemingly satisfactory solutions for this problem.
## Problem Statement
### He needs to arrange 26 students within one week schedule 
### Each students has his/her time available for this class. For example:
```javascript
金文瑶, 0, 一6-9、三6-9、四6-7、五1-5,8-9
```
The first data `金文瑶` represent the name of student; 

The second data `0` means he takes 0.5 classes time (for this case, in one class time, he can arrange 2 students at this period), however if it is `1`, this student take the whole class time;

The third data `一6-9、三6-9、四6-7、五1-5,8-9` represents the time available. Such as, `一6-9` is Monday's class 6 to class 9 are available;

###
