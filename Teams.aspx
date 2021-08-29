<%@ Page Title="Team Members" Language="VB" MasterPageFile="~/SiteMaster.master" AutoEventWireup="false" CodeFile="Teams.aspx.vb" Inherits="Teams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="styleTeam.css"/>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="title-box">
        <h1>Our Team</h1>
         <p></p>
    </div>
    <div class="team-row">
        <div class="profile-box">
            <h4>Member<br/> 1</h4>
            <img src="images/Team/user.png"/>
            
        </div>
        <div class="profile-box">
            <h4>Member<br/> 2</h4>
            <img src="images/Team/user.png"/>

        </div>
        <div class="profile-box">
            <h4>Member<br/> 3</h4>
            <img src="images/Team/user.png"/>
        </div>
        <div class="profile-box">
            <h4>Member<br/> 4</h4>
             <img src="images/Team/user.png"/>
            <%--<img  src=""/>--%>

        </div>
    </div>
</asp:Content>

