{% test generic_non_negrative(model, column_name) %}

SELECT
    *
FROM 
    {{ model }}
WHERE
    {{ column_name }} < 0
{% endtest %}
