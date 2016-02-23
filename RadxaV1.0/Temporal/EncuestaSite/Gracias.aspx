<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gracias.aspx.cs" Inherits="ATEncuesta.Gracias" %>

<!DOCTYPE html>

<html class="no-js">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Gracias</title>
    <meta name="description" content="Gracias" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/main.css" />

    <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>
<body>
    
    <div class="container">
        <div class="row">
            <div id="registro" class=" col-lg-8 col-md-8 col-sm-12 col-lg-offset-2 col-md-offset-2">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <img src="img/logo.png" alt="AT Solutions And Support" />
                    </div>
                    <div id="alerta" class="col-md-12 bg-danger text-center">
                        <p><b><asp:label runat="server"  id="L1" Text="Gracias por ayudarnos a mejorar"></asp:label></b></p>
                    </div>
                    <form id="GraciasForm" runat="server" class="col-md-12">
                        <fieldset>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
