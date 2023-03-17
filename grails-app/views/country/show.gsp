<html>
<head>
    <meta name="layout" content="main"/>
    <title>Страна: ${this.country.name}</title>
</head>

<body>
<header>
    <div class="container">
        <div class="row justify-content-center">
            <h1 class="display-4 text-center">Страна: ${this.country.name}</h1>
        </div>
    </div>
</header>

<section>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="nav buttons justify-content-center mb-1">
                    <ul>
                        <li><g:link class="list" action="index">Список стран</g:link></li>
                        <li><g:link class="create" action="create">Добавить новую страну</g:link></li>
                    </ul>
                    <g:form resource="${this.country}" method="DELETE">
                        <g:link class="edit" action="edit" resource="${this.country}">Редактировать</g:link>
                        <input class="delete" type="submit" value="Удалить"
                               onclick="return confirm('Вы уверены? C удалением страны последует удаление отелей данной страны!');"/>
                    </g:form>
                </div>

                <div class="bg-light">
                    <g:if test="${flash.message}">
                        <div class="message">${flash.message}</div>
                    </g:if>


                    <div class="p-3 text-center">
                        <p class="h5">ID: ${this.country.id}</p>
                        <p class="h5">Название страны: ${this.country.name}</p>
                        <p class="h5">Столица страны: ${this.country.capital}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>