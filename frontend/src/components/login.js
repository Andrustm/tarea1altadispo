import React, { useState } from "react";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import 'bootstrap/dist/css/bootstrap.min.css';
import Container from "react-bootstrap/Container";

export default function Login() {
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");
    const [loading, setLoading] = useState(false);

    function validateForm() {
      return username.length > 0 && password.length > 0;
    }

    async function singIn(){
      if(!loading){
        setLoading(true);
        fetch('http://localhost:3000/login', {
          method: 'POST',
          headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            user: username,
            pass: password
          }),
        })
          .then((response) => response.json())
          .then(async (json) => {
            if(json.status){
              localStorage.setItem('token', json.token);
              setLoading(false);
              window.location.href = "/pokemon";
            } else{
              alert("fallo el inicio de sesion")
            }
          })
          .catch((error) => {
            console.error(error);
          });
        setLoading(false);
      }
    }


    function handleSubmit(event) {
      singIn();
      event.preventDefault();
    }

    return (
        <Container Style="
        max-width:40%;
        position: fixed;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
        border-style: solid;">
        <Form onSubmit={handleSubmit} Style="
        padding: auto;
        ">
        <Form.Group className="mb-3" controlId="formBasicEmail">
          <Form.Label >Usuario
          <Form.Control 
          type="text" 
          placeholder="Usuario" 
          value={username}
          onChange={(e) => setUsername(e.target.value)}
          />
          </Form.Label>
        </Form.Group>
      
        <Form.Group className="mb-3" controlId="formBasicPassword">
          <Form.Label>Contraseña
          <Form.Control 
          type="password" 
          placeholder="Contraseña"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
           />
          </Form.Label>
        </Form.Group>
        <Button variant="primary" type="submit" disabled={!validateForm()}>
          Submit
        </Button>
      </Form>
      </Container>
    );
}

