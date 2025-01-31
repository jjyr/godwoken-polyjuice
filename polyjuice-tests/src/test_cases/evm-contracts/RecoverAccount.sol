pragma solidity >=0.6.0 <=0.8.2;

contract RecoverAccount {
    function recover(bytes32 message, bytes memory signature, bytes32 code_hash) public returns (bytes memory) {
        bytes memory input = abi.encode(message, signature, code_hash);
        bytes memory output = new bytes(256);
        assembly {
            let len := mload(input)
            if iszero(call(not(0), 0xf2, 0x0, add(input, 0x20), len, output, 288)) {
                revert(0x0, 0x0)
            }
        }
        return output;
    }

    function get() public pure returns (bytes memory) {
        bytes memory ret = hex"aabbccdd";
        return ret;
    }
}
