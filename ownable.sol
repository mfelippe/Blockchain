pragma solidity 0.5.3;

contract Ownable{

	address public owner;

	event OwnershipTransfered(address newOwner);
	

	constructor()public{
		owner = msg.sender;
	} // essa função é executada quando o contrato é criado pegando o endereço do criador

	modifier onlyowner() { 
		require (msg.sender == owner, " Você não é o Dono"); // requerimento que vc seja o dono
		_; 
	}

	function transferOwnership(address payable newOwner) onlyowner public{// função para transferir o dono do contrato

		owner = newOwner;
		emit OwnershipTransfered(owner);
	}

}

contract HelloWorld is Ownable{

	string public text;
    string public text2;
	function setText(string memory myText) onlyowner public{ // a função só irar se executada se vc for o dono do contrato

		text = myText;
	}
	function setTextNotOwner(string memory myText) public{ // essa função vai ser executada por qualquer pessoa que acessa o contrato
		text2 = myText;
	}

}