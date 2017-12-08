<%-- 
    Document   : login
    Created on : 2017-3-27, 22:39:03
    Author     : T5-SKYLAKE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login</title>


        <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Open+Sans'>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/example/css/loginstyle.css">

    </head>
    <body>
        <p class="tip">Login in</p>
        <div class="cont">
            <form action="userloginAction" method="post">
                <div class="form sign-in">
                    <h2>Welcome back,</h2>
                    <label>
                        <span>Username</span>
                        <input type="text" name="username"/>
                    </label>
                    <label>
                        <span>Password</span>
                        <input type="password" name="userpw"/>
                    </label>
                    <p class="forgot-pass"><a href="${pageContext.request.contextPath}/example/contact.jsp">Forgot password?</a></p>
                    <button type="submit" class="submit">Sign In</button>
                    <button type="button" class="fb-btn">Connect with<a href="http://www.facebook.com"><span>facebook</span></a></button>
                </div>
            </form>
            <div class="sub-cont">
                <div class="img">
                    <div class="img__text m--up">
                        <h2>New here?</h2>
                        <p>Sign up and discover great amount of new opportunities!</p>
                    </div>
                    <div class="img__text m--in">
                        <h2>One of us?</h2>
                        <p>If you already has an account, just sign in. We've missed you!</p>
                    </div>
                    <div class="img__btn">
                        <span class="m--up">Sign Up</span>
                        <span class="m--in">Sign In</span>
                    </div>
                </div>
                <form action="userSignup" method="post">
                    <div class="form sign-up">
                        <h2>Time to feel like home,</h2>
                        <label>
                            <span>Name</span>
                            <input type="text" name="username"/>${requestScope.tip}
                        </label>
                        <label>
                            <span>Phonenumber</span>
                            <input type="text" name="userphone"/>
                        </label>
                        <label>
                            <span>Password</span>
                            <input type="password" name="userpw"/>
                        </label>
                        <label>
                            <span>Address</span>
                            <input type="text" name="useradd"/>
                        </label>
                        <button type="submit" class="submit">Sign Up</button>
                        <button type="button" class="fb-btn">Join with <a href="http://www.facebook.com"><span>facebook</span></a></button>
                    </div>
                </form>
            </div>
        </div>
        <a href="https://dribbble.com/shots/3306190-Login-Registration-form" target="_blank" class="icon-link">
            <img src="http://icons.iconarchive.com/icons/uiconstock/socialmedia/256/Dribbble-icon.png">
        </a>
        <a href="https://twitter.com/NikolayTalanov" target="_blank" class="icon-link icon-link--twitter">
            <img src="https://cdn1.iconfinder.com/data/icons/logotypes/32/twitter-128.png">
        </a>

        <script src="${pageContext.request.contextPath}/example/js/loginindex.js"></script>
    </body>
</html>

