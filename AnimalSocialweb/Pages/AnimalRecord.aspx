<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterSite.Master" AutoEventWireup="true" CodeBehind="AnimalRecord.aspx.cs" Inherits="AnimalSocialweb.AnimalRecord" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row" id="ProcessPanel">
            <div class="col-lg-6">
                <div class="form-group">
                    <label>Race</label>
                    <select class="form-control" id="RaceDropDown" name="RaceDropDown" data-rule-min="1" required="required">
                        
                    </select>
                    <button type="button" id="RaceAddButton" class="btn btn-success" ><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></button>
                
                </div>
                
                <div class="form-group">
                    <label>Animal Name</label>
                    <input class="form-control" placeholder="Animal Name" id="InputAnimalName" name="InputAnimalName" data-rule-minlength="3" required="required" />
                </div>

                <div class="form-group">
                    <label>Gender</label>
                    <select class="form-control" id="SelectGender" name="SelectGender" <%--data-rule-min="1"--%> required="required">
                        <option>Select</option>
                        <option value="0">Male</option>
                        <option value="1">Female</option>
                    </select>
                </div>


                <div class="form-group">
                    <label>BirthOfDate</label>
                    <input type="date" id="InputDate" required="required">
                </div>

                <div class="form-group">
                    <button type="button" id="SaveButton" class="btn btn-default">Save <span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span></button>
                </div>
            </div>
            <div class="col-lg-6">


                
                <div class="form-group">
                    <label>Animal QrCode</label>
                    <div id="qrCode" style="width: 300px; height: 300px;">
                    </div>
                </div>

            </div>
        </div>
    </div>
    

    <div class="modal fade" id="NewRaceModal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" >New Race</h4>
            </div>
            <div class="modal-body">
                <div class="form-group" id="AddRacePanel">
                    <label>New Race</label>
                    <input class="form-control" placeholder="Race Name" id="InputRaceName" />
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="RaceSaveButton" class="btn btn-success" data-dismiss="modal">Add Race <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
            </div>
        </div>
    </div>
</div>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
    <%-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>--%>

    <script>
        $(document).ready(function () {
            $("#SaveButton").prop('disabled', true);

            $("#form1").validate({
                errorClass: 'text-danger'                
                
            });

        //rules: {
        //        RaceDropDown: {
        //            required: true,
        //            min: 1
        //        }
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
                        $("#RaceDropDown").append("<option>Please Select</option>");
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
                        var element = "<option value='" + data.Id + "'>" + data.Name + "</option>";
                        $("#RaceDropDown").append(element);
                    }
                }).complete(function () {
                    $("#waitScreen").fadeOut();
                });;
            });
            $("#RaceAddButton").click(function () {
                $("#InputRaceName").val("");
                $("#NewRaceModal").modal("show");
            });

            $(document).change(function () {
                var status = $("#form1").valid(); 
                var raceId = $("#RaceDropDown").val() * 1;
                //var raceDropDown = $("#RaceDropDown option:selected").text();
                var inputAnimalName = $("#InputAnimalName").val();
                var selectGender = $("#SelectGender").val();
                var inputDate = $("#InputDate").val();
                if (status) {
                    $("#SaveButton").prop('disabled', false);

                    $("#SaveButton").click(function () {
                        $("#InputRaceName").prop("disabled", true);
                        $("#RaceSaveButton").prop("disabled", true);

                        if ($("#form1").valid())
                        {
                            swal({
                                title: "Save",
                                text: "Saving",
                                type: "info",
                                showCancelButton: true,
                                closeOnConfirm: false,
                                showLoaderOnConfirm: true,
                            },
                        function () {
                            $.ajax({
                                type: "POST",
                                url: "Handlers/Dropdown.ashx",
                                data: "&RequestType=AnimalPost" + "&raceId=" + raceId + "&inputAnimalName=" + inputAnimalName + "&selectGender=" + selectGender + "&inputDate=" + inputDate,
                                dataType: "json",
                                success: function (data) {
                                    $("#AddRacePanel").css("visibility", "hidden");
                                    $("#RaceSaveButton").css("visibility", "hidden");

                                    $("#qrCode").html("").qrcode({
                                        text: "http://logicyazilim.com/?animalId=" + data.Id
                                    });
                                    $("#SelectGender").val(-1);
                                    $("#RaceDropDown").val(-1);
                                    $("#InputAnimalName").val("");
                                    $("#InputDate").val("");
                                    swal("OK!", "Record saved!", "success");
                                },
                                error: function () {
                                    swal("Error!", "Can't Record saved!", "error");
                                }
                            });

                        });
                        }
                    });
                }
            });
        });
     </script>
</asp:Content>
