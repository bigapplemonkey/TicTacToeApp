<%@ page import="grails.converters.JSON" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="startbootstrap"/>
    %{--<title>Welcome to Grails</title>--}%
</head>

<body>
<div class="row">

    <div class="col-sm-12">
        <div class="btn- btn-group" role="group" aria-label="..." style="margin-right:20px;">
            <button id="p2p" type="button" class="btn btn-warning pkGm" onclick="pkGm(this.id)">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                &nbsp;VS&nbsp;
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            </button>
            <button id="c2p" type="button" class="btn btn-default pkGm" onclick="pkGm(this.id)">
                <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
                &nbsp;VS&nbsp;
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            </button>
            <button id="p2c" type="button" class="btn btn-default pkGm" onclick="pkGm(this.id)">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                &nbsp;VS&nbsp;
                <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
            </button>
        </div>
        <button type="button" class="btn btn-info pkGm" onclick="strGm()" style="margin-right:3px;">
            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
            &nbsp;Start
        </button>
        <g:link action="index">
            <button type="submit" class="btn btn-default" id="refreshButton">
                <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                &nbsp;Restart
            </button>
        </g:link>
    </div>
</div>

<div class="row">
    <div class="col-sm-3"></div>

    <div class="col-sm-6" style="border: dotted 1.5px black;padding-top: 10px;padding-bottom: 0px;padding-left: 20px;padding-right: 20px;margin-top: 15px;">
        <div class="row">
            <div class="col-sm-4 portfolio-item btn">
                <img id="cell00" class="img-responsive img-rounded cell"
                     src="${request.contextPath}/startbootstrap/img/portfolio/safe.png"
                     class="img-responsive" alt=""
                     style="opacity: 0.3;margin-bottom: 10px;">
            </div>

            <div class="col-sm-4 portfolio-item btn">
                <img id="cell01" class="img-responsive img-rounded cell"
                     src="${request.contextPath}/startbootstrap/img/portfolio/safe.png"
                     class="img-responsive" alt=""
                     style="opacity: 0.3;margin-bottom: 10px;">
            </div>

            <div class="col-sm-4 portfolio-item btn">
                <img id="cell02" class="img-responsive img-rounded cell"
                     src="${request.contextPath}/startbootstrap/img/portfolio/safe.png"
                     class="img-responsive" alt=""
                     style="opacity: 0.3;margin-bottom: 10px;">
            </div>
        </div>

        <div class="row">
            <div class="col-sm-4 portfolio-item btn">
                <img id="cell10" class="img-responsive img-rounded cell"
                     src="${request.contextPath}/startbootstrap/img/portfolio/safe.png"
                     class="img-responsive" alt=""
                     style="opacity: 0.3;margin-bottom: 10px;">
            </div>

            <div class="col-sm-4 portfolio-item btn">
                <img id="cell11" class="img-responsive img-rounded cell"
                     src="${request.contextPath}/startbootstrap/img/portfolio/safe.png"
                     class="img-responsive" alt=""
                     style="opacity: 0.3;margin-bottom: 10px;">
            </div>

            <div class="col-sm-4 portfolio-item btn">
                <img id="cell12" class="img-responsive img-rounded cell"
                     src="${request.contextPath}/startbootstrap/img/portfolio/safe.png"
                     class="img-responsive" alt=""
                     style="opacity: 0.3;margin-bottom: 10px;">
            </div>
        </div>

        <div class="row">
            <div class="col-sm-4 portfolio-item btn">
                <img id="cell20" class="img-responsive img-rounded cell"
                     src="${request.contextPath}/startbootstrap/img/portfolio/safe.png"
                     class="img-responsive" alt=""
                     style="opacity: 0.3;margin-bottom: 10px;">
            </div>

            <div class="col-sm-4 portfolio-item btn">
                <img id="cell21" class="img-responsive img-rounded cell"
                     src="${request.contextPath}/startbootstrap/img/portfolio/safe.png"
                     class="img-responsive" alt=""
                     style="opacity: 0.3;margin-bottom: 10px;">
            </div>

            <div class="col-sm-4 portfolio-item btn">
                <img id="cell22" class="img-responsive img-rounded cell"
                     src="${request.contextPath}/startbootstrap/img/portfolio/safe.png"
                     class="img-responsive" alt=""
                     style="opacity: 0.3;margin-bottom: 10px;">
            </div>
        </div>
    </div>

    <div class="col-sm-3"></div>

</div>

<div class="row" style="margin-top:10px;padding-top:5px">
    <div class="col-sm-3"></div>

    <div class="col-sm-2">
        <img id="pl1Img" class="img-responsive player"
             src="${request.contextPath}/startbootstrap/img/player.png" alt="">
    </div>

    <div class="col-sm-2">
        <h3 id="curPl" style="text-align: center;">Click start!</h3>
    </div>

    <div class="col-sm-2">
        <img id="pl2Img" class="img-responsive player"
             src="${request.contextPath}/startbootstrap/img/player.png" alt="">
    </div>

    <div class="col-sm-3"></div>
</div>

<script type="text/javascript">
    var plImgs = ${disImgs as JSON};
</script>

</body>

</html>

