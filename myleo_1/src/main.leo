// import math.square;
import learn.(
    debug
);

// The 'myleo' main function.
function main(a: u32, b: u32) -> u32 {

    let p = Point::new();
    p.x = 4u32; // u32类型的变量，值为4
    p.y = 6u32;
    let sum = p.add();
    console.log("The sum is {}", sum);


    debug();

    return add_func(a,b); // return 的结果会输出在outputs/${project_name}.out文件中
}

// 一个方法
function add_func(a: u32, b: u32) -> u32 {
    let c: u32 = a + b;
    return c;
}

// circuit 关键字类似于java中的class
circuit Point {
    x: u32,
    y: u32,

    // 返回Self的方法是静态方法，不需要实例化circuit就可以调用。 调用方式 Point::new()
    function new() -> Self {
        return Self { 
            x: 0, 
            y: 0, 
        };
    }

    // 调用方式 实例.add()
    function add(self) -> u32 {
        return self.x + self.y;
    }
}



// 通过执行 leo test 来进行单元测试
@test
function test_square() {
    let expected: u32 = 9; // 定义一个常量

    let actual = add_func(4u32, 5u32);

    console.assert(expected == actual);
}