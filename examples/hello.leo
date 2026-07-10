// Syntax coverage sample for editor highlighting.
// It intentionally exercises both common Leo code and recently used syntax forms.

import credits.aleo;
import token_registry.aleo;

program hello.aleo {
    const MAX_SUPPLY: u64 = 1_000_000u64;
    const DEFAULT_FIELD: field = 123field;
    const DEFAULT_GROUP: group = 456group;
    const DEFAULT_SCALAR: scalar = 789scalar;
    const FLAGS: [bool; 4u32] = [true, false, true, false];
    const PROGRAM_REF: address = credits.aleo;

    interface TokenApi {
        fn balance_of(public owner: address) -> u64;
        fn transfer(public to: address, private amount: u64) -> bool;
        record Receipt;
        mapping approvals: address => u64;
        storage paused: bool;
    }

    struct Config {
        public owner: address,
        constant limit: u64,
        private seed: field,
        enabled: bool,
        label: string,
        tags: [field; 2u32],
        pair: (u32, bool),
    }

    record Token {
        owner: address,
        amount: u64,
        nonce: scalar,
    }

    mapping balances: address => u64;
    mapping allowances: (address, address) => u64;
    storage total_supply: u64;

    constructor(public owner: address) {
        let initial: u64 = 0u64;
        let config: Config = Config {
            owner,
            limit: MAX_SUPPLY,
            seed: DEFAULT_FIELD,
            enabled: true,
            label: "initial config",
            tags: [1field, 2field],
            pair: (0u32, true),
        };
        assert_eq(config.limit, MAX_SUPPLY);
        assert_neq(initial, MAX_SUPPLY);
    }

    @inline(always = "true")
    inline normalize(private amount: u64) -> u64 {
        let doubled: u64 = amount * 2u64;
        let rounded: u64 = doubled / 2u64;
        return rounded;
    }

    function arithmetic(public left: u32, private right: u32) -> u32 {
        let mut_value: u32 = left + right;
        mut_value += 1u32;
        mut_value -= 1u32;
        mut_value *= 2u32;
        mut_value /= 2u32;
        mut_value %= 100u32;
        mut_value **= 1u32;
        mut_value <<= 1u32;
        mut_value >>= 1u32;
        mut_value &= 255u32;
        mut_value |= 1u32;
        mut_value ^= 3u32;

        let bits: u32 = (left & right) | (left ^ right);
        let shifted: u32 = (bits << 1u32) >> 1u32;
        let powered: u32 = shifted ** 2u32;
        let selected: u32 = powered > 0u32 ? powered : 1u32;
        return selected;
    }

    transition mint(private amount: u64) -> Token {
        let normalized: u64 = normalize(amount);
        let token: Token = Token {
            owner: self.signer,
            amount: normalized,
            nonce: 1scalar,
        };
        return token;
    }

    async transition send(public receiver: address, private amount: u64) -> Future<Fn(address, u64) -> bool> {
        let ok: bool = amount <= MAX_SUPPLY && receiver != self.address;
        assert(ok);
        return async {
            let height: u32 = block.height as u32;
            let network_id: u32 = network.id as u32;
            let _ignored: u32 = height + network_id;
            return true;
        };
    }

    final finalize_send(public receiver: address, private amount: u64) {
        let previous: u64 = balances.get(receiver);
        balances.set(receiver, previous + amount);
        total_supply.set(total_supply.get() + amount);
    }

    script run(public receiver: address, private amount: u64) {
        let transfer: bool = credits.aleo/transfer(receiver, amount);
        assert_eq(transfer, true);
    }

    fn helper<const N: u32>(private values: [u64; N]) -> (u64, bool) {
        let first: u64 = values[0u32];
        let tuple: (u64, bool) = (first, first > 0u64);
        return tuple;
    }

    @test
    function test_arithmetic(public left: u32, private right: u32) -> u32 {
        let result: u32 = arithmetic(left, right);
        assert(result >= left || result == 1u32);
        assert_eq(result != 0u32, true);
        assert_neq(result, 999u32);
        return result;
    }

    function literals_and_patterns() -> bool {
        let binary: u8 = 0b1010u8;
        let octal: u16 = 0o755u16;
        let hex: u32 = 0xCAFEu32;
        let signed: i32 = -42i32;
        let maybe: u64? = none;
        let explicit: address = aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq;
        let generator: group = group::GEN;
        let final_type: Final<Fn(address, u64) -> bool> = Future::placeholder;
        let text: string = "Leo syntax coverage";
        let _ = binary;

        for index: u8 in 0u8..=10u8 {
            if index == 0u8 {
                assert_eq(octal > 0u16, true);
            } else {
                assert_neq(hex, 0u32);
            }
        }

        for index: u8 in 0u8..10u8 {
            assert(index < 10u8);
        }

        return text != "" && signed < 0i32 && maybe == none && explicit != self.caller && final_type != none && generator != DEFAULT_GROUP;
    }
}
