# 建立函数文件



1.m

```matlab
clc,clear,close all;
fun1=@sin;
y1=fun1(pi);
fun2=@(x,y) (x+y)^2;
y2=fun2(1,2)
```



你写的这段 MATLAB 代码是关于**函数句柄（function handle）**的基本使用，写得非常好！下面我来一步步解释一下这段代码做了什么：

------

## ✅ 代码解析

```matlab
clc;
clear;
close all;
```

👉 清理命令窗口、变量空间、关闭图形窗口（常规初始化）

------

### 🔹 一阶函数句柄（单变量）

```matlab
fun1 = @sin;
y1 = fun1(pi);
```

- `fun1 = @sin;`：表示定义一个函数句柄，指向 MATLAB 内置的 `sin` 函数
- `fun1(pi)`：等价于 `sin(pi)`，结果是：

```matlab
y1 = 1.2246e-16   % 非严格为0，是因为浮点精度误差
```

------

### 🔹 自定义匿名函数句柄（多变量）

```matlab
fun2 = @(x,y) (x+y)^2;
y2 = fun2(1,2);
```

- `@(x,y)` 定义一个匿名函数（有两个输入参数）
- 函数内容是 `(x+y)^2`
- 调用 `fun2(1,2)` 相当于计算 `(1+2)^2 = 9`

所以：

```matlab
y2 = 9
```

------

## ✅ 输出结果

你运行后在命令窗口会看到：

```matlab
y1 = 1.2246e-16
y2 = 9
```

------

## 🎯 补充知识：函数句柄的应用场景

| 场景         | 示例                          |
| ------------ | ----------------------------- |
| 数值积分     | `integral(@(x) x.^2, 0, 1)`   |
| 优化求解     | `fminsearch(@(x) (x-3)^2, 0)` |
| 迭代算法     | 把自定义函数传入求解器        |
| GUI 回调函数 | 按钮点击触发 `@myCallback`    |

------

如果你想玩得更高级，比如：

- 定义函数数组
- 传入可变参数
- 把函数句柄作为输出返回

也可以告诉我，我可以带你进阶！需要我举几个有趣的实际例子吗？比如做个 `plot` 支持动态切换不同函数图像？



1.m

```matlab
clc,clear,close all;
fun1=@sin;
y1=fun1(pi);
fun2=@(x,y) (x+y)^2;
y2=fun2(1,2)
```





2.m



```matlab


clc,clear,close all;

x1=1;
x2=3;
y1=ysw_sum(x1,x2);
y2=ysw_sum(x1,x2)*ysw_sum(x1,x2);
fprintf('y1=%.2f\n',y1);
fprintf('y2%.2f\n',y2);

function y=ysw_sum(a,b)
y=a+b;
end
```

