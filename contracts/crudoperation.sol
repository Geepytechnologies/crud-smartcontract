// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract crudoperation {

    struct employee {
        string name;
        string email;
        uint256 age;
    }

    employee[] public employees;
    uint256 public totalEmployees;

    constructor(){
        totalEmployees = 0;
    }

    function createEmployee(string memory name, string memory email, uint256 age) public returns (uint256 _totalEmployee){
       employee memory newEmployee = employee(name, email, age);
       employees.push(newEmployee);
       totalEmployees++;
       return totalEmployees;
    }
    
    function readEmployees () public view returns (employee[] memory) {
        return employees;
    }

    function updateEmployee(string memory name, string memory email) external returns (bool){
        for(uint i = 0; i < totalEmployees; i++){
            if(compareStrings(employees[i].email, email)){
                employees[i].name = name;
                return true;
            }
        }
        return false;
    }


    function deleteEmployee (string memory email) external returns(bool)  {
        require(totalEmployees > 0);
        for(uint i = 0; i < employees.length-1; i++){
            if(compareStrings(employees[i].email, email)) {
                employees[i] = employees[employees.length-1];
                employees.pop();
                totalEmployees--;
                return true;
            }
        }
                return false;
    }

    function compareStrings(string memory a, string memory b) internal pure returns (bool){
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }

}