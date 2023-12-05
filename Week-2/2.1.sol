// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract SolidityVariables {
    // Sabit boyutlu ya da dinamik boyutlu tipler olabilir

    // SABİT BOYUTLU TİPLER
    uint number_1 = 10; // 0 ile 2^256 - 1
    uint8 number_2 = 10; // 0 ile 2^8 - 1
    uint16 number_3 = 10; // 0 ile 2^16 - 1
    //
    //Bu şekilde devam ediyor
    //
    int256 number_4 = 12; // -2^256 ile 2^256 - 1

    //Boolean veri tipi
    bool is_exist = true;
    bool is_exist_2 = false; // default olarak false tur

    //address veri tipi
    address an_address; // 0xcDA86eAbE89B4B7D46c0a147dc206ACbA4Fd900B  Her bir address maximum 20 byte dır

    //byte veri tipi
    bytes32 hash; // max 32 byte

    // Değişken Boyutlu Tipler
    uint[] students; // [1, 2, 3, 4, 5]
    string club;
    bytes university;
    mapping(uint => uint) team;

    // Enums ve Structs

    enum wallets {
        METAMASK,
        PHANTOM,
        ARGENT,
        BRAVOOS,
        SUI,
        KEPLR,
        AURO,
        LEAP
    }

    struct Student {
        uint ID;
        string name;
        string surname;
        uint age;
        string school;
        string major;
    }
    // operators

    // if(x == y)
    // if(x != y)
    // if(x == y && y == z)
    // if(x == y || y == z)
    // if(!is_exist)

    // birimler

    // 1 wei = 1
    // 1 gwei = 10^9
    // 1 ether = 10^18

    // State Değişkenleri

    string public school = "Yildiz Teknik Universitesi";
    uint256 public year = 1911;
    bool private is_university = true;

    //Solidity nin bize sağlamış olduğu bazı özel değişkenler

    // block.number (uint)	Current block number
    // block.timestamp (uint)	Current block timestamp as seconds since unix epoch
    // block.difficulty (uint)	Current block difficulty
    // block.gaslimit (uint)	Current block gaslimit
    // msg.data (bytes calldata)	Complete calldata
    // msg.sender (address payable)
}
