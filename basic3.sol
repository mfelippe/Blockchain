pragma solidity 0.5.3;

contract HelloWorld{

	function sum(uint8 num1, uint8 num2) public pure return(uint8){

		uint8 num3 = num1 + num2;

		require(num3 >= num1, "Aconteceu um overflow"); // soma validada sem overflow

		return num3;
	}
}