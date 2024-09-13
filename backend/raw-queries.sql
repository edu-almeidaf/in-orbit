WITH "goals_created_up_to_week" AS (
  SELECT "id", "title", "desired_weekly_frequency", "created_at"
  FROM "goals"
  WHERE "goals"."created_at" <= '2024-09-15T02:59:59.999Z'
),
"goal_completion_counts" AS (
  SELECT "goal_id", COUNT("id") AS "completionCount"
  FROM "goal_completions"
  WHERE ("goal_completions"."created_at" >= '2024-09-08T03:00:00.000Z'
    AND "goal_completions"."created_at" <= '2024-09-15T02:59:59.999Z')
  GROUP BY "goal_completions"."goal_id"
)
SELECT
  "goals_created_up_to_week"."id",
  "goals_created_up_to_week"."title",
  "goals_created_up_to_week"."desired_weekly_frequency",
  COALESCE("completionCount", 0) AS "completionCount"
FROM "goals_created_up_to_week"
LEFT JOIN "goal_completion_counts"
  ON "goal_completion_counts"."goal_id" = "goals_created_up_to_week"."id";

SELECT "id", "title", "desired_weekly_frequency", "created_at"
  FROM "goals"
  WHERE "goals"."created_at" <= '2024-09-15T02:59:59.999Z';

SELECT "goal_id", COUNT("id") AS "completionCount"
  FROM "goal_completions"
  WHERE ("goal_completions"."created_at" >= '2024-09-08T03:00:00.000Z'
    AND "goal_completions"."created_at" <= '2024-09-15T02:59:59.999Z')
  GROUP BY "goal_completions"."goal_id";

WITH "goals_created_up_to_week" AS (
  SELECT "id", "title", "desired_weekly_frequency", "created_at"
  FROM "goals"
  WHERE "goals"."created_at" <= '2024-09-15T02:59:59.999Z'
),
"goals_completed_in_week" AS (
  SELECT "goal_completions"."id", "goals"."title", "goal_completions"."created_at",
    DATE("goal_completions"."created_at") AS "completedAtDate"
  FROM "goal_completions"
  INNER JOIN "goals" ON "goals"."id" = "goal_completions"."goal_id"
  WHERE ("goal_completions"."created_at" >= '2024-09-08T03:00:00.000Z'
    AND "goal_completions"."created_at" <= '2024-09-15T02:59:59.999Z')
),
"goals_completed_by_week_day" AS (
  SELECT "completedAtDate",
    JSON_AGG(
      JSON_BUILD_OBJECT(
        'id', "id",
        'title', "title",
        'completedAt', "created_at"
      )
    ) AS "completions"
  FROM "goals_completed_in_week"
  GROUP BY "completedAtDate"
)
SELECT
  (SELECT COUNT(*) FROM "goals_completed_in_week"),
  (SELECT SUM("desired_weekly_frequency") FROM "goals_created_up_to_week"),
  JSON_OBJECT_AGG(
    "completedAtDate",
    "completions"
  ) AS "goalsPerDay"
FROM "goals_completed_by_week_day";
