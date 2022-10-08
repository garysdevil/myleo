import myfun.aleo; // 导入 myfun.aleo 程序进当前作用域内 // myfun.aleo 文件需要放在当前目录的imports文件夹内

// 声明一个隐私智能合约程序。
program myaleo.aleo;

// 定义一个函数，传入两个u32类型的参数执行减法操作 
// 运行方式 aleo run call_sub 10u32 1u32
function call_sub:
    input r0 as u32.public;
    input r1 as u32.private;
    call myfun.aleo/fun_sub r0 r1 into r2; // 调用myfun.aleo里面的fun_sub函数
    output r2 as u32.private;

// 通过 record 关键字定义一个record，必须包含 owner 和 gates 字段
record token:
    // 定义这个名字为token的record拥有者
    owner as address.private;
    // 定义gates的数量。gates为Aleo项目里代币的最小单位，如同以太坊里的Wei。
    gates as u64.private;
    // 定义amount字段
    amount as u64.private;

// 通过 mapping 关键字定义一个KV健值对
mapping account:
    // 账户地址作为Key
    key owner as address.public;
    // 数量作为Value
    value amount as u64.public;

// 创建指定数量的token给指定的账户地址
function mint_public:
    // 输入token的接收者
    input r0 as address.public;
    // 输入创建token的数量
    input r1 as u64.public;
    // Mint the tokens publicly.
    // 终局化到链上
    finalize r0 r1;

// 终局化mint_public函数的操作，增加account[address]的代币数量
finalize mint_public:
    // Input the token receiver.
    input r0 as address.public;
    // Input the token amount.
    input r1 as u64.public;

    // 终局化操作里必须包含一个increment或decrement操作
    // 执行增加操作 `account[r0]` + `r1`.
    // 如果 `account[r0]` 不存在，则被自动创建
    // 如果 `account[r0] + r1` 益处, `mint_public` 函数被重置
    increment account[r0] by r1;