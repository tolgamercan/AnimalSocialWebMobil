<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterSite.Master" AutoEventWireup="true" CodeBehind="AnimalRecord.aspx.cs" Inherits="AnimalSocialweb.AnimalRecord" %>

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
      <script>
      $(document).ready(function () {
          $("#SaveButton").prop('disabled', true);
     
          $("#form1").validate({
              rules: {
                  RaceDropDown: {
                      required: true,
                      min: 1
                  }
              }
          });
          //$("#GenusDropDown").prop('disabled', true);
          //$("#SpeciesDropDown").prop('disabled', true);
          
          function getRaces() {
              $("#waitScreen").fadeIn();
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
              }).complete(function () {
                  $("#waitScreen").fadeOut();
              });

          }
          getRaces();

          $("#RaceSaveButton").click(function () {
              $("#waitScreen").fadeIn();
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
                  }).complete(function () {
                      $("#waitScreen").fadeOut();
                  });;
              });
             
              $(document).change(function () {
                  var status = $("#form1").valid(); console.log(status);
                  var raceId = $("#RaceDropDown").val()*1;
                  //var raceDropDown = $("#RaceDropDown option:selected").text();
                  var inputAnimalName = $("#InputAnimalName").val();
                  var selectGender = $("#SelectGender").val();
                  var inputDate = $("#InputDate").val();
                  if (status) {
                      $("#SaveButton").prop('disabled', false);
                                         
                      $("#SaveButton").click(function () {
                          $("#InputRaceName").prop("disabled", true);
                          $("#RaceSaveButton").prop("disabled", true);
                          $.ajax({
                              type: "POST",
                              url: "Handlers/Dropdown.ashx",
                              data: "&RequestType=AnimalPost" + "&raceId=" + raceId + "&inputAnimalName=" + inputAnimalName + "&selectGender=" + selectGender + "&inputDate=" + inputDate,
                              dataType: "json",
                              success: function (data) {
                                  $("#AddRacePanel").css("visibility", "hidden");
                                  $("#RaceSaveButton").css("visibility", "hidden");                    
                                  $("#qrCode").qrcode({
                                      text:"http://logicyazilim.com/?id="+data.Id
                                  });
                              }
                          });
                          
                      });
                     
                  }
              });
             
      });
     </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
    <%-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>--%>

</asp:Content>
