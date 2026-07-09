program hello.aleo;

record token:
    owner as address.private;
    amount as u64.private;

function mint:
    input r0 as u64.private;
    cast self.signer r0 into r1 as token.record;
    output r1 as token.record;

function add:
    input r0 as u32.public;
    input r1 as u32.private;
    add r0 r1 into r2;
    output r2 as u32.private;
