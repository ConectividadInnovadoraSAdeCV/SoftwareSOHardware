<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Encuesta.aspx.cs" Inherits="ATEncuesta.Encuesta" %>

<!DOCTYPE html>

<html class="no-js">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Encuesta de Satisfacción</title>
    <meta name="description" content="Tu opinion cuenta y mucho!.." />
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
                        <p><b><asp:Label runat="server" id="L1" Text="¡Tu opinión cuenta y mucho!"></asp:Label></b></p>
                    </div>
                    <form id="EncuestaForm" runat="server" class="col-md-12">
                        <fieldset>
                            <div class="row-fluid">
                            </div>
                            <br />
                            <!--PREGUNTA 1 (P1) [...]nuestro servicio es-->
                            <div id="Div2" class="col-md-12 text-center">
                                <b><asp:Label runat="server" id="L2" Text="En comparación con otras alternativas del mismo tipo, nuestro servicio es:"></asp:Label><b>
                            </div>
                            <div id="radioBtn" class="col-md-12 col-sm-12">
                                <div class="control">
                                    <label class="radio radio-inline" for="radios-0">
                                        <asp:RadioButton runat="server" GroupName="P1" Text="Mucho mejor" ID="P1_1" />
                                    </label>
                                    <label class="radio radio-inline" for="radios-1" style="margin-top: 8px">
                                        <asp:RadioButton runat="server" GroupName="P1" Text="Algo mejor" ID="P1_2" />
                                    </label>
                                    <label class="radio radio-inline" for="radios-1" style="margin-top: 8px">
                                        <asp:RadioButton runat="server" GroupName="P1" Text="Más o menos igual" ID="P1_3" />
                                    </label>
                                    <label class="radio radio-inline" for="radios-1" style="margin-top: 8px">
                                        <asp:RadioButton runat="server" GroupName="P1" Text="Algo peor" ID="P1_4" />
                                    </label>
                                    <label class="radio radio-inline" for="radios-1" style="margin-top: 8px">
                                        <asp:RadioButton runat="server" GroupName="P1" Text="Mucho Peor" ID="P1_5" />
                                    </label>
                                </div>
                            </div>

                            <!-- (P2) Grado de importancia al adquirir -->
                            <div id="Div1" class="col-md-12 text-center">
                                <p><b><asp:Label runat="server" id="L3" Text="Al adquirir nuestros servicios,¿Qué tiene mas importancia?"></asp:Label></b></p>
                            </div>
                            <div id="Div4" class="col-md-12 col-sm-12">
                                <div class="control">
                                    <label class="radio radio-inline" for="radios-0">
                                        <asp:RadioButton runat="server" GroupName="P2" Text="Calidad en el servicio	" ID="P2_1" />
                                    </label>
                                    <label class="radio radio-inline" for="radios-1" style="margin-top: 8px">
                                        <asp:RadioButton runat="server" GroupName="P2" Text="Relación calidad precio" ID="P2_2" />
                                    </label>
                                    <label class="radio radio-inline" for="radios-1" style="margin-top: 8px">
                                        <asp:RadioButton runat="server" GroupName="P2" Text="Proceso de compra" ID="P2_3" />
                                    </label>
                                    <label class="radio radio-inline" for="radios-1" style="margin-top: 8px">
                                        <asp:RadioButton runat="server" GroupName="P2" Text="Experiencia de uso" ID="P2_4" />
                                    </label>
                                </div>
                            </div>

                            <!-- (P3) Grado de satisfaccion con nuestro servicio -->
                            <div id="Div5" class="col-md-12 text-center">
                                <p></p>
                                <p><b><asp:Label runat="server" id="L4" Text="Grado de satisfacción con nuestro servicio"></asp:Label></b></p>
                            </div>
                            <!--Calidad del servicio (P3)-->
                            <div class="form-group col-lg-4 col-md-2 col-sm-4">
                                <label class="form-label" for="selectbasic"></label>
                                <div class="controls">
                                    <asp:DropDownList runat="server" id="P3" name="P3-1" class="form-control">
                                        <asp:ListItem Value="-1">Calidad en el servicio</asp:ListItem>
                                        <asp:ListItem Value="10">Completamente satisfecho</asp:ListItem>
                                        <asp:ListItem Value="6">Satisfecho</asp:ListItem>
                                        <asp:ListItem Value="3">Insatisfecho</asp:ListItem>
                                        <asp:ListItem Value="0">Completamente insatisfecho</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <!-- Relacion calidad precio (4) -->
                            <div class="form-group col-lg-4 col-md-2 col-sm-4">
                                <label class="form-label" for="selectbasic"></label>
                                <div class="controls">
                                    <asp:DropDownList runat="server" id="P4" name="P3-2" class="form-control">
                                        <asp:ListItem Value="-1">Relación calidad precio</asp:ListItem>
                                        <asp:ListItem Value="10">Completamente satisfecho</asp:ListItem>
                                        <asp:ListItem Value="6">Satisfecho</asp:ListItem>
                                        <asp:ListItem Value="3">Insatisfecho</asp:ListItem>
                                        <asp:ListItem Value="0">Completamente insatisfecho</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <!-- Proceso de compra del servicio (P5) -->
                            <div class="form-group col-lg-4 col-md-2 col-sm-4">
                                <label class="form-label" for="selectbasic"></label>
                                <div class="controls">
                                    <asp:DropDownList runat="server" id="P5" name="P3-3" class="form-control">
                                        <asp:ListItem Value="-1">Proceso de compra</asp:ListItem>
                                        <asp:ListItem Value="10">Completamente satisfecho</asp:ListItem>
                                        <asp:ListItem Value="6">Satisfecho</asp:ListItem>
                                        <asp:ListItem Value="3">Insatisfecho</asp:ListItem>
                                        <asp:ListItem Value="0">Completamente insatisfecho</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <!-- Experiencia de uso (P6) -->
                            <div class="form-group col-lg-4 col-md-2 col-sm-4">
                                <label class="form-label" for="selectbasic"></label>
                                <div class="controls">
                                    <asp:DropDownList runat="server" id="P6" name="P3-4" class="form-control">
                                        <asp:ListItem Value="-1">Experiencia de uso</asp:ListItem>
                                        <asp:ListItem Value="10">Completamente satisfecho</asp:ListItem>
                                        <asp:ListItem Value="6">Satisfecho</asp:ListItem>
                                        <asp:ListItem Value="3">Insatisfecho</asp:ListItem>
                                        <asp:ListItem Value="0">Completamente insatisfecho</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>



                            <!-- (P4) ¿Como evaluaria a el personal que le atiende? -->
                            <div id="Div3" class="col-md-12 text-center">
                                <p></p>
                                <p><b><asp:Label runat="server" id="L5" Text="¿Cómo evaluaría a el personal qué le atiende?"></asp:Label></b></p>
                            </div>
                            <!--Calidad del servicio (P7)-->
                            <div class="form-group col-lg-4 col-md-2 col-sm-4">
                                <label class="form-label" for="selectbasic"></label>
                                <div class="controls">
                                    <asp:DropDownList runat="server" id="P7" name="P4-1" class="form-control">
                                        <asp:ListItem Value="-1">Fiabilidad en el servicio</asp:ListItem>
                                        <asp:ListItem Value="10">Excelente</asp:ListItem>
                                        <asp:ListItem Value="6">Buena</asp:ListItem>
                                        <asp:ListItem Value="03">Regular</asp:ListItem>
                                        <asp:ListItem Value="0">Mala</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <!-- Relacion calidad precio (P8) -->
                            <div class="form-group col-lg-4 col-md-2 col-sm-4">
                                <label class="form-label" for="selectbasic"></label>
                                <div class="controls">
                                    <asp:DropDownList runat="server" id="P8" name="P4-2" class="form-control">
                                        <asp:ListItem Value="-1">Disponibilidad del personal</asp:ListItem>
                                        <asp:ListItem Value="10">Excelente</asp:ListItem>
                                        <asp:ListItem Value="6">Buena</asp:ListItem>
                                        <asp:ListItem Value="3">Regular</asp:ListItem>
                                        <asp:ListItem Value="0">Mala</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>


                            <!--(P9)Reportes de inspeccion-->
                            <div id="Div6" class="col-md-12 text-center">
                                <p></p>
                                <p></p>
                                <b><asp:Label runat="server" id="L6" Text="¿Los reportes de inspección son adecuados a sus necesidades?"></asp:Label></b>
                            </div>
                            <div id="Div7" class="col-md-12 col-sm-12">
                                <div class="control">
                                    <label class="radio radio-inline" for="radios-0">
                                        <asp:RadioButton runat="server" GroupName="P9" Text="Si, siempre" ID="P9_1" />
                                    </label>
                                    <label class="radio radio-inline" for="radios-1" style="margin-top: 8px">
                                        <asp:RadioButton runat="server" GroupName="P9" Text="Casi siempre" ID="P9_2" />
                                    </label>
                                    <label class="radio radio-inline" for="radios-1" style="margin-top: 8px">
                                        <asp:RadioButton runat="server" GroupName="P9" Text="Pocas veces" ID="P9_3" />
                                    </label>
                                    <label class="radio radio-inline" for="radios-1" style="margin-top: 8px">
                                        <asp:RadioButton runat="server" GroupName="P9" Text="Nunca" ID="P9_4" />
                                    </label>
                                </div>
                            </div>

                            <!--(P10)Comentarios-->
                            <div id="Div8" class="col-md-12 text-center">
                                <p></p>
                                <p></p>
                                <b><asp:Label runat="server" id="L7" Text="¿Tienes algo qué decirnos?"></asp:Label></b>
                                <p></p>
                                <p></p>
                            </div>
                            <div class="form-group col-lg-12 col-md-6">
                                <div class="controls">
                                    <asp:TextBox runat="server" ID="P10" Rows="3" placeholder="..." class="form-control testBox"></asp:TextBox>
                                </div>
                            </div>

                            <!-- BOTON DE ENVIAR-->
                            <div class="form-group col-md-12 col-sm-12">
                                <label class="form-label" for="enviar"></label>
                                <div class="controls">
                                    <asp:Button runat="server" id="btEnviar" Text="Enviar" class="btn-enviar" OnClick="btEnviar_Click"/>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
