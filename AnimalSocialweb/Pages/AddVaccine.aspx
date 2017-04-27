<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterSite.Master" AutoEventWireup="true" CodeBehind="AddVaccine.aspx.cs" Inherits="AnimalSocialweb.Pages.AddVaccine" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
    <div class="row" id="ProcessPanel">
    <div class="col-lg-6">
        <div class="form-group">
            
            <label>Race</label>
            <select class="form-control" id="RaceDropDown" name="RaceDropDown" required="required" >
            </select>
        </div>
        <div class="form-group">
            <label>Animal Name</label>
            <input class="form-control" placeholder="Animal Name" id="InputAnimalName" name="InputAnimalName" maxlength="3" required="required" />          
        </div>
        
       <div class="form-group">
  <label >Gender</label>
  <select class="form-control" id="SelectGender" name="SelectGender"  required="required">
      <option value="-1">Select</option>
    <option value="0">Male</option>
      <option value="1">Female</option>
  </select>
</div>
        

        <div class="form-group"> 
            <label>BirthOfDate</label>
            <input type="date" id="InputDate" required="required" > 
            </div>

        <div class="form-group">
            <button type="button" id="SaveButton" class="btn btn-default" >Save <span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span></button>
        </div>
    </div>
         <div class="col-lg-6">
        <div class="form-group" id="AddRacePanel" >
            <label>New Race</label>
            <input class="form-control" placeholder="Race Name" id="InputRaceName"  />
                        
        </div>
            
        <div class="form-group">
            <button type="button" id="RaceSaveButton" class="btn btn-success">Add Race <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></button>
        </div>      
             <div class="form-group">
            <label>Animal QrCode</label>
            <div  id="qrCode" style="width:300px; height:300px;">
             </div>  
                </div>
                 
    </div>
</div>
        </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
</asp:Content>