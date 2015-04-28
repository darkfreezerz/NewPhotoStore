<%-- 
    Document   : RegLog
    Created on : Apr 28, 2015, 7:11:50 PM
    Author     : niponsarikan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
    <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>Login and Registration Form with HTML5 and CSS3</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700' rel='stylesheet' type='text/css'>
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico">
        <link rel="stylesheet" href="css/reset.css">
        <!-- CSS reset -->
        <link rel="stylesheet" href="css/style.css">
        <link href="css/SearchBox.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/stylelogin.css" />
        <link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
        <link rel="stylesheet" href="css/demo.css">
        <script src="js/modernizr.js"></script>
    </head>
    <body>
        <div>
            <div id="menu-bar" style="width:100%;height:80px;background-color:black;z-index:-9999"> <img src="img/web-logo.png" width="100" height="50" style="float:left;margin-left:50px;margin-top:15px"> </div>
            <header class="cd-header">
                <nav>
                    <ul class="cd-secondary-nav">
                        <li><a href="#0">Log In</a></li>
                        <li><a href="#0">Register</a></li>
                    </ul>
                </nav>
                <!-- cd-nav --> 

                <a class="cd-primary-nav-trigger" href="#0"> <span class="cd-menu-text">manage</span><span class="cd-menu-icon"></span> </a> <!-- cd-primary-nav-trigger --> 
            </header>
            <nav>
                <ul class="cd-primary-nav">
                    <li class="cd-label">About us</li>
                    <li><a href="#0">The team</a></li>
                    <li><a href="#0">Our services</a></li>
                    <li><a href="#0">Our projects</a></li>
                    <li class="cd-label">Work with us</li>
                    <li><a href="#0">Start a project</a></li>
                    <li><a href="#0">Join In</a></li>
                    <li><a href="#0">Create an account</a></li>
                    <li class="cd-label">Follow us</li>
                    <li class="cd-social cd-facebook"><a href="#0">Facebook</a></li>
                    <li class="cd-social cd-instagram"><a href="#0">Instagram</a></li>
                    <li class="cd-social cd-dribbble"><a href="#0">Dribbble</a></li>
                    <li class="cd-social cd-twitter"><a href="#0">Twitter</a></li>
                </ul>
            </nav>
            <div class="container" style="font-weight: 400;
                 font-size: 15px;z-index: 0">
                <section>
                    <div id="container_demo" align="center" style="margin-top:10%; margin-left:3%" > 
                        <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  --> 
                        <a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor" id="tologin"></a>
                        <div id="wrapper">
                            <div id="login" class="animate form">
                                <form  action="index.html" autocomplete="on">
                                    <h1>Log in</h1>
                                    <p>
                                        <label for="username" class="uname" data-icon="u" > Your email or username </label>
                                        <input id="username" name="username" required type="text" placeholder="myusername or mymail@mail.com" "/>

                                    </p>
                                    <p>
                                        <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                                        <input id="password" name="password" required type="password"  placeholder="eg. X8df!90EO"/>
                                    </p>
                                    <p class="keeplogin">
                                        <input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" />
                                        <label for="loginkeeping">Keep me logged in</label>
                                    </p>
                                    <p class="login button">
                                        <input type="submit" value="Login" />
                                    </p>
                                    <p class="change_link"> Not a member yet ? <a href="#toregister" class="to_register">Join us</a> </p>
                                </form>
                            </div>
                            <div id="register" class="animate form">
                                <form  action="index.html" autocomplete="on">
                                    <h1> Sign up </h1>
                                    <p>
                                        <label for="usernamesignup" class="uname" data-icon="u">Your username</label>
                                        <input id="usernamesignup" name="id" required type="text" placeholder="mysuperusername690" />
                                    </p>
                                    <p>
                                        <label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
                                        <input id="passwordsignup" name="pwd" required type="password" placeholder="eg. X8df!90EO"/>
                                    </p>
                                    <p>
                                        <label for="emailsignup" class="youmail" data-icon="e" > Your email</label>
                                        <input id="emailsignup" name="email" required type="email" placeholder="mysupermail@mail.com"/>
                                    </p>

                                    <p>
                                        <label for="usernamesignup" class="uname" data-icon="">Firstname</label>
                                        <input id="usernamesignup" name="name" required type="text" placeholder="Eden" />
                                    </p>
                                    <p>
                                        <label for="usernamesignup" class="uname" data-icon="">Lastname</label>
                                        <input id="usernamesignup" name="lname" required type="text" placeholder="Hazard" />
                                    </p>
                                    <p>
                                        <label for="usernamesignup" class="uname" data-icon="">tel</label>
                                        <input id="usernamesignup" name="tel" required type="text" placeholder="094-111-1111" />
                                    </p>
                                    <p>
                                    <p class="keeplogin">
                                        <input type="checkbox" name="role" id="loginkeeping" value="photographer" />
                                        <label for="loginkeeping">Choose if you want to be Merchant</label>
                                    </p>
                                    <p style="text-align:center">
                                        <label for="usernamesignup" class="uname" data-icon="">Add more information(For Merchant)</label>
                                    </p>
                                    <p>
                                        <label for="usernamesignup" class="uname" data-icon="">Address</label>
                                        <input id="usernamesignup" name="tel" required type="text" placeholder="11/11" />
                                    </p>
                                    <p>
                                        <label for="usernamesignup" class="uname" data-icon="">Distinct</label>
                                        <input id="usernamesignup" name="tel" required type="text" placeholder="Ladkrabang" />
                                    </p>
                                    <p>
                                        <label for="usernamesignup" class="uname" data-icon="">Province</label>
                                        <input id="usernamesignup" name="tel" required type="text" placeholder="Bangkok" />
                                    </p>
                                    <p>
                                        <label for="usernamesignup" class="uname" data-icon="">Country</label>
                                        <input id="usernamesignup" name="tel" required type="text" placeholder="Thailand" />
                                    </p>
                                    <p>
                                        <label for="usernamesignup" class="uname" data-icon="">Zipcode</label>
                                        <input id="usernamesignup" name="tel" required type="text" placeholder="11230" />
                                    </p>
                                    <p>
                                        <label for="usernamesignup" class="uname" data-icon="">Paypal ID</label>
                                        <input id="usernamesignup" name="tel" required type="text" placeholder="mysupermail@mail.com" />
                                    </p>

                                    </p>
                                    <br>

                                    <p class="signin button">
                                        <input type="submit" value="Sign up"/>
                                    </p>
                                    <p class="change_link"> Already a member ? <a href="#tologin" class="to_register"> Go and log in </a> </p>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <script src="js/jquery-2.1.1.js"></script> 
        <script src="js/main.js"></script>
    </body>
</html>
