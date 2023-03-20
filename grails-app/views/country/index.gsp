<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Список стран</title>
</head>
<body>
<header>
    <div class="container">
        <div class="row justify-content-center">
            <h1 class="display-4 text-center">Список стран</h1>
        </div>
    </div>
</header>

<section>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="nav buttons justify-content-center mb-1">
                    <ul>
                        <li><g:link class="create" action="create">Добавить новую страну</g:link></li>
                    </ul>
                </div>

                <div class="bg-light">
                    <g:if test="${flash.message}">
                        <div class="message">${flash.message}</div>
                    </g:if>

                    <p class="text-center">Количество стран: ${countryCount}</p>

                    <table>
                        <thead>
                        <tr>
                            <th>Название</th>
                            <th>Столица</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${countryList}" var="country">
                            <tr>
                                <td><g:link action="show" id="${country.id}">${country.name}</g:link></td>
                                <td>${country.capital}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>

                    <g:if test="${countryCount > params.int('max')}">
                        <div class="pagination">
                            <g:paginate total="${countryCount ?: 0}" prev="Пред." next="След."/>
                        </div>
                    </g:if>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>