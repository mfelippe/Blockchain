pragma  solidity 0.5.3;

contract HelloWorld2{

	string public text;
	mapping(address=> uint) public balances;

	function setText(string memory myText)public payable{

		require(msg.value>=1 ether, "Saldo  Insuficiente"); // pegando o valor da transão e exegindo que seja maior que 1 ether
		text = myText;
		balances[msg.sender]+= msg.value; //pega o valor do saldo 
	}

	//transferir Ether de uma conta p/ outra
	function senndEth(address payable targetAddress)public payable{
		 targetAddress.transfer(msg.value); // Inserir o endereço ao qual deseja enviar o ether
	}
	//saque de moedas com solução do problema de reentrancia 
	function withDraw()public{
		require(balances[msg.sender]>0, "saldo insuficiente"); // requer que o saldo em conta seja maior que zero
		uint amount = balances[msg.sender]; // pega o valor de saldo do cliente;
		balances[msg.sender] =0; // passa o saldo para zero para garantir que o usuario não entre na conta para sacar novamente;
		msg.sender.transfer(amount);// transefere todo o valor em conta
		
	}

}