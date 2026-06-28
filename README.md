# Customer Insight dbt Project

This dbt project uses the Databricks adapter.

## Setup

From the repository root, install the Python/dbt dependencies:

```bash
uv sync
```

Open the dbt project folder:

```bash
cd customer_insight
```

Create a dbt profile from the example profile:

```bash
cp profilesPS.yml profiles.yml
```

Create a local `.env` file for your Databricks token:

```bash
DATABRICKS_TOKEN=your_databricks_token
```

Check `profiles.yml` and update these values for your Databricks workspace:

```yaml
catalog: dbt_tutirial_dev
host: dbc-cf4af108-eeff.cloud.databricks.com
http_path: /sql/1.0/warehouses/c1d96b3051eeb8c3
schema: default
token: "{{ env_var('DATABRICKS_TOKEN') }}"
```

Validate the dbt connection:

```bash
uv run --env-file .env dbt debug --profiles-dir .
```

Install dbt packages:

```bash
uv run --env-file .env dbt deps --profiles-dir .
```

Parse and compile the project:

```bash
uv run --env-file .env dbt parse --profiles-dir .
uv run --env-file .env dbt compile --profiles-dir .
```

Run models and tests:

```bash
uv run --env-file .env dbt run --profiles-dir .
uv run --env-file .env dbt test --profiles-dir .
```

## Cursor / dbt Power User

Install and enable the dbt Power User extension in Cursor.

The workspace has file associations configured in `.vscode/settings.json`:

```json
"files.associations": {
  "*.sql": "jinja-sql",
  "*.yml": "jinja-yaml",
  "*.yaml": "jinja-yaml"
}
```

After changing settings, reload Cursor:

```text
Cmd+Shift+P -> Developer: Reload Window
```

Then open `dbt_project.yml` and run the dbt Power User setup/validation steps.

## Notes

Do not commit real Databricks tokens to Git. The local `.env` file is ignored by Git.
