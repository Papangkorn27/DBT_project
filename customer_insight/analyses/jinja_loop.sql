{%set lists = ["sales_id", "date_sk","gross_amount"]%}

{%set inc_date = 1%}
{%set last_date = 3%}

SELECT
    {% for i in lists%}
        {{i}}
        {%if not loop.last%}, {% endif%}
    {%endfor%}

FROM
    {{ref("bronze_sales")}}

{%if inc_date == 1%}
    WHERE date_sk > {{last_date}}

{%endif%}
