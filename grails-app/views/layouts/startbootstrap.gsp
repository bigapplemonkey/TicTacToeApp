<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>My Tic-Tac-Toe</title>

    <!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
    <link href="${request.contextPath}/startbootstrap/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${request.contextPath}/startbootstrap/css/freelancer.css"
          rel="stylesheet">

    <!-- Custom Fonts -->
    <link
        href="${request.contextPath}/startbootstrap/font-awesome-4.1.0/css/font-awesome.min.css"
        rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
          rel="stylesheet" type="text/css">
    <link
        href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
        rel="stylesheet" type="text/css">

    %{--<script--}%
    %{--src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>--}%
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
    <g:layoutHead/>
    %{--<r:layoutResources/>--}%
</head>

<body id="page-top" class="index">

<!-- Navigation -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> <span
                class="icon-bar"></span> <span class="icon-bar"></span> <span
                class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#page-top">Tic - Tac - Toe</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse"
             id="bs-example-navbar-collapse-1">
            %{--<ul class="nav navbar-nav navbar-right">--}%
            %{--<li class="hidden"><a href="#page-top"></a></li>--}%
            %{--<li class="page-scroll"><a href="#portfolio">Portfolio</a></li>--}%
            %{--<li class="page-scroll"><a href="#about">About</a></li>--}%
            %{--<li class="page-scroll"><a href="#contact">Contact</a></li>--}%
            %{--</ul>--}%
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<!-- Header -->
<header>
    <div class="container" style="padding-top: 150px;padding-bottom: 30px;">
        <g:layoutBody/>
    </div>
</header>

%{--<!-- Portfolio Grid Section -->--}%
%{--<section id="portfolio">--}%
%{--<div class="container">--}%
%{--<div class="row">--}%
%{--<div class="col-lg-12 text-center">--}%
%{--<h3>Instructions</h3>--}%
%{--<hr class="star-primary">--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="row">--}%
%{--<div class="col-lg-12 text-center">--}%
%{--<p>Welcome to my Tic-Tac-Toe, in order to play please:<br/>--}%
%{--- Pick a game option from the top of the board:<br/>--}%
%{--Player Vs Player, Computer Vs Player<br/>--}%
%{--or Player Vs Computer<br/>--}%
%{--Player Vs Player would be the default option.<br/>--}%
%{--- Click Start.<br/>--}%
%{--- Click on a square. Computer will play <br/>--}%
%{--automatically.<br/>--}%
%{--- Continue playing till there is a winner <br/>--}%
%{--or till the board has been filled. <br/>--}%
%{--- Click Restart if you want to quit or start<br/>--}%
%{--a new game.</p>--}%
%{--</div>--}%
%{--</div>--}%
%{--</section>--}%

<!-- Footer -->
<footer class="text-center">

    <div class="footer-below">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">My Tic-Tac-Toe 2014</div>
            </div>
        </div>
    </div>
</footer>

<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
<div class="scroll-top page-scroll visible-xs visble-sm">
    <a class="btn btn-primary" href="#page-top"><i
        class="fa fa-chevron-up"></i>
    </a>
</div>

<g:javascript src="tictactoe.js"/>
%{--<g:javascript library="application"--}%
<g:javascript library="jquery" plugin="jquery"/>
<r:layoutResources/>
</body>

</html>
