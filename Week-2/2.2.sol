// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//Constructor contract deploy edilirken sadece bir kere çalışır.Daha sonra tekrar çağırılamaz
// immutable ve constant özel kelimeleri nedir?
contract Constructor {
    address public owner;

    uint public constant comission = 2;
    uint public immutable comission_2 = 2;

    constructor(address _owner) {
        owner = _owner;
    }

    // constructor (address _owner){
    //     owner = _owner;
    //     comission = 3;
    // }

    // constructor (address _owner){
    //     owner = _owner;
    //     comission_2 = 3;
    // }
}

contract Functions {
    //Fonksiyonlarda kullanabileceğimiz 2 çeşit özel kelime vardır.
    //Pure ve View

    //Bunları ne zaman ve neden kullanırız ?

    //View

    uint public number_of_members = 1000;
    string public say_hi = "hi";

    function add_member(uint x) public view returns (uint) {
        return x + number_of_members;
    }

    //Pure

    function multiplication(uint a, uint b) public pure returns (uint) {
        return (a * b);
    }

    function hello() public pure returns (string memory) {
        return "Hi YTU Blockchain!";
    }
}

contract VisibilityOfFunctions {
    // public: Herhangi bir akıllı kontrat ya da  hesap tarafından çağırabilir.
    // private: Yalnızca fonksiyonun tanımlı olduğu kontratın içerisinde çağırılabilir.
    // internal: Tanımlı olduğu kontrat ile birlikte miras olarak alındığı kontrat tarafından da çağırılabilir.(Bir değişkeni public/private/internal yapmazsanız default olarak internal olur)
    // external: Fonksiyonun tanımlı olduğu kontrat haricindeki kontratlar tarafından çağırılabilir.

    uint public count = 0;

    function increase() internal {
        count++;
    }

    function increase_twice() public {
        increase();
        increase();
    }

    function get_count() private view returns (uint) {
        return count;
    }

    function show_count() public view returns (uint) {
        return get_count();
    }

    function get_half_of_count() external view returns (uint) {
        return get_count();
    }

    // function external_func_test() public view returns(uint){
    //     return get_half_of_count();
    // }
}
