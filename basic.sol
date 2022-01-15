pragma solidity 0.5.2;

contract HelloWordl{
	
	string public text;
	uint public number;
	address public userAddress;
	bool public answer;
	mapping (address => uint) public hasInterected;

	//função para setar texto
	function setText (string memory MyText) public{

		text = MyText;
	
	}
	//função para setar numeros
	function setNumber(uint MyNumber) public {
		number = MyNumber;
	}
	//função para capturar o endereço de interação no contrato
	function setAddress()public{
		userAddress = msg.sender;
	}
	// função para capturar respostas de true ou falso
	function setAnswer(bool TrueOrFalse) public{
		answer = TrueOrFalse;
	}
	// função para saber se um endereço teve interação no contrato
	function setInterected()private{
		hasInterected[msg.sender] = true;
	}
	function sum(uint num1, uint num2) public pure return(uint){
		return num1 + num2;
	}
}