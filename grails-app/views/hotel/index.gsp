<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Список отелей</title>
</head>

<body>
<header>
    <div class="container">
        <div class="row justify-content-center">
            <h1 class="display-4 text-center">Список отелей</h1>
        </div>
    </div>
</header>

<section>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="nav buttons justify-content-center mb-1">
                    <ul>
                        <li><g:link class="create" action="create">Добавить новый отель</g:link></li>
                    </ul>
                </div>

                <div class="bg-light">
                    <g:if test="${flash.message}">
                        <div class="message">${flash.message}</div>
                    </g:if>

                    <p class="text-center">Количество отелей: ${hotelCount}</p>

                    <table>
                        <thead>
                        <tr>
                            <th>Название</th>
                            <th>Страна</th>
                            <th>Звёздность</th>
                            <th>Веб-сайт</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${hotelList}" var="hotel">
                            <tr>
                                <td><g:link action="show" id="${hotel.id}">${hotel.name}</g:link></td>
                                <td><g:link controller="country" action="show"
                                            id="${hotel.country.id}">${hotel.country.name}</g:link></td>
                                <td>${hotel.stars}</td>
                                <td>${hotel.website}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>

                    <g:if test="${hotelCount > params.int('max')}">
                        <div class="pagination">
                            <g:paginate total="${hotelCount ?: 0}" prev="Пред." next="След."/>
                        </div>
                    </g:if>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>