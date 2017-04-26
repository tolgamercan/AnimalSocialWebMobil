<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterSite.Master" AutoEventWireup="true" CodeBehind="AnimalRecord.aspx.cs" Inherits="AnimalSocialweb.AnimalRecord" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
    <div class="row">
    <div class="col-lg-6">
        <div class="form-group">
            <label>Race</label>
            <select class="form-control" id="RaceDropDown" required="required">
            </select>
        </div>
        <div class="form-group">
            <label>Animal Name</label>
            <input class="form-control" placeholder="Animal Name" id="InputAnimalName" required="required" />          
        </div>
        
       <div class="form-group">
  <label >Gender</label>
  <select class="form-control" id="SelectGender"  required="required">
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
                  var raceId = $("#RaceDropDown").val();
                  //var raceDropDown = $("#RaceDropDown option:selected").text();
                  var inputAnimalName = $("#InputAnimalName").val();
                  var selectGender = $("#SelectGender").val();
                  var inputDate = $("#InputDate").val();
                  if (raceDropDown != "" && inputAnimalName != "" && selectGender != null && inputDate != "") {
                     
                      $.ajax({
                          type: "POST",
                          url: "Handlers/Dropdown.ashx",
                          data: "&RequestType=AnimalPost"+"&raceId=" + raceId + "&inputAnimalName=" + inputAnimalName + "&selectGender=" + selectGender + "&inputDate=" + inputDate,
                          dataType: "json",
                          success: function (data) {

                          }
                      });
                  }
              });
             
      });
     </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>

</asp:Content>
