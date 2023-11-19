// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.


*/




contract MyToken {

    // Public variables
    // These are like the identity cards for our coin, showing its name, symbol, and how many there are in total.
    string public name;
    string public symbol;
    uint256 public totalSupply;

    // Mapping of addresses to balances
    // balances: Imagine this as a list that says how many coins each person has.
    mapping(address => uint256) public balances;

    // Constructor to initialize the token details and total supply
    // The contract starts by giving all the coins to the person who creates the contract. This is like the "starter pack."
    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        balances[msg.sender] = _totalSupply;
    }

    // Mint function
    // The mint function lets us make more coins. You just tell the contract how many new coins to create and who gets them.
    function mint(address account, uint256 value) external {
        // Increase the total supply
        totalSupply += value;
        balances[account] += value;
    }

    // Burn function
    // The burn function helps us remove coins. But, we need to be careful not to remove more coins than someone actually has!
    function burn(address account, uint256 value) external {
        // Ensure the sender has enough balance to burn
        require(balances[account] >= value, "Insufficient balance to burn");
        totalSupply -= value;
        balances[account] -= value;
    }
}

