<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Редактирование: ${this.country.name}</title>
</head>

<body>
<header>
    <div class="container">
        <div class="row justify-content-center">
            <h1 class="display-4 text-center">Редактирование страны</h1>
        </div>
    </div>
</header>

<section>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="nav buttons justify-content-center mb-1">
                    <ul>
                        <li><g:link class="list" action="index">Список стран</g:link></li>
                        <li><g:link class="create" action="create">Добавить новую страну</g:link></li>
                    </ul>
                </div>

                <div class="bg-light">
                    <g:if test="${flash.message}">
                        <div class="message">${flash.message}</div>
                    </g:if>

                    <g:hasErrors bean="${this.country}">
                        <ul class="errors">
                            <g:eachError bean="${this.country}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                        error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>

                    <g:form resource="${this.country}" method="PUT">
                        <div class="form-group p-4">
                            <g:hiddenField name="version" value="${this.country?.version}" />
                            <label for="name">Название</label>
                            <g:textField name="name" id="name" required="true"  value="${this.country.name}"
                                         placeholder="Введите название страны" class="form-control"/>
                            <g:hasErrors bean="${this.country}" field="name">
                                <div class="errors">Необходимо ввести корректное значение (от 3 букв) </div>
                            </g:hasErrors>
                            <label for="capital" class="mt-2">Столица</label>
                            <g:textField name="capital" id="capital" required="true" value="${this.country.capital}"
                                         placeholder="Введите название столицы" class="form-control"/>
                            <g:hasErrors bean="${this.country}" field="capital">
                                <div class="errors">Необходимо ввести корректное значение (от 3 букв)</div>
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
