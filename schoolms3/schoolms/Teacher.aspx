<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="schoolms.Teacher" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Students</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f5f7fa, #e2e8f0);
            color: #333;
        }

        h1 {
            text-align: center;
            margin: 25px 0;
            color: #007bff;
            font-size: 2rem;
            font-weight: 700;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        form#form1 > div {
            max-width: 700px;
            margin: 20px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
            margin-bottom: 20px;
        }

            table td:first-child {
                font-weight: 600;
                color: #555;
                width: 120px;
                padding-right: 10px;
            }

        input[type="text"], input[type="number"], .aspNetTextBox {
            width: 100%;
            padding: 10px 12px;
            border: 1.8px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            transition: all 0.3s ease;
        }

            input[type="text"]:focus, input[type="number"]:focus, .aspNetTextBox:focus {
                border-color: #007bff;
                outline: none;
                box-shadow: 0 0 8px rgba(0,123,255,0.4);
            }

        /* Buttons */
        .aspNetButton {
            display: inline-block;
            margin: 5px;
            padding: 12px 25px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            font-size: 15px;
            transition: all 0.3s ease;
            color: #fff;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        #BtnInsert {
            background-color: #28a745;
        }

            #BtnInsert:hover {
                background-color: #218838;
                transform: translateY(-3px);
            }

        #BunUpdate {
            background-color: #ffc107;
            color: #212529;
        }

            #BunUpdate:hover {
                background-color: #e0a800;
                transform: translateY(-3px);
            }

        #BunDelet {
            background-color: #dc3545;
        }

            #BunDelet:hover {
                background-color: #c82333;
                transform: translateY(-3px);
            }

        #BunReset {
            background-color: #6c757d;
        }

            #BunReset:hover {
                background-color: #5a6268;
                transform: translateY(-3px);
            }

        /* GridView Styling */
        #GridView1 {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            font-size: 15px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
        }

            #GridView1 th {
                background: #007bff;
                color: #fff;
                text-align: left;
                padding: 12px;
            }

            #GridView1 td {
                padding: 12px;
                border: 1px solid #ddd;
            }

            #GridView1 tr:nth-child(even) {
                background: #f9f9f9;
            }

            #GridView1 tr:hover {
                background: #f1f1f1;
                transition: 0.3s;
            }

        /* Responsive */
        @media (max-width: 600px) {
            table, tr, td {
                display: block;
                width: 100%;
            }

                table td:first-child {
                    font-weight: bold;
                    margin-bottom: 6px;
                }

            .aspNetButton {
                width: 100%;
                margin: 8px 0;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Faculty Detail</h1>
            <table>
                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:TextBox ID="txtEml" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Age:</td>
                    <td>
                        <asp:TextBox ID="txtAge" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="txtpwd" runat="server"></asp:TextBox></td>
                </tr>
            </table>

            <asp:Button ID="BtnInsert" runat="server" CssClass="aspNetButton" Text="Insert" OnClick="Button1_Click" />
            <asp:Button ID="BunUpdate" runat="server" CssClass="aspNetButton" Text="Update" OnClick="BunUpdate_Click" />
            <asp:Button ID="BunDelet" runat="server" CssClass="aspNetButton" Text="Delete" OnClick="BunDelet_Click" />
            <asp:Button ID="BunReset" runat="server" CssClass="aspNetButton" Text="Reset" OnClick="BunReset_Click" />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" GridLines="Both" BorderStyle="Solid" BorderWidth="1px">
                <Columns>
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Age" HeaderText="Age" />
                    <asp:BoundField DataField="City" HeaderText="City" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="Back" runat="server" Text="Back" OnClick="Back_Click" />
        </div>
    </form>
</body>
</html>
