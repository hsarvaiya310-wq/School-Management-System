<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="schoolms.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register - School Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8fafc;
            color: #334155;
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            display: flex;
            max-width: 1000px;
            width: 100%;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        .illustration-section {
            flex: 1;
            background: linear-gradient(135deg, #2563eb 0%, #1e40af 100%);
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
        }

        .illustration-section h2 {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .illustration-section p {
            font-size: 16px;
            opacity: 0.9;
            max-width: 300px;
        }

        .illustration {
            margin: 40px 0;
            font-size: 120px;
        }

        .form-section {
            flex: 1;
            padding: 50px 40px;
        }

        .logo {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 22px;
            color: #1e293b;
        }

        .logo-icon {
            background: #2563eb;
            color: white;
            width: 36px;
            height: 36px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            font-weight: 600;
        }

        h1 {
            font-size: 28px;
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #64748b;
            margin-bottom: 30px;
            font-size: 15px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 6px;
            color: #475569;
        }

        .textbox {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.2s ease;
            background-color: #f8fafc;
        }

        .textbox:focus {
            outline: none;
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
            background-color: #fff;
        }

        .password-container {
            position: relative;
        }

        .toggle-password {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #64748b;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-register {
            width: 100%;
            padding: 14px;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.2s ease;
            margin-top: 10px;
        }

        .btn-register:hover {
            background: #1d4ed8;
        }

        .login-link {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #64748b;
        }

        .login-link a {
            color: #2563eb;
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: #dc2626;
            font-size: 13px;
            margin-top: 5px;
            display: none;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            
            .illustration-section {
                padding: 30px 20px;
            }
            
            .form-section {
                padding: 30px 25px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="illustration-section">
                <h2>Join Our School Community</h2>
                <p>Create your account to access the school management system and all its features.</p>
                <div class="illustration">🏫</div>
                <p>Already have an account? <a href="Login.aspx" style="color: white; font-weight: 500;">Sign in here</a></p>
            </div>
            
            <div class="form-section">
                <div class="logo">
                    <div class="logo-icon">S</div>
                    SchoolMS
                </div>
                
                <h1>Create Account</h1>
                <p class="subtitle">Fill in your details to register for an account</p>
                
                <div class="form-group">
                    <label for="txtnm">Full Name</label>
                    <asp:TextBox ID="txtnm" runat="server" CssClass="textbox" placeholder="Enter your full name"></asp:TextBox>
                    <div class="error-message" id="nameError">Please enter your full name</div>
                </div>
                
                <div class="form-group">
                    <label for="txteml">Email Address</label>
                    <asp:TextBox ID="txteml" runat="server" CssClass="textbox" placeholder="Enter your email address"></asp:TextBox>
                    <div class="error-message" id="emailError">Please enter a valid email address</div>
                </div>
                
                <div class="form-group">
                    <label for="txtpwd">Password</label>
                    <div class="password-container">
                        <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" CssClass="textbox" placeholder="Create a password"></asp:TextBox>
                        <button type="button" class="toggle-password" onclick="togglePassword('txtpwd')">Show</button>
                    </div>
                    <div class="error-message" id="passwordError">Password must be at least 8 characters</div>
                </div>
                
                <div class="form-group">
                    <label for="txtcompwd">Confirm Password</label>
                    <div class="password-container">
                        <asp:TextBox ID="txtcompwd" runat="server" TextMode="Password" CssClass="textbox" placeholder="Confirm your password"></asp:TextBox>
                        <button type="button" class="toggle-password" onclick="togglePassword('txtcompwd')">Show</button>
                    </div>
                    <div class="error-message" id="confirmError">Passwords do not match</div>
                </div>
                
                <asp:Button ID="Button1" runat="server" Text="Create Account" OnClick="Button1_Click" CssClass="btn-register" />
                
                <p class="login-link">Already have an account? <a href="Login.aspx">Sign in here</a></p>
            </div>
        </div>
    </form>

    <script>
        function togglePassword(textboxId) {
            const textbox = document.getElementById(textboxId);
            const toggleButton = textbox.parentNode.querySelector('.toggle-password');
            
            if (textbox.type === 'password') {
                textbox.type = 'text';
                toggleButton.textContent = 'Hide';
            } else {
                textbox.type = 'password';
                toggleButton.textContent = 'Show';
            }
        }

        // Simple client-side validation
        document.getElementById('Button1').addEventListener('click', function(event) {
            let isValid = true;
            
            // Name validation
            const name = document.getElementById('txtnm').value;
            if (name.trim() === '') {
                document.getElementById('nameError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('nameError').style.display = 'none';
            }
            
            // Email validation
            const email = document.getElementById('txteml').value;
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                document.getElementById('emailError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('emailError').style.display = 'none';
            }
            
            // Password validation
            const password = document.getElementById('txtpwd').value;
            if (password.length < 8) {
                document.getElementById('passwordError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('passwordError').style.display = 'none';
            }
            
            // Confirm password validation
            const confirmPassword = document.getElementById('txtcompwd').value;
            if (password !== confirmPassword) {
                document.getElementById('confirmError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('confirmError').style.display = 'none';
            }
            
            if (!isValid) {
                event.preventDefault();
            }
        });
    </script>
</body>
</html>