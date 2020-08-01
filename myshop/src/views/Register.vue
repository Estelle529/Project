<template>
    <div class="register">
        <div class="registerContent setWidth">
            <el-input placeholder="用户名" v-model="username" clearable @blur="checkname">
                <i slot="prefix" class="el-input__icon el-icon-user"></i>
            </el-input>
            <el-input placeholder="密码" v-model="pass" show-password @blur="checkpass">
                <i slot="prefix" class="el-input__icon el-icon-key"></i>
            </el-input>
            <p class="nameerrmsg" :style="{color:namecheckflag?'green':'red'}">{{nameerrmsg}}</p>
            <p class="passerrmsg" :style="{color:passcheckflag?'green':'red'}">{{passerrmsg}}</p>
            <el-button type="success" @click="myregister">注册</el-button>
        </div>
    </div>
</template>
<script>
    import { Message } from 'element-ui'
    export default {
        name: "Register",
        data() {
            return {
                username: "",
                pass: "",
                nameerrmsg: "",
                passerrmsg: "",
                namecheckflag: true,
                passcheckflag: true
            }
        },
        created() {
            this.$store.commit('setcat', false)
        },
        methods: {
            checkname() {
                var name = /^[\u4e00-\u9fff\w]{5,16}$/;
                this.namecheckflag = name.test(this.username);
                if (!this.namecheckflag) {
                    this.nameerrmsg = "用户名为5到16位汉字,字母,数字,下划线"
                } else {
                    this.nameerrmsg = "用户名格式正确"
                }
            },
            checkpass() {
                var pass = /^[A-Za-z0-9]{10,15}$/;
                this.passcheckflag = pass.test(this.pass);
                if (!this.passcheckflag) {
                    this.passerrmsg = "密码为10到15位数字,字母"
                } else {
                    this.passerrmsg = "密码格式正确"
                }
            },
            myregister() {
                if (this.namecheckflag && this.passcheckflag && this.username.length > 0 && this.pass.length > 0) {
                    this.axios.get('/register?userName=' + this.username + '&password=' + this.pass).then((res) => {
                        if (res.data.code == 1) {
                            Message({
                                message: "注册成功,将于两秒后跳转登录页面!",
                                type: "success"
                            })
                            setTimeout(() => {
                                this.$router.push("/login");
                            }, 2000)

                        } else {
                            Message({
                                message: "注册失败,用户名被占用!",
                                type: "info",
                                showClose: true
                            })
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
    .registerContent {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 150px;
    }

    .el-input,
    .registerContent button {
        width: 500px;
        margin: 10px 0;
    }

    .nameerrmsg,
    .passerrmsg {
        width: 500px;
        text-align: left;
        font-size: 12px;
    }
</style>