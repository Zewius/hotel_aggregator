<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Редактирование: ${this.hotel.name}</title>
</head>

<body>
<header>
    <div class="container">
        <div class="row justify-content-center">
            <h1 class="display-4 text-center">Редактирование отеля</h1>
        </div>
    </div>
</header>

<section>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="nav buttons justify-content-center mb-1">
                    <ul>
                        <li><g:link class="list" action="index">Список отелей</g:link></li>
                        <li><g:link class="create" action="create">Добавить новый отель</g:link></li>
                    </ul>
                </div>

                <div class="bg-light">
                    <g:if test="${flash.message}">
                        <div class="message">${flash.message}</div>
                    </g:if>

                    <g:form resource="${this.hotel}" method="PUT">
                        <div class="form-group p-4">
                            <g:hiddenField name="version" value="${this.hotel?.version}"/>
                            <label for="name">Название</label>
                            <g:textField name="name" id="name" required="true" value="${this.hotel.name ?: ""}"
                                         placeholder="Введите название отеля" class="form-control"/>
                            <g:hasErrors bean="${this.hotel}" field="name">
                                <div class="errors">Необходимо ввести корректное значение (от 3 букв).
                                Также убедитесь, что название отеля уникально в пределах страны</div>
                            </g:hasErrors>
                            <label for="country" class="mt-2">Страна</label>
                            <g:select name="country" from="${this.countries}" value="${this.hotel.country?.id ?: 1}"
                                      optionKey="id" optionValue="name" class="custom-select"/>
                            <g:hasErrors bean="${this.hotel}" field="country">
                                <div class="errors">Необходимо выбрать страну из раскрывающего списка</div>
                            </g:hasErrors>
                            <label for="stars" class="mt-2">Кол-во звёзд</label>
                            <g:select name="stars" from="${1..5}" class="custom-select" value="${this.hotel.stars ?: 1}"/>
                            <g:hasErrors bean="${this.hotel}" field="stars">
                                <div class="errors">Необходимо указать количество звёзд отеля из раскрывающего списка</div>
                            </g:hasErrors>
                            <label for="website" class="mt-2">Веб-сайт</label>
                            <g:textField name="website"
                                         placeholder="Введите адрес страницы" class="form-control"/>
                            <g:hasErrors bean="${this.hotel}" field="website">
                                <div class="errors">Введите корректный адрес веб-сайта (должен начинаться на 'http://' или 'https://'</div>
                            </g:hasErrors>
                            <div class="col text-center">
                                <g:submitButton name="create" class="btn btn-primary btn-lg w-25 mt-4" value="Обновить"/>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
