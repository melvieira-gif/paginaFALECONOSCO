const express = require("express")
const app = express()
const porta = 3000
const cors = require('cors')
const mysql = require('mysql2/promise')
const conexao = require('./db.js')


app.use(express.json())
app.use(cors())

app.post("/faleconosco", async (req,res)=>{
    try {
        const{nome, email, assunto, mensagem} = req.body

        // tratativas para ver se esta tudo correto
        if(assunto==""){
            return res.json("Preencha um assunto")
        }else if(email.length <6){
            return res.json("Preencha o email")
        }else if(nome.length <6){
            return res.json("Preencha o seu nome completo")
        }else if(mensagem.length <11){
            return res.json("Preencha o que o nosso site pode melhorar")
        }

        // montando um mysql para inserir informaçoes na tabela 
        let sql = `INSERT INTO faleconosco (nome, email, assunto, mensagem) VALUES (?,?,?,?)`
        let [resul2] = await conexao.query(sql,[nome, email, assunto, mensagem])

        // para ve se houve mensagem ou não, 
        if(resul2.affectedRows == 1){
            return res.json({"resposta":"Mensagem feita com sucesso"})
        }else{
            return res.json({"resposta":"Erro ao fazer a mensagem"})
        }        

    } catch (error) {
       console.log(error) 
    }
})


app.listen(porta,()=>{
    console.log("servidor rodando")
})