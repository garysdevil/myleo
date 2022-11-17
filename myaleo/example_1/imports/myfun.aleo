program myfun.aleo;

// 通过 closure 关键字声明一个闭包，闭包函数不能直接执行必须通过其它函数调用来执行
closure util_add:
    input r0 as u32;
    input r1 as u32;
    add r0 r1 into r2; // 调用sdk的函数add
    output r2 as u32;

// 定义一个函数，传入两个u32类型的参数执行相加操作 
// 运行方式 aleo run fun_add 1u32 22u32
function fun_add: // 通过 function 关键字定义一个函数
    input r0 as u32.public; // 定义一个输入参数r0，类型为u32，可见性为public
    input r1 as u32.private;
    call util_add r0 r1 into r2; // 通过call关键字，调用自定义的闭包函数
    output r2 as u32.private; // 定义一个输出参数r2，类型为u32，可见性为private

// 定义一个函数 执行相加操作
// 运行方式 aleo run fun_sub 10u32 1u32
function fun_sub:
    input r0 as u32.public;
    input r1 as u32.private;
    sub r0 r1 into r2;
    output r2 as u32.private;

// 通过 interface 关键字定义一个数据结构
interface array3:
    a0 as u32;
    a1 as u32;
    a2 as u32;

// 定义一个函数，给record里的值都执行加1操作，然后输出一个新的record 
// 运行方式 aleo run sum_one_to_array3 "{a0: 0u32, a1: 1u32, a2: 2u32}"
function sum_one_to_array3:
    input r0 as array3.private; // 输入一个数据类型为array3的数据
    add r0.a0 1u32 into r1; // 通过r0.a0访问interface变量内部的属性
    add r0.a1 1u32 into r2;
    add r0.a2 1u32 into r3;
    cast r1 r2 r3 into r4 as array3; // 使用cast关键字创建一个新的 interface
    output r4 as array3.private; // 输出
