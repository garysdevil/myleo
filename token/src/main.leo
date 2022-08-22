record Token {
    owner: address,
    gates: u64,
    amount: u64,
}

@program
function mint_token(
    token_address: address,
    token_amount: u64,
    password: field,
) -> Token {
    // checks if the password is correct
    let candidate: field = Poseidon2::hash(password); 
    let is_correct: bool = candidate == 7202470996857839225873911078012225723419856133099120809866608931983814353616field;

    // stores amount input into r5 if the password was right 
    // otherwise, it stores 0u64 to avoid token creation
    let new_amount: u64 = is_correct ? token_amount : 0u64;

    // create a new token
    let new_token: Token = Token {
        owner: token_address,
        gates: 0u64,
        amount: new_amount,
    };

    return new_token;
}

@program 
function transfer_token(
    sender: Token,
    receiver: address,
    transfer_amount: u64,
) -> (Token, Token) {
    // final balance for sender
    let sender_balance: u64 = sender.amount - transfer_amount;

    // final balance for receiver
    let receiver_balance: u64 = 0u64 + transfer_amount;

    // Sender token record after the transfer.
    let sender_token: Token = Token {
        owner: sender.owner,
        gates: sender.gates,
        amount: sender_balance,
    };

    // Receiver token record after the transfer.
    let receiver_token: Token = Token {
        owner: receiver,
        gates: 0u64,
        amount: receiver_balance,
    };

    return (sender_token, receiver_token);
}