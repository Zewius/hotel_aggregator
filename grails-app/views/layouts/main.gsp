<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
    <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-dark navbar-static-top">
    <div class="container-fluid">
        <p class="navbar-brand">Агрегатор отелей</p>
        <div class="navbar-inner">
            <ul class="nav">
                <li><g:link controller="search" action="index">Найти отель</g:link></li>
                <li><g:link controller="hotel" action="index">Справочник отелей</g:link></li>
                <li><g:link controller="country" action="index">Справочник стран</g:link></li>
            </ul>
        </div>
    </div>
</nav>

<g:layoutBody/>

</body>
</html>
