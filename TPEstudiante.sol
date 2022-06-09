
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiantes{
    string private _nombre;
    string private _apellido; 
    string private _curso;
    address private docente;
    mapping(string => uint) private notas_materias;
    string[] private materiasarr;

    constructor (string memory nombre_, string memory apellido_, string memory curso_){
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;

        docente = msg.sender;
    }

    function apellido() public view returns (string memory){
        return _apellido;
    }

    function nombre_completo() public view returns (string memory){
        return string.concat(_nombre,_apellido);
    }

    function curso() public view returns (string memory){
        return _curso;
    }

    function set_notas_materias (string memory materias , uint notas) public{
        require (msg.sender == docente, "solo el docente puede modificar notas");
        notas_materias [materias] = notas;
    }
    function nota_materia(string memory materias) public view returns (uint){
        return notas_materias [materias];
    }

    function aprobo(string memory materias) public view returns (bool){
        if (notas_materias[materias] >= 60){
            return true;
        }
        else {
            return false;
        }
    }

    function promedio() public view returns (uint){
        uint notas;
        uint long = materiasarr.length;
        for (uint i; i<=long; i++){
            notas += notas_materias[materiasarr[i]];
          
        }
        return notas/long;
    }


}