const express = require("express")
const app = express()
const porta = 3000
const cors = require('cors')
const mysql = require('mysql2/promise')
const conexao = require('./db.js')
const crypto = require("crypto")


app.use(express.json())
app.use(cors())

app.post("/faleconosco", async (req,res)=>{
    try {

        const{nome, email, assunto, mensagem} = req.body
        const hr_status = new Date();
        const status_lei = 'Aguardando resposta'

        // tratativas para ver se esta tudo correto
        if(assunto==""){
            return res.json("Preencha um assunto")
        }else if(email.length <6){
            return res.json("Preencha o email")
        }else if(nome.length <6){
            return res.json("Preencha o seu nome completo")
        }else if(mensagem.length <11){
            return res.json("Preencha o que o nosso site pode melhorar")
        }else if(hr_status.length <6){
            return res.json({"resposta":"preencha"})
        }else if(status_lei.length <6){
            return res.json({"resposta":"preencha"})
        }

        // montando um mysql para inserir informaçoes na tabela 
        let sql = `INSERT INTO faleconosco (nome, email, assunto, mensagem, hr_status, status_lei) VALUES (?,?,?,?,?,?)`
        let [resul2] = await conexao.query(sql,[nome, email, assunto, mensagem, hr_status, status_lei])

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

app.get("/hash", async (req,res)=>{
    try {
        let {senha} = req.body
        senha = senha.trim()
        senha = senha.replace(("ㅤ", ""))

        if(senha==""){
            return res.send("Preencha uma senha ")
        }else if(senha.length < 6){
            return res.send("A senha tem que conter menos")
        }


        const hash = crypto.createHash("sha256").update(senha).digest("hex")
        res.send(` Usuario cadastrado com Sucesso ${hash} `)
        

    } catch (error) {
       console.log(`O seu erro foi ${error}`) 
    }
})

app.post("/cadastro_login", async (req,res)=>{
    try {
        let {nome_compl, email} = req.body
        // limpar os espaços da senhas
        let {senha} = req.body
        senha = senha.trim()
        senha = senha.replace(("ㅤ", ""))
                
        // tratativas para ver se esta tudo correto
        if(senha==""){
            return res.json("Preencha uma senha ")
        }else if(senha.length < 6){
            return res.json("A senha tem que conter menos")
        }else if(email.length <6){
            return res.json("Preencha o email")
        }else if(nome_compl.length <6){
            return res.json("Preencha o seu nome completo")
        }
         //se esta tudo correto, vai verificar se ja existe emnail cadastrado ja
        let sql = `SELECT * FROM cadastro_login WHERE email = ?` 
        let [resul] = await conexao.query(sql,[email]) 
        if (resul.length != 0){
            return res.json({"resposta":"Email já esta cadastrado! Tente novamente"})
        }
        // criar hash da senha e inserir novo usuario no banco de dados
        const hash = crypto.createHash("sha256").update(senha).digest("hex")
        // o ideal seria validar as informações =, se o nome, email e senha não ta vazio, a foto não pq esta permitindo NULL
        // montando um mysql para inserir informaçoes na tabela 
        sql = `INSERT INTO cadastro_login (nome_compl, email, senha) VALUES (?,?,?)`
        let [resul2] = await conexao.query(sql,[nome_compl, email, hash])

        // para ve se houve cadastros ou não, 
        if(resul2.affectedRows == 1){
            return res.json({"resposta":"Cadastro feito com sucesso!"})
        }else{
            return res.json({"resposta":"Erro ao fazer o cadastro"})
        }  
    } catch (error) {
        console.log(error)
    }
})


app.listen(porta,()=>{
    console.log("servidor rodando")
})