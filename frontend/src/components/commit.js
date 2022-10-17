import React, { useState,useEffect } from "react";
import Button from "react-bootstrap/Button";
import 'bootstrap/dist/css/bootstrap.min.css';
import Toast from 'react-bootstrap/Toast';
import ToastContainer from 'react-bootstrap/ToastContainer'
import Swal from 'sweetalert2'

export default function Commit() {



    const [data, setdata] = useState([]);
    const [refreshKey, setRefreshKey] = useState(0);


    useEffect(() => {
      const getCommit = async () => {
        fetch('http://localhost:3000/commit2', {
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
        
      getCommit().catch(null);


  }, [refreshKey]);
    

    async function Borrar(id){
      fetch('http://localhost:3000/borrar', {
        method: 'DELETE',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          idcommit: id.target.getAttribute('value')
        }),
      })
        .then((response) => response.json())
        .then(async (json) => {
          setRefreshKey(oldKey => oldKey +1)
        })
        .catch((error) => {
          console.error(error);
        });

  
    
  }
  async function Editar(id,commit){
    fetch('http://localhost:3000/Editar', {
      method: 'PUT',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        idcommit: id,
        commit:commit
      }),
    })
      .then((response) => response.json())
      .then(async (json) => {
        setRefreshKey(oldKey => oldKey +1)
      })
      .catch((error) => {
        console.error(error);
      });
  
}
function Alert(id){
  Swal.fire({
    title: 'Moveset',
    html:
      '<input id="swal-input1" class="swal2-input">',
    focusConfirm: false,
    preConfirm: () => {
      return [
        Editar(id.target.getAttribute('value'),document.getElementById('swal-input1').value)
      ]
    }
  })
}

    return(
        <ToastContainer>
            {data.map(data => (
                <Toast key={data.id_moveset}>
                <Toast.Header>
                  <img src="holder.js/20x20?text=%20" className="rounded me-2" alt="" />
                  <strong className="me-auto">{data.usuario}</strong>
                </Toast.Header>
                <Toast.Body>{data.moveset}</Toast.Body>
              <Button variant="primary" value={data.id_moveset} onClick={Borrar} >Borrar</Button>
              <Button variant="primary" value={data.id_moveset} onClick={Alert}>Editar</Button>
              </Toast>

            ))}
  </ToastContainer>
        
    );
}