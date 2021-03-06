﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>百度地图交流平台! </title>
    <link href="./css/opinion_css.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var $wbk = $("#youinput");
            $wbk.focus(function () {

            }).keydown(function () {
                $(this).css({ background: "#A8B2BE" })
            }).keyup(function () {
                $(this).css({ background: "white" })
            });
        })
    </script>
    <script type="text/javascript">
        $(function () {

            $('#btn1').click(function () {

                var txt = $('#txt1').val();
                console.log(txt);
                $('#txt1').val('');

                if (txt == '') {
                    alert('请输入内容！');
                    return;
                }


                $li = $('<li><span>' + txt + '</span><a href="javascript:;" class="up"> ↑ </a><a href="javascript:;" class="down"> ↓ </a><a href="javascript:;" class="del">删除</a></li>');

                $li.appendTo('#list');

            });



            /*

             $('.del').click(function() {
             $(this).parent().remove();
             });

             */


            $('#list').delegate('a', 'click', function () {

                var handler = $(this).attr('class');

                if (handler == 'del') {
                    $(this).parent().remove();
                }

                if (handler == 'up') {

                    if ($(this).parent().prev().length == 0) {
                        alert('到顶了！');
                        return;
                    }

                    $(this).parent().insertBefore($(this).parent().prev());
                }

                if (handler == 'down') {

                    if ($(this).parent().next().length == 0) {
                        alert('到底了！');
                        return;
                    }

                    $(this).parent().insertAfter($(this).parent().next());
                }


            });



        })

    </script>
    <style type="text/css">
        .list_con{
            width:400px;
            margin:50px auto 0;
        }

        .inputtxt{
            width:350px;
            height:30px;
            border:1px solid #ccc;
            padding:0px;
            text-indent:10px;

        }

        .inputbtn{
            width:40px;
            height:32px;
            padding:0px;
            border:1px solid #ccc;
        }

        .list{
            margin:0;
            padding:0;
            list-style:none;
            margin-top:20px;
        }

        .list li{
            height:30px;
            line-height:30px;
            border-bottom:1px solid #ccc;
        }

        .list li span{
            float:left;
        }

        .list li a{
            float:right;
            text-decoration:none;
            margin:0 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="box">
    <div id="top">
        <div id="top_nav">
            <ul>
                <li><a href="#">欢迎您来到百度地图导航交流平台!</a>&nbsp;</li>
            </ul>
            <div class="user">
                    <asp:Panel ID="Panel1" runat="server">
                        未登陆！<a class="log" href="UserLogin.aspx"  target="_parent">登录</a>
                        <span>|</span>
                        <a class="reg" href="register.aspx"  target="_parent">注册</a>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server">
                        欢迎您，<asp:Label ID="UserName" runat="server">
                        
                                </asp:Label>！
                        <span>|</span>
                        <a class="reg" href="exit.aspx"  target="_parent">注销</a>
                    </asp:Panel>
            </div>
        </div>
    </div>

    <div id="nav">
        <div id="nav_nav">
            <ul>
                <li><a href="#"><h4>大家在说|</h4></a></li>
                <li><a href="navmap.aspx"> 基于百度地图---导航系统</a></li>
            </ul>
        </div>

    </div>
    <hr/>
    <br/>
    <div id="main">
        <div id="useropinion">
            <p>用户反馈</p>
            <img src=img/xt.png>
        </div>
        <hr style="border: 2px solid cyan;"/>
        <div id="choose">
            <p>在您的使用过程中出现了什么问题?</p>
            <br/>
            <input type="checkbox" value="1"/>蓝屏死机&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="checkbox" value="2"/>程序出错,崩溃
            <input type="checkbox" value="3"/>找不到路径
            <br/>
            <input type="checkbox" value="4"/>无法加载线路图
            <input type="checkbox" value="5"/>防火墙阻止&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="checkbox" value="6"/>无法搜索
            <br/>
            <input type="checkbox" value="7"/>搜索卡顿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="checkbox" value="8"/>黑屏&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="checkbox" value="9"/>闪屏
            <br/>
            <br/>
            <span style="color: ghostwhite; font-size: 20px; margin-left: 20px;">如果上述没有您的问题,请留下您的意见和建议:(选填)</span>
            <br/>
            <br/>
            <!--<input type="text" style="width: 740px; height: 300px; margin: 0 auto;margin-left: 20px;scroll:auto;background-color: #A8B2BE;border: 1px dotted #FF1CFF;"/>-->
            <div>
                <div class="list_con">
                    <h2 >Input You Opinion</h2>
                    <input type="text" name="" id="txt1" class="inputtxt" style="width: 150px;">
                    <input type="button" name="" value="增加" id="btn1" class="inputbtn" style="width: 50px;">

                    <ul id="list" class="list">
                        <li><span>您的意见是我们最宝贵的财富</span><a href="javascript:;" class="up"> ↑ </a><a href="javascript:;" class="down"> ↓ </a><a href="javascript:;" class="del">删除</a></li>
                    </ul>

                </div>
            </div>
            <br/>
            <hr/>
            <br/>
            <span style="color: ghostwhite; font-size: 20px; margin-left: 20px;">请留下您的联系方式便于我们跟踪改进:(先填)</span>
            <br/>
            <span style="color: ghostwhite; font-size: 20px; margin-left: 20px;">电话/QQ</span>
            <input id="youinput" type="text" style="width: 300px; height: 30px; margin-left: 0px;"/>
            <br/>
            <br/>
            <input type="button" value="确定" style="width: 80px;height: 40px; margin-left: 130px;"/>
            <input type="button" value="取消" style="width: 80px;height: 40px; margin-left: 30px;"/>
        </div>
        <div>

        </div>
    </div>


</div>
    </form>
</body>
</html>