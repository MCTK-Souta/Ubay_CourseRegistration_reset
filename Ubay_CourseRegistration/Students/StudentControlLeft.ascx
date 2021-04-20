﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentControlLeft.ascx.cs" Inherits="Ubay_CourseRegistration.Students.StudentControlLeft" %>
<style>

    ul {
        display:block;
        list-style-type: none;
        margin: 0;
        padding: 0;
        width: 20%;
        background-color: rgb(80, 80, 80,1);
        flex-direction: row;
        position: relative;
        list-style-type: none;
        overflow:auto;
    }

    li {
        line-height: 80px;
    }

        li a {
            text-align:center;
            font-size:18px;
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
        }

            li a.active {
                background-color: #4CAF50;
                color: white;
            }

            li a:hover:not(.active) {
                background-color: #555;
                color: white;
            }

    .container {
        display: inline-flex;
        justify-content: flex-start;
        min-height: 100%;
        width:100%;
    }

    .container2 {
        display: inline-flex;
        align-content:center;
        width:80%;
        justify-content: flex-start;
        min-height: 100%;


    }
</style>
<div class="container" >
    <ul>
        <li><a href="studentinfo.aspx">個人資料</a></li>
        <li><a href="courseRecord.aspx">歷史報名紀錄</a></li>
        <li><a href="#">報名新課程</a></li>
        <li><a href="#">退課</a></li>
    </ul>