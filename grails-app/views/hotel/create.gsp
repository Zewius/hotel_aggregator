<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Добавление отеля</title>
</head>

<body>
<header>
    <div class="container">
        <div class="row justify-content-center">
            <h1 class="display-4 text-center">Добавление отеля</h1>
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
                    </ul>
                </div>

                <div class="bg-light">
                    <g:if test="${flash.message}">
                        <div class="message">${flash.message}</div>
                    </g:if>

                    <g:hasErrors bean="${this.hotel}">
                        <ul class="errors">
                            <g:eachError bean="${this.hotel}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                        error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>

                    <g:form resource="${this.hotel}" method="POST">
                        <div class="form-group p-4">
                            <label for="name">Название</label>
                            <g:textField name="name" id="name" required="true"
                                         placeholder="Введите название отеля" class="form-control"/>
                            <label for="country" class="mt-2">Страна</label>
                            <g:select name="country" from="${this.countries}" optionKey="id" optionValue="name"
                                      class="custom-select"/>
                            <label for="stars" class="mt-2">Кол-во звёзд</label>
                            <g:select name="stars" from="${1..5}" class="custom-select"/>
                            <label for="website" class="mt-2">Веб-сайт</label>
                            <g:textField name="website"
                                         placeholder="Введите адрес страницы" class="form-control"/>
                            <div class="col text-center">
                                <g:submitButton name="create" class="btn btn-primary btn-lg w-25 mt-4" value="Создать"/>
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
