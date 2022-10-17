import React, { useState,useEffect } from "react";
import 'bootstrap/dist/css/bootstrap.min.css';


export default function Pokemons() {



    const [data, setdata] = useState([]);

    useEffect(() => {
        const getPokemons = async () => {
            fetch("http://localhost:3000/pokemon")
                .then(response => response.json())
                .then(value => {
                    setdata(value);
                    console.log(data)
                    
                });
        };
        getPokemons().catch(null);
    }, []);

    function enviar(id){
        localStorage.setItem('idpokemon',id.target.getAttribute('value'))
        window.location.href="/commit"
    }
    
    return(

    <div className="header_fixed">
        <table>
            <thead>
                <tr>
                    <th>Numero</th>
                    <th>Imagen</th>
                    <th>Pokemon</th>
                    <th>Tipo</th>
                </tr>
            </thead>
            <tbody>
            {data.map(data => (
                <tr>
                    <td>{data.id_pokemon}</td>
                    <td><img src={"../../iconos/"+data.id_pokemon+".jpg"} /></td>
                    <td>{data.name}</td>
                    <td>{data.type}</td>
                    <td><button value={data.id_pokemon} onClick={enviar}>Ver Moveset</button></td>
                </tr>           
            ))}
            </tbody>
        </table>
    </div>
    );
}
