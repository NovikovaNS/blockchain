pragma solidity ^0.5.0;

contract AkvelonToken {
  string public name = "Akvelon Token";
  string public symbol = "AKV";
  string public standard = "Akvelon Token v1.0"; // what for

  uint256 public totalSupply;

  event Transfer(
    address indexed _from,
    address indexed _to,
    uint256 _value
  );

  event Approval(
    address indexed _owner,
    address indexed _spender,
    uint256 _value
  );

  // return balance in uint256 on this address
  mapping(address => uint256) public balanceOf;

  mapping(address => mapping(address => uint256)) public allowance;
  // I am ^accound A, approve ^account B. And how many tokens I need to approve (uint256)

  constructor(uint256 _initialSupplay) public {
    // msg.sender is account who deploy a contract
    balanceOf[msg.sender] = _initialSupplay;
    totalSupply = _initialSupplay;
  }

  function transfer(address _to, uint256 _value) public returns (bool success) {
    // Expectation if account doesn't have enough tokens to transfer then we need show exeption
    //// if require is false => stop execution, otherwise run functions below
    require(balanceOf[msg.sender] >= _value);

    // Transfer the balance. Move tokens from 'msg.sender' account to '_to' account
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;

    // Transfer event
    Transfer(msg.sender, _to, _value);

    // Return boolean
    return true;
  }

  // _sender approve that spend _value count tokens
  function approve(address _sender, uint256 _value) public returns (bool success) {
    // Allowance
    allowance[msg.sender][_sender] = _value;

    // Approve event
    //// msg.sender - who call function, for approve _sender account
    Approval(msg.sender, _sender, _value);

    return true;
  }

  // 
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    // Require _from has enought tokens
    // Require allowance is big enough
    // Change the balance
    // Update the allowance
    // Transfer event
    // Return boolean
  }
}