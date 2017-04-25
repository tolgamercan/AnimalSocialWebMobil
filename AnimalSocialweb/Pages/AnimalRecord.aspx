<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterSite.Master" AutoEventWireup="true" CodeBehind="AnimalRecord.aspx.cs" Inherits="AnimalSocialweb.AnimalRecord" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="col-lg-6">
    <div class="form-group">                              
                        <label>Tribes</label>
                        <select class="form-control" id="TribeDropDown" >
                            
                        </select>
        </div>
     <div class="form-group "  >                              
                        <label>Genus</label>
                        <select  class="form-control" id="GenusDropDown"></select> 
        </div>
    <div class="form-group"  >                              
                        <label>Species</label>
                        <select class="form-control" id="SpeciesDropDown"></select>
        </div>
    <div class="form-group">    
     <button type="button" id="TribesNextButton" class="btn btn-success">Next<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></button>
  </div>
</div>
    
<%--  <script>
      $(document).ready(function () {
          $("#TribesNextButton").prop('disabled', true);
          //$("#GenusDropDown").prop('disabled', true);
          //$("#SpeciesDropDown").prop('disabled', true);
              $.ajax({
                  type: "POST",
                  url: "Handlers/DropDown.ashx",
                  data:"&ReuestType=TribesDropDown",
                  dataType: "json",
                  success: function (data) {
                      $("#TribeDropDown").html("");
                      $("#TribeDropDown").append("<option>Seçiniz</option>");
                      $.each(data, function (index, data) {                    
                          var element = "<option>" + data.Name + "</option>";                 
                          $("#TribeDropDown").append(element);
                      });
                      $("#TribeDropDown").change(function () {
                          $.ajax({
                              type: "POST",
                              url: "Handlers/DropDown.ashx",
                              data: "&ReuestType=GenusDropDown",
                              dataType: "json",
                              success: function (data) {
                                  $("#GenusDropDown").html("");
                                  $("#GenusDropDown").append("<option>Seçiniz</option>");
                                  $.each(data, function (index, data) {
                                      var element1 = "<option>" + data.Name + "</option>";                 
                                      $("#GenusDropDown").append(element1);
                                  });
                                  $("#GenusDropDown").change(function () {
                                      $.ajax({
                                          type: "POST",
                                          url: "Handlers/DropDown.ashx",
                                          data: "&ReuestType=SpeciesDropDown",
                                          dataType: "json",
                                          success: function (data) {
                                              $("#SpeciesDropDown").html("");
                                              $("#SpeciesDropDown").append("<option>Seçiniz</option>");
                                              $.each(data, function (index, data) {
                                                  var element2 = "<option>" + data.Name + "</option>";                                     
                                                  $("#SpeciesDropDown").append(element2);
                                              });
                                          }
                                      });
                                  });                            
                              }
                          });
                      });
                  }
              });

             

      });
     </script>--%>
</asp:Content>
