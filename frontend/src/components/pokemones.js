import React, { useState,useEffect } from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import Image from 'react-bootstrap/Image';

export default function MostrarPokemon() {
  const [data, setdata] = useState([]);
  useEffect(() => {
    const getPokemon = async () => {
        fetch('http://localhost:3000/commit', {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        idpokemon:localStorage.getItem('idpokemon')
      }),
    })
            .then(response => response.json())
            .then(value => {
                setdata(value);
                
                
            });
    };
    getPokemon().catch(null);


}, []);

    return(
    <div>
      {console.log(data)}
      <Image src={"../../iconos/"+localStorage.getItem('idpokemon')+".jpg"} fluid />
      {data.map(data => (
        <div>
          <h1>{data.name}</h1>
          <h2>Stats:</h2><p>{data.stats}</p>
          <h3>{data.tag}</h3>
          </div>
       
      ))}
      
    </div>
  );
}