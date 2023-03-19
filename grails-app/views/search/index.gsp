<%--
  Created by IntelliJ IDEA.
  User: Zewius
  Date: 14.03.2023
  Time: 22:36
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Поиск отелей</title>
</head>

<body>
<header class="header-search text-center p-5" id="header-search">
    <div class="container position-relative">
        <div class="row justify-content-center">
            <div class="col">
                <div class="text-center text-white">
                    <h1 class="display-3 mb-5">Найти отель</h1>
                    <g:form controller="search" action="search" method="GET">
                        <div class="input-group mb-3">
                            <g:textField name="prompt" value="${params.prompt ?: ""}"
                                         class="form-control form-control-lg w-50"
                                         placeholder="Введите название отеля"/>
                            <g:select name="country" from="${countryList}" value="${params.country ?: 0}" optionKey="id"
                                      optionValue="name"
                                      noSelection="[0: 'Любая страна']" class="form-control form-control-lg w-25"/>
                            <div class="input-group-append">
                                <button class="btn btn-primary btn-lg" type="submit">Найти</button>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</header>
<section class="bg-light text-center p-5">
    <div class="container">
        <g:if test="${result != null}">
            <h1 class="display-3 mb-5">Результаты поиска</h1>
            <g:if test="${result.empty}">
                <p>Ничего не найдено</p>
            </g:if>
            <g:else>
                <p>Найденных отелей по вашему запросу: ${resultCount}</p>
                <table>
                    <thead>
                    <tr>
                        <th>Название</th>
                        <th>Звёзд</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${result}" var="hotel">
                        <tr>
                            <g:if test="${hotel.website}">
                                <td><g:link title="Перейти на сайт отеля ${hotel.name}"
                                            url="${hotel.website}">${hotel.name}</g:link>
                                </td>
                            </g:if>
                            <g:else>
                                <td>${hotel.name}</td>
                            </g:else>
                            <td>${hotel.stars}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>

                <g:if test="${resultCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${resultCount ?: 0}" params="${params}"/>
                    </div>
                </g:if>
            </g:else>
        </g:if>
    </div>
</section>
</body>
</html>