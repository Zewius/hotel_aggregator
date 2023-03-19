<html>
<head>
    <meta name="layout" content="main"/>
    <title>Отель: ${this.hotel.name}</title>
</head>

<body>
<header>
    <div class="container">
        <div class="row justify-content-center">
            <h1 class="display-4 text-center">Отель: ${this.hotel.name}</h1>
        </div>
    </div>
</header>

<section>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="nav buttons justify-content-center mb-1">
                    <ul>
                        <li><g:link class="list" action="index">Список отелей</g:link></li>
                        <li><g:link class="create" action="create">Добавить новый отель</g:link></li>
                    </ul>
                    <g:form resource="${this.hotel}" method="DELETE">
                        <g:link class="edit" action="edit" resource="${this.hotel}">Редактировать</g:link>
                        <input class="delete" type="submit" value="Удалить"
                               onclick="return confirm('Вы уверены?');"/>
                    </g:form>
                </div>

                <div class="bg-light">
                    <g:if test="${flash.message}">
                        <div class="message">${flash.message}</div>
                    </g:if>


                    <div class="p-3 text-center">
                        <p class="h5">ID: ${this.hotel.id}</p>

                        <p class="h5">Название отеля: ${this.hotel.name}</p>

                        <p class="h5">Расположение отеля: <g:link controller="country" action="show"
                                                                  id="${this.hotel.country.id}">${this.hotel.country.name}</g:link></p>

                        <p class="h5">Количество звёзд: ${this.hotel.stars}</p>

                        <p class="h5">Веб-сайт: ${this.hotel.website}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>