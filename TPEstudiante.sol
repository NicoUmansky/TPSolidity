

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiantes{
    string private _nombre;
    string private _apellido; 
    string private _curso;
    address private docente;
    mapping(string => uint) private notas_materias;
    string[] private materias;
    

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

    function set_notas_materias (string memory materia , uint notas) public{
        require (msg.sender == docente, "solo el docente puede modificar notas");
        notas_materias [materia] = notas;
        materias.push(materia);
    }
    function nota_materia(string memory materia) public view returns (uint){
        return notas_materias [materia];
    }

    function aprobo(string memory materia) public view returns (bool){
        if (notas_materias[materia] >= 60){
            return true;
        }
        else {
            return false;
        }
    }

    function promedio() public view returns (uint){
        uint promdediofinal;

        for (uint i = 0; i<materias.length; i++){
            promdediofinal += notas_materias[materias[i]];
          
        }
        return promdediofinal /(materias.length);
    }


}