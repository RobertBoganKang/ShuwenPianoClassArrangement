# Shuwen's Piano Class Arrangement
## Introduction
Shuwen ([Zhang, Shuwen](http://imslp.org/wiki/Category:Zhang,_Shuwen)) got a new job at Zhejiang Music Conservatory to teach piano 1 on 1 class.

However, shuwen need a solution to arrange classes for his students, and he did it manually which cost him a long time to solve. Then, I give it a simple solution to find a seemingly satisfactory solutions for this problem.
## Problem Statement
* **Arrangement Law**

He needs to arrange 26 students once a week schedule
* **Time Available**

Each students has his/her time available for this class.

For example:
```javascript
金文瑶, 0, 一6-9、三6-9、四6-7、五1-5,8-9
```
The first data `金文瑶` represent the name of student; 

The second data `0` means he takes 0.5 classes time (for this case, in one class time, he can arrange 2 students at this period), however if it is `1`, this student take the whole class time;

The third data `一6-9、三6-9、四6-7、五1-5,8-9` represents the time available. Such as, `一6-9` is Monday's class 6 to class 9 are available;
* **No classes at certain time**
For example, he need to teach other student outside the campus, he need a day or half day off for his arrangement.
* **He need to put the name in one week schedule that satisfy all conditions listed above**
## Method
There problem is really hard to solve if we need to find a good solution. Unfortunately, I have no good method to solve this problem.

Since this problem has so many cases to consider, we cannot solve it within our life time, here is several methods:

Method I: just guess the solution, if it is not satisfied we will guess other solutions until find one.

Method II (trial): the DFS method that will consider all cases which is impossible.

## Interesting Story
Although this is super hard problem to solve, Shuwen has find one solution I call it "The God Solution" (namely, the solution came from god). Unfortunately my program cannot find it anyway. This solution is also posted in the `src` folder.
