# otus_food_app

# Домашнее задание 8
## Перенести в отдельный поток задачу распознавания образов изображений

# Цель:
## Использование изолятов (фоновых потоков) для сложных вычислительных задач


# Описание/Пошаговая инструкция выполнения домашнего задания:
## Перенести код распознавания групп объектов в отдельный изолят
## Обеспечить передачу данных между основным потоком и изолятом (изображение и модель в виде набора байтов через порт, результат распознавания сериализуется как json)
## В коде распознавания объектов на изображении (при создании снимка) перейти на использование изолята

# Критерии оценки:
## Корректно определен изолят, перенесена логика распознавания - 4 балла
## Реализована передача данных между основным потоком и изолятом (сериализация json, отправка двоичных данных модели) - 3 балла
## В коде получения изображения с камеры используется изолят для определения групп объектов - 2 балла
## Форматирование кода выполнено в соответствии с правилами Dart - 1 балл
## Работа принята, если получено 6 или более баллов


# Рекомендуем сдать до: 27.12.2022

# Домашнее задание 9
## Разработка автоматических тестов для приложения (тестирование логики и виджетов)

# Цель:
## Подготовить тест для расчета калорийности блюда. Создать тест для виджет-тестирования страницы информации о рецепте.


# Описание/Пошаговая инструкция выполнения домашнего задания:
## Подготовить юнит-тест по расчету логики калорийности рецепта по списку ингредиентов
## Создать тестирование виджетов для страницы информации о рецепте (переключение "избранное", шагов приготовления рецепта, отображение всех виджетов)

# Критерии оценки:
## Создан юнит-тест для логики калорийности рецепта - 3 балла
## Создан виджет-тест для переключения избранного - 2 балла
## Создан виджет-тест для шагов приготовления рецепта - 2 балла
## Отображение всех виджетов на странице описания рецепта - 2 балла
## Форматирование кода выполнено в соответствии с правилами Dart - 1 балл
## Работа принята, если получено 6 или более баллов


## Рекомендуем сдать до: 12.01.2023

# Домашнее задание 10
## Подготовка приложения к публикации в магазине

# Цель:
## Подготовить aab-файл для публикации приложения в магазин Google Play Store.


# Описание/Пошаговая инструкция выполнения домашнего задания:
## Определить необходимые метаданные в pubspec.yaml (название приложения, версия)
## Установить ключи публикации (можно использовать отладочные ключи при отсутствии учетной записи разработчика) в build.gradle
## Выполнить сборку артефакта aab и добавить его к проекту

# Критерии оценки:
## Определены метаданные для публикации - 3 балла
## Добавлены ключи публикации и настроена релизная сборка - 3 балла
## Подготовлен артефакт aab для загрузки в магазин приложений - 4 балла
## Работа принята, если принято 6 или более баллов