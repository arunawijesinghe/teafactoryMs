<%-- 
    Document   : index
    Created on : Dec 25, 2015, 8:58:08 AM
    Author     : Aruna Csw
--%>

<!DOCTYPE html>
<html lang="en">
    <head>

        <script type="text/javascript">

           
                    var img1 = new Image();
            img1.src = "img/1.jpg";
            var img2 = new Image();
            img2.src = "img/2.jpg";
            var img3 = new Image();
            img3.src = "img/1.jpg";

           





        </script>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Tea Info Management System</title>
        <link rel="icon" href="img/logo.jpg" type="image/jpg">
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/css/style.css" rel="stylesheet">
        <style type="text/css">
            a:link {
                text-decoration: none;
            }
            a:visited {
                text-decoration: none;
            }
            a:hover {
                text-decoration: none;
            }
            a:active {
                text-decoration: none;
            }
        </style>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body style="background:#fff">


        <div class="container" style="background:#ebebeb">
            <div class="row">
                <nav class="navbar navbar-pills no-margin no-padding" style="background:#9d9d9d">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" ><font color="white"><b>Tea Factory Information Management Web Portal</b></font></a>
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1" >
                            <ul class="nav navbar-nav ">
                                <li><a href="index.jsp"><font color="black"><b>Home <span class="glyphicon glyphicon-home"></span> </b></font></a></li>
                                <li><a href="#"><font color="Black"><b>Gallery <span class="glyphicon glyphicon-camera"></span></b></font></a></li>
                                <li><a href="#"><font color="Black"><b>Contact <span class="glyphicon glyphicon-phone"></span></b></font></a></li>
                                <li><a href="#"><font color="Black"><b>About <span class="glyphicon glyphicon-eye-open"></span></b></font></a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>

            </div>


            <div class="row no-margin no-padding">
                <img src="img/2.jpg" name="slide" class="img-thumbnail " width="1170" height="300">
                <script type="text/javascript">
                    
            var step = 1;
                    function slideshow() {
                        document.images.slide.src = eval("img" + step + ".src");
                        if (step < 3) {
                            step++;

                        } else
                            step = 1;
                        setTimeout("slideshow()", 2500);


                    }
                    slideshow();



                          
            
                </script>
            </div>
            <div class="row" >
                <div class="col-lg-4 " style="background: #ebebeb">
                    <div class="panel panel-default " draggable="true">
                        <div class="panel-body ">
                            <div class="page-header">
                                <h3>Sri Lankan Tea</h3>
                            </div>
                            <center><img src="img/5.jpg" class="img-thumbnail">  </center><br>
                            <p class="text-justify">Tea production is one of the main sources of foreign exchange for Sri Lanka,
                                and accounts for 2% of GDP, contributing US $1,527 million in 2013 to the economy of Sri Lanka.
                                It employs, directly or indirectly, over 1 million people, and in 1995 directly employed 215,338 on tea
                                plantations and estates.<br> The highest production of 340 
                                million kg was recorded in 2013,
                                while the production in 2014 was slighly reduced to 338 million kg.
                                <font color="white">welcome to tims web portal</font>
                            </p>
                        </div> 
                    </div></div>
                <div class="col-lg-5 no-padding" style="background: #ebebeb">
                    <div class="panel panel-default " draggable="true">
                        <div class="panel-body">
                            <div class="page-header">
                                <h3>Wijaya Group</h3>
                            </div>
                            <center><img src="img/6.jpg" class="img-thumbnail"></center><br>
                            <p class="text-justify">The "Wijaya Group of Companies" was established on 20-07-1977 with a limited number of employees to conduct the business. 
                                It has a history of over 03 decades today, 
                                and up to now, has created employment opportunities for nearly 1600 employees.<br><br>

                                Wijaya Group has 4 tea factories located in southern province.<br></p>
                            <p>
                            <ul>
                                <li>Wijaya Tea Factory ,Urala</li> 
                                <li> Maheshland Tea Factory ,Thellambura</li>
                                <li>Etambagahawila Tea Factory ,Kananke</li> 
                                <li> Nayindawaa Tea Factory ,Yakkalamulla</li>



                            </ul>


                            </p>

                        </div>

                    </div></div>
                <div class="col-lg-3" style="background:#ebebeb ">
                    <div class="panel panel-default" draggable="true">
                        <div class="panel-body" style="background:#9d9d9d">
                            <div class="page-header">
                                <h3><font color="#fff">Login</font></h3>
                            </div>

                            <form method="post" action="http://localhost:8080/Tea_infoManagementSystem/Login">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Username</label>
                                    <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
                                        <input type="text" class="form-control" placeholder="username" aria-describedby="basic-addon1" required="true" name="uname">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-star"></span></span>                           
                                        <input type="password" class="form-control" name="pword" placeholder="Password" required="true"></div>
                                </div>
                                <div class="form-group">

                                    <p >                                
                                        <button type="submit" class="btn btn-primary" >Login <span class="glyphicon glyphicon-ok"></span></button>
                                        <b><font color="green"><a href="forgetmypassword.jsp">Forget my password</font></a></b></p>
                                </div>




                            </form>
                            <hr/>
                            <div class="panel panel-default" draggable="true">
                                <div class="panel-body " style="background:#fff"><br>
                                    <span class="glyphicon glyphicon-road" ></span>ddress:                     
                                    <address>
                                        <strong>Wijaya Tea Factory.</strong><br>
                                        Rev. Pangangaloka Mw,<br>
                                        Urala,
                                        Galle<br><br>
                                        Office <span class="glyphicon glyphicon-phone-alt" ></span>: (+94)912 456-7890<br>
                                        Mobile <span class="glyphicon glyphicon-phone" ></span>: 071 229 6004
                                    </address>                         



                                </div>
                            </div>
                        </div>  


                    </div>
                </div>
                <div class="panel-footer">
                    <hr/>
                    <p align="center">All Rights Reserved.<span class="glyphicon glyphicon-copyright-mark" ></span> Copyright by 2015-2016 . Powered by ??????</p>





                </div>




            </div>




        </div>





        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.js"></script>
    </body>
</html>
