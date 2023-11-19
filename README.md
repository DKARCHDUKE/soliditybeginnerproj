# soliditybeginnerproj

### Public Variables

- `name`: The name of the token.
- `symbol`: The symbol of the token.
- `totalSupply`: The total supply of the token.

### Mapping

- `balances`: A mapping that associates addresses with token balances.

### Constructor

The constructor initializes the token details and sets the initial total supply to the deployer's address.

### Mint Function

The `mint` function increases the total supply and the balance of a specified address.

### Burn Function

The `burn` function decreases the total supply and the balance of a specified address. It includes a check to ensure that the sender has enough balance to burn.
