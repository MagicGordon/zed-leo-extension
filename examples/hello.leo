program hello.aleo {
    record Token {
        owner: address,
        amount: u64,
    }

    transition mint(private amount: u64) -> Token {
        return Token {
            owner: self.signer,
            amount,
        };
    }

    function add(public left: u32, private right: u32) -> u32 {
        let sum: u32 = left + right;
        return sum;
    }
}
