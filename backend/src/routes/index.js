const { Router }=require('express');
const router = Router();
const pool = require("../../db");
const cors=require('cors');

router.get('/',(req,res) =>{
    res.json({"Title":"hola"});
})

router.post('/login', async(req,res) =>{
    const {user, pass}=req.body;
    const getUser= await pool.query("SELECT id_usuario FROM usuarios where usuario = $1 AND clave = $2", [user, pass]);
    if( getUser.rows.length){
        res.json({
            status:1,
            token:getUser.rows[0].id_usuario
        })
        return
    }else{
        res.json({
            status:0
        })
        return;
    }
});

router.post('/writecommit', async (req,res) =>{
    const {idpokemon, user, commit}=req.body;
    const data= await pool.query("INSERT INTO movesets (id_user,id_pokemon,moveset) VALUES ($1,$2,$3)", [user,idpokemon,commit])
    res.json({
        status:1
    });
})

router.get('/pokemon', async (req,res) =>{
    const data= await pool.query("Select * FROM pokemons")
    res.json(data.rows);
})

router.post('/commit', async (req,res) =>{
    const {idpokemon}=req.body;
    const data= await pool.query("Select * FROM pokemons where id_pokemon=$1", [idpokemon])
    res.json(data.rows);
})
router.post('/commit2', async (req,res) =>{
    const {idpokemon}=req.body;
    const data= await pool.query("SELECT c.id_moveset,u.usuario,c.moveset FROM usuarios AS u INNER JOIN movesets as c ON u.id_usuario=c.id_user where c.id_pokemon=$1", [idpokemon])
    res.json(data.rows);
})

router.delete('/borrar', async (req,res) =>{
    const {idcommit}=req.body;
    const data= await pool.query("DELETE FROM movesets WHERE id_moveset=$1",[idcommit])
    res.json({
        status:1
    });
})
router.put('/editar', async (req,res) =>{
    const {idcommit,commit}=req.body;
    const data= await pool.query("UPDATE movesets SET moveset=$2 WHERE id_moveset=$1 ",[idcommit,commit])
    res.json({
        status:1
    });
})


module.exports = router;