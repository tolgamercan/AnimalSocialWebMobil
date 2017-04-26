﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterSite.Master" AutoEventWireup="true" CodeBehind="AnimalRecord.aspx.cs" Inherits="AnimalSocialweb.AnimalRecord" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
    <div class="row">
    <div class="col-lg-6">
        <div class="form-group">
            <label>Race</label>
            <select class="form-control" id="RaceDropDown">
            </select>
        </div>
        <div class="form-group">
            <label>Animal Name</label>
            <input class="form-control" placeholder="Animal Name" id="InputAnimalName" />          
        </div>
        
       <div class="form-group">
  <label >Gender</label>
  <select class="form-control" id="SelectGender">
    <option value="0">Male</option>
      <option value="1">Female</option>
  </select>
</div>

        <div class="form-group"> 
            <label>BirthOfDate</label>
<input type="date" id="InputDate" > 
</div>

        <div class="form-group">
            <button type="button" id="SaveButton" class="btn btn-default" >Save <span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span></button>
        </div>
    </div>
         <div class="col-lg-6">
        <div class="form-group">
            <label>New Race</label>
            <input class="form-control" placeholder="Race Name" id="InputRaceName" />
                        
        </div>
        <div class="form-group">
            <button type="button" id="RaceSaveButton" class="btn btn-success">Add Race <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></button>
        </div>           
    </div>
</div>
        </div>
      <script>
      $(document).ready(function () {
          $("#SaveButton").prop('disabled', true);
          //$("#GenusDropDown").prop('disabled', true);
          //$("#SpeciesDropDown").prop('disabled', true);
          
          function getRaces() {
              $.ajax({
                  type: "POST",
                  url: "Handlers/DropDown.ashx",
                  data: "&RequestType=RaceDropDown",
                  dataType: "json",
                  success: function (data) {
                      $("#RaceDropDown").html("");
                      $("#RaceDropDown").append("<option value='-1'>Please Select</option>");
                      $.each(data, function (index, data) {
                          var element = "<option value='" + data.Id + "'>" + data.Name + "</option>";
                          $("#RaceDropDown").append(element);
                      });
                  }
              });

          }
          getRaces();
              $("#RaceSaveButton").click(function () {
                  $.ajax({
                      type: "POST",
                      url: "Handlers/Dropdown.ashx",
                      data: "&RequestType=RaceSaveButton" + "&InputRaceName=" + $("#InputRaceName").val(),
                      dataType: "json",
                      success: function (data) {
                          console.log(data);
                          var element = "<option value='"+data.Id+"'>" + data.Name + "</option>";
                          $("#RaceDropDown").append(element);
                      }
                  });
              });
             
              $(document).change(function () {
               
                  var raceDropDown = $("#RaceDropDown").val();
                  var inputAnimalName = $("#InputAnimalName").val();
                  var selectGender = $("#SelectGender").val();
                  var inputDate = $("#InputDate").val();
                  if (raceDropDown != "" && inputAnimalName != "" && selectGender != null && inputDate != "") {
                      console.log("tolga");
                  }
              });
             
      });
     </script>
</asp:Content>
