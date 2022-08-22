// The 'myaleo.aleo' program.
program myaleo.aleo;

function hello:
    input r0 as u32.public;
    input r1 as u32.private;
    add r0 r1 into r2;
    output r2 as u32.private;


record token:
    owner as address.private;
    gates as u64.private;
    amount as u64.private;

// mint 一个新的token
function mint_token:
    // token 地址
    input r0 as address.private;
    // token 数量
    input r1 as u64.private;
    // 密码
    input r2 as field.private;

    // 核对密码是否正确
    hash.psd2 r2 into r3;
    // 如果密码哈希匹对成功则继续，否则执行失败
    assert.eq r3 7202470996857839225873911078012225723419856133099120809866608931983814353616field;

    // create a new token in r2 register
    // 在注册器里创建一个新的token
    cast r0 0u64 r1 into r4 as token.record;
    // return the new token
    output r4 as token.record;

// Function to transfer tokens between accounts
function transfer_token:
    //  sender token record
    input r0 as token.record;
    // receiver address
    input r1 as address.private;
    // amount to transfer
    input r2 as u64.private;

    // final balance for sender
    sub r0.amount r2 into r3;
    // final balance for receiver
    add 0u64 r2 into r4;

    // sender token record after the transfer
    cast r0.owner r0.gates r3 into r5 as token.record;
    // receiver token record after the transfer
    cast r1 0u64 r4 into r6 as token.record;

    // sender new token record
    output r5 as token.record;
    // receiver new token record
    output r6 as token.record;