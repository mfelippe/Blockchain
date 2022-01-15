pragma solidity 0.5.3;
/**
  * Desafio
  * EASY - CRIAR UM CONTRATO COM QUALQUER NOME ELE DEVE:
  * [1] - receber um numero de 0 a 10, que será passado por um usuario;
  * [2] - se o numero for maior que 5, retornar o text "é maior que cinco !";
  * [3] - se o numero for menor que 5, retornar o texto " é menor que cinco";
  * [4] - cobrar 0,25 ETH pra executar esta função;
  * 
  * MEDIUM
  * [1] -  O preço para executar a função duplica cada vez que ela for executada;
  * [2] -  sempre que o preço mudar, o contrato distava um evento informado qual é o novo preço;
  * 
  * HARD 
  * [1] - O Dono do contrato é dono de todo ETH no contrato e pode sacá-lo;
  * [2] - O Dono do contrato pode escolher o valor a ser sacado em cada saque.
  **/
 contract Owner {
  
  address payable public owner;

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
  contract Others is Owner{

    uint price = 25 finney;
    mapping(address=>uint)public balances;

    event newPrice(uint newPrice);

    function whatAbouth(uint MyNumber) payable public returns(string memory){
      
      require(MyNumber <=10, "tem que ser um numero menor que 10");
      
      require(msg.value == price, "Sem saldo para operação");
      doublePrice();
      balances[owner]=balances[owner] + msg.value; // recebe o valor do contrato
      if(MyNumber>5){
        return "É maior que 5";
      }else{
        return "é menor que 5";
      }
    }
    function doublePrice()private{
        price = price*2;// valor multiplicado por 2
        emit newPrice(price);
    }
    function withDraw(uint myAmount)onlyowner public{
      require(address(this).balance >= myAmount, "valor insuficiente");// confere se tem o valor para ser sacado
    
        owner.transfer(myAmount); // função nativa da rede etherium
    }

}