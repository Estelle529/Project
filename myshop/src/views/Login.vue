<template>
    <div class="login">
        <div class="loginContent setWidth">
            <el-input placeholder="用户名" v-model="username" clearable @blur="checkname">
                <i slot="prefix" class="el-input__icon el-icon-user"></i>
            </el-input>
            <el-input placeholder="密码" v-model="pass" show-password @blur="checkpass">
                <i slot="prefix" class="el-input__icon el-icon-key"></i>
            </el-input>
            <p class="nameerrmsg" :style="{color:namecheckflag?'green':'red'}">{{nameerrmsg}}</p>
            <p class="passerrmsg" :style="{color:passcheckflag?'green':'red'}">{{passerrmsg}}</p>
            <el-button type="success" @click="mylogin">登录</el-button>
        </div>
    </div>
</template>
<script>
    import { Message } from 'element-ui';
    export default {
        name: "Login",
        data() {
            return {
                username: "",
                pass: "",
                nameerrmsg:"",
                passerrmsg:"",
                namecheckflag:true,
                passcheckflag:true
            }
        },
        created() {
            this.$store.commit('setcat', false)
        },
        methods: {
            checkname(){
                var name = /^[\u4e00-\u9fff\w]{5,16}$/;
                this.namecheckflag = name.test(this.username);
                if(!this.namecheckflag){
                    this.nameerrmsg = "用户名为5到16位汉字,字母,数字,下划线"
                }else{
                    this.nameerrmsg = "用户名格式正确"
                }
            },
            checkpass(){
                var pass = /^[A-Za-z0-9]{10,15}$/;
                this.passcheckflag = pass.test(this.pass);
                if(!this.passcheckflag){
                    this.passerrmsg = "密码为10到15位数字,字母"
                }else{
                    this.passerrmsg = "密码格式正确"
                }
            },
            mylogin() {
                if(this.namecheckflag && this.passcheckflag && this.username.length > 0 && this.pass.length > 0){
                    this.axios.get('/login?userName=' + this.username + '&password=' + this.pass).then((res) => {
                        if (res.data.code == 0) {
                            Message({
                                message: "登陆失败,请检查用户名或密码,若未注册请先注册!",
                                type: "info",
                                showClose: true
                            })
                        } else {
                            this.$store.commit('setloginstause', true)
                            this.$store.commit('settoken', res.data.token)
                            this.$store.commit('setuser', this.username)
                            Message({
                                message: "登陆成功,欢迎" + this.username,
                                type: "success",
                                showClose: true
                            })
                            this.$router.replace("/");
                        }
                    })
                }
            }
        },
        mounted() {
            
        },
    }
</script>
<style scoped>
    .loginContent {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 150px;
    }

    .el-input,
    .loginContent button {
        width: 500px;
        margin: 10px 0;
    }
    .nameerrmsg, .passerrmsg{
        width: 500px;
        text-align: left;
        font-size: 12px;
    }
</style>